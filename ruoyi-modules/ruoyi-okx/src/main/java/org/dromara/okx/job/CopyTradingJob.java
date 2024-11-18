package org.dromara.okx.job;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.NumberUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.github.group.robot.dingtalk.core.model.DingTalkRobotResponse;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.service.DictService;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.okx.api.CopyTradingApi;
import org.dromara.okx.api.PublicApi;
import org.dromara.okx.api.TradeApi;
import org.dromara.okx.domain.*;
import org.dromara.okx.mapper.*;
import org.dromara.okx.protocol.CopyTrading.CopyTradingCurrentSubpositions;
import org.dromara.okx.protocol.CopyTrading.CopyTradingSubpositionsHistory;
import org.dromara.okx.protocol.pub.ConvertContractCoin;
import org.dromara.okx.protocol.trade.ClosePosition;
import org.dromara.okx.protocol.trade.Order;
import org.dromara.okx.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: chen
 * @Date: 2024-04-24  16:00
 * @Description: 跟单的定时任务
 * @Version: 1.0
 */
@Slf4j
@Component
public class CopyTradingJob {

    @Autowired
    private DictService dictService;

    @Autowired
    private CopyTradingApi copyTradingApi;

    @Autowired
    private PublicApi publicApi;

    @Autowired
    private TradeApi tradeApi;

    @Autowired
    private CopytradingInfoMapper copytradingInfoMapper;

    @Autowired
    private SubPosCurrentMapper subPosCurrentMapper;

    @Autowired
    private SubPosHisMapper subPosHisMapper;

    @Autowired
    private ClientUserMapper clientUserMapper;

    @Autowired
    private UserSwapConfigMapper userSwapConfigMapper;

    //注入钉钉机器人  开仓机器人
    @Autowired
    private DingMonitorOpenRobot monitorOpenRobot;

    @Autowired
    private DingMonitorCloseRobot monitorCloseRobot;

    @Autowired
    private DingTradeOrderRobot tradeOrderRobot;

    @Autowired
    private DingTradeColsePositionRobot tradeColsePositionRobot;

    /**
     * Cron表达式由6或7个字段组成，每个字段代表一个时间维度
     * 从左到右分别是秒、分钟、小时、日期、月份中的日期、月份和星期
     * 每个字段可以是一个具体的值、一个范围、一个列表、一个通配符（*）或步长（/）的组合
     * cron表达式示例
     * [秒] [分钟] [小时] [日期] [月份中的日期] [月份] [星期]
     * 秒：0-59
     * 分钟：0-59
     * 小时：0-23
     * 日期：1-31
     * 月份中的日期：1-7（周日）或0-6（周日为0）
     * 月份：1-12
     * 星期：0-7（周日为0或7）
     * 示例：
     * 0/2 * * * * ?    表示每2秒 执行任务
     * 0 0/2 * * * ?    表示每2分钟 执行任务
     * 0 0 12 * * ?     每天中午12点触发
     * 0 15 10 ? * *    每天上午10:15触发
     *
     */

    /**
     * @description: 每分钟执行一次   获取指定交易员的当前带单信息
     * @author: chen
     * @date: 2024/4/30 上午10:51
     * @Param: []
     * @return: void
     **/
    //@Scheduled(cron = "0 0/1 * * * ?")
    @Scheduled(cron = "0/8 * * * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void getCopyTradingCurrentSubpositions() throws InterruptedException {
        log.info("定时任务：获取当前带单信息  开始执行");
        //查询所有交易员的最后一次交易信息
        List<SubPosCurrent> subPosCurrentList = subPosCurrentMapper.selectNewRecord();
        Map<String, String> subPosCurrentMap = subPosCurrentList.stream().collect(Collectors.toMap(SubPosCurrent::getUniqueCode, SubPosCurrent::getOpenTime));

        //交易员信息列表
        List<CopytradingInfo> copytradingInfoList = copytradingInfoMapper.selectList();
        //限速：5次/2s
        int postCount = 0;
        for (CopytradingInfo info : copytradingInfoList) {
            //存储交易员本次新开单list
            ArrayList<CopyTradingCurrentSubpositions.Data> newTradinglist = new ArrayList<>();
            //okx查询
            CopyTradingCurrentSubpositions.Request request = new CopyTradingCurrentSubpositions.Request();
            request.setUniqueCode(info.getUniqueCode());
            List<CopyTradingCurrentSubpositions.Data> dataList = copyTradingApi.getCopyTradingCurrentSubpositions(request).getData();
            log.info("交易员：{}，当前带单记录{}条", info.getUniqueCode(), dataList.size());
            if (CollectionUtil.isNotEmpty(dataList)) {
                for (CopyTradingCurrentSubpositions.Data data : dataList) {
                    if (subPosCurrentMap.get(info.getUniqueCode()) == null || subPosCurrentMap.get(info.getUniqueCode()).isEmpty()) {
                        //没有交易记录，直接保存
                        newTradinglist.add(data);
                    } else {
                        //如果比数据库里面的开单时间大，说明是新开单
                        if (Long.parseLong(data.getOpenTime()) > Long.parseLong(subPosCurrentMap.get(info.getUniqueCode()))) {
                            newTradinglist.add(data);
                        }
                    }
                }
            }
            if (CollectionUtil.isNotEmpty(newTradinglist)) {
                saveCurrentDBAndSendMsg(newTradinglist, info);
                //开启跟单操作
                //tradeOrder(newTradinglist, info);
            }
            postCount++;
            if (postCount >= 5) {
                postCount = 0;
                Thread.sleep(3000);
            }

        }
        log.info("定时任务：获取当前带单信息  执行完毕");
    }


    /**
     * @description: 获取交易员的带单历史信息，用来判断交易员什么时候平仓了
     * @author: chen
     * @date: 2024/4/30 上午10:51
     * @Param: []
     * @return: void
     **/
    //@Scheduled(cron = "0 0/1 * * * ?")
    @Scheduled(cron = "0/9 * * * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void getCopyTradingSubpositionsHistory() throws InterruptedException {
        log.info("定时任务：获取历史带单信息  开始执行");
        //查询所有交易员的最后一次平仓信息
        List<SubPosHis> subPosHisList = subPosHisMapper.selectNewRecord();
        Map<String, String> subPosHisMap = subPosHisList.stream().collect(Collectors.toMap(SubPosHis::getUniqueCode, SubPosHis::getCloseTime));
        //交易员最后一次平仓的id
        Map<String, String> subPosHisIdMap = subPosHisList.stream().collect(Collectors.toMap(SubPosHis::getUniqueCode, SubPosHis::getSubPosId));
        int postCount = 0;
        //交易员信息列表
        List<CopytradingInfo> copytradingInfoList = copytradingInfoMapper.selectList();
        for (CopytradingInfo info : copytradingInfoList) {
            //存储交易员本次新平仓list
            ArrayList<CopyTradingSubpositionsHistory.Data> newCloseTradinglist = new ArrayList<>();
            //okx查询
            CopyTradingSubpositionsHistory.Request request = new CopyTradingSubpositionsHistory.Request();
            request.setUniqueCode(info.getUniqueCode());
            if (subPosHisIdMap.get(info.getUniqueCode()) != null && !subPosHisIdMap.get(info.getUniqueCode()).isEmpty()) {
                request.setBefore(subPosHisIdMap.get(info.getUniqueCode()));
            }
            List<CopyTradingSubpositionsHistory.Data> dataList = copyTradingApi.getCopyTradingSubpositionsHistory(request).getData();
            log.info("交易员：{}，历史带单记录{}条", info.getUniqueCode(), dataList.size());
            if (CollectionUtil.isNotEmpty(dataList)) {
                //取第一条，也就是最后一次卖出信息
                CopyTradingSubpositionsHistory.Data lastSubPosHis = dataList.get(0);
                if (subPosHisMap.get(info.getUniqueCode()) == null || subPosHisMap.get(info.getUniqueCode()).isEmpty()) {
                    //没有交易记录，直接保存
                    newCloseTradinglist.add(lastSubPosHis);
                } else {
                    //如果比数据库里面的卖出时间大，说明是新卖出
                    //这里需要判断，防止异常，有的交易员没有全部平仓，就导致平仓时间为空
                    if (lastSubPosHis.getCloseTime() == null || lastSubPosHis.getCloseTime().isEmpty() || lastSubPosHis.getCloseTime().isBlank()) {
                        lastSubPosHis.setCloseTime(System.currentTimeMillis() + "");
                    }
                    if (Long.parseLong(lastSubPosHis.getCloseTime()) > Long.parseLong(subPosHisMap.get(info.getUniqueCode()))) {
                        newCloseTradinglist.add(lastSubPosHis);
                    }
                }
            }
            if (CollectionUtil.isNotEmpty(newCloseTradinglist)) {
                saveCloseDBAndSendMsg(newCloseTradinglist, info);
                //移除开仓表的数据
                removeCurrentDB(newCloseTradinglist);
                //开启平仓操作
                //tradeClosePosition(newCloseTradinglist, info);
            }
            postCount++;
            if (postCount >= 5) {
                postCount = 0;
                Thread.sleep(3000);
            }

        }
        log.info("定时任务：获取历史带单信息  执行完毕");
    }

    /**
     * @description: 跟单
     * @author: chen
     * @date: 2024/5/8 下午4:28
     **/
    private void tradeOrder(ArrayList<CopyTradingCurrentSubpositions.Data> newTradinglist, CopytradingInfo info) {
        //获取数据库配置的跟单信息
        List<UserSwapConfig> userSwapConfigList = userSwapConfigMapper.selectList();
        Map<String, List<UserSwapConfig>> userSwapConfigMap = userSwapConfigList.stream().collect(Collectors.groupingBy(UserSwapConfig::getUniqueCode));
        if (!userSwapConfigMap.containsKey(info.getUniqueCode())) {
            return;
        }
        log.info("定时任务：开始跟单，当前交易员：{}", info.getName());
        newTradinglist.forEach(data -> {
            //时间校验，时间超出1分钟的不进行跟单，可能是程序停止了，导致出现的问题，这时候跟单，可能会因为波动大，导致亏损
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - Long.parseLong(data.getOpenTime()) > 60000) {
                log.info("定时任务：当前交易员：{}，时间超出1分钟，不进行跟单", info.getName());
            } else {
                Order.Request request = new Order.Request();
                request.setInstId(data.getInstId());
                request.setTdMode(data.getMgnMode());
                //自己传输的订单号，可以跟数据库的数据进行联动
                request.setClOrdId("test1111");
                if ("net".equals(data.getPosSide())) {
                    //	持仓方向
                    //在开平仓模式下必填，且仅可选择 long 或 short。 仅适用交割、永续。
                    request.setPosSide("");
                    //net：买卖模式（subPos为正代表开多，subPos为负代表开空）
                    if (Double.parseDouble(data.getSubPos()) >= 0) {
                        request.setSide("buy");  //buy  sell
                    } else {
                        request.setSide("sell");
                    }
                } else if ("long".equals(data.getPosSide())) {
                    request.setSide("buy");
                    request.setPosSide("long");
                } else if ("short".equals(data.getPosSide())) {
                    request.setSide("sell");
                    request.setPosSide("short");
                }
                request.setOrdType("market");
                //market 市价委托 不需要设置开仓价格
                //request.setPx(data.getOpenAvgPx());
                ConvertContractCoin.Request convertRequest = new ConvertContractCoin.Request();
                convertRequest.setInstId(data.getInstId());
                convertRequest.setPx(data.getOpenAvgPx());
                //获取某个交易员配置的信息列表
                List<UserSwapConfig> uniqueCodeConfigList = userSwapConfigMap.get(data.getUniqueCode());
                if (CollectionUtil.isNotEmpty(uniqueCodeConfigList)) {
                    for (UserSwapConfig config : uniqueCodeConfigList) {
                        if (config.getInstId().equals(data.getInstId())) {
                            //币的持仓量=本金u*倍数/当前市价
                            convertRequest.setSz(String.valueOf(Double.parseDouble(config.getNum()) * Double.parseDouble(config.getLever()) / Double.parseDouble(data.getOpenAvgPx())));
                            ConvertContractCoin.Response response1 = publicApi.convertContractCoin(convertRequest);
                            List<ConvertContractCoin.Data> data1 = response1.getData();
                            request.setSz(data1.get(0).getSz());
                            Order.Response response = tradeApi.order(request);
                            //跟单完毕，发送通知
                            sendOrderMsg(data, info, config, response);
                            break;
                        }
                    }
                } else {
                    log.warn("当前交易员：{},暂未配置跟单信息", info.getName());
                }
                if (StringUtils.isBlank(convertRequest.getSz())) {
                    log.warn("当前交易员：{},交易币种{},暂未配置跟单信息", info.getName(), data.getInstId());
                    //未配置的，默认投入50u，按照交易员开的倍数走
                    //币的持仓量=本金u*倍数/当前市价
                    convertRequest.setSz(String.valueOf(50 * Double.parseDouble(data.getLever()) / Double.parseDouble(data.getOpenAvgPx())));
                    ConvertContractCoin.Response response1 = publicApi.convertContractCoin(convertRequest);
                    List<ConvertContractCoin.Data> data1 = response1.getData();
                    request.setSz(data1.get(0).getSz());
                    Order.Response response = tradeApi.order(request);
                    //跟单完毕，发送通知
                    sendOrderMsg(data, info, uniqueCodeConfigList.get(0), response);
                }

            }
        });
    }

    /**
     * @description: 跟单完毕，发送通知
     * @author: chen
     * @date: 2024/5/8 下午5:38
     * @Param: [data, info, response]
     * @return: void
     **/
    private void sendOrderMsg(CopyTradingCurrentSubpositions.Data data, CopytradingInfo info, UserSwapConfig config, Order.Response response) {
        StringBuilder sb = new StringBuilder();
        if ("0".equals(response.getCode())) {
            //跟单成功
            sb.append("恭喜您，跟单成功！").append(System.lineSeparator());
        } else {
            sb.append("很抱歉，跟单失败啦！").append(System.lineSeparator());
            sb.append("失败原因：！").append(response.getMsg()).append(System.lineSeparator());
        }
        sb.append("交易员：").append(info.getName()).append(System.lineSeparator());
        sb.append("交易货币：").append(data.getInstId()).append(System.lineSeparator());
        if ("net".equals(data.getPosSide())) {
            //net：买卖模式（subPos为正代表开多，subPos为负代表开空）
            if (Double.parseDouble(data.getSubPos()) >= 0) {
                sb.append("持仓方向：").append("开多").append(System.lineSeparator());
            } else {
                sb.append("持仓方向：").append("开空").append(System.lineSeparator());
            }
        } else {
            sb.append("持仓方向：").append(dictService.getDictLabelNotWeb("sub_pos_current_pos_side", data.getPosSide())).append(System.lineSeparator());
        }
        sb.append("保证金模式：").append(dictService.getDictLabelNotWeb("sub_pos_current_mgn_mode", data.getMgnMode())).append(System.lineSeparator());
        sb.append("杠杆倍数：").append(data.getLever()).append(System.lineSeparator());
        sb.append("开仓均价：").append(data.getOpenAvgPx()).append(System.lineSeparator());
        //sb.append("开仓时间：").append(SubPosCurrent.getOpenTimeDate()).append(System.lineSeparator());
        sb.append("开仓时间：").append(DateTimeUtil.formatDate(new Date(Long.parseLong(data.getOpenTime())), DateTimeUtil.standard_format)).append(System.lineSeparator());
        sb.append("持仓数量：").append(data.getSubPos()).append(System.lineSeparator());
        sb.append("产品类型：").append(dictService.getDictLabelNotWeb("sub_pos_current_inst_type", data.getInstType())).append(System.lineSeparator());
        sb.append("保证金：").append(data.getMargin()).append(System.lineSeparator());
        sb.append("最新价格：").append(data.getMarkPx()).append(System.lineSeparator());
        sb.append("当前收益：").append(NumberUtil.decimalFormatMoney(Double.parseDouble(data.getUpl()))).append(System.lineSeparator());
        sb.append("当前收益率：").append(NumberUtil.formatPercent(Double.parseDouble(data.getUplRatio()), 2)).append(System.lineSeparator());
        //发送消息
        ClientUser clientUser = clientUserMapper.selectById(config.getUserId());
        List<String> mobileList = List.of(clientUser.getDingTel());
        DingTalkRobotResponse dingTalkRobotResponse = tradeOrderRobot.sendTextMessage(sb.toString(), mobileList, false);
        log.info("发送消息结果：{}", dingTalkRobotResponse.getErrmsg());
    }

    /**
     * @description: 交易平仓
     * @author: chen
     * @date: 2024/5/8 下午5:57
     * @Param: [newCloseTradinglist, info]
     * @return: void
     **/
    private void tradeClosePosition(ArrayList<CopyTradingSubpositionsHistory.Data> newCloseTradinglist, CopytradingInfo info) {
        //获取数据库配置的跟单信息
        List<UserSwapConfig> userSwapConfigList = userSwapConfigMapper.selectList();
        Map<String, List<UserSwapConfig>> userSwapConfigMap = userSwapConfigList.stream().collect(Collectors.groupingBy(UserSwapConfig::getUniqueCode));
        if (!userSwapConfigMap.containsKey(info.getUniqueCode())) {
            return;
        }
        log.info("定时任务：跟单平仓，当前交易员：{}", info.getName());
        newCloseTradinglist.forEach(data -> {
            ClosePosition.Request request = new ClosePosition.Request();
            request.setInstId(data.getInstId());
            if ("net".equals(data.getPosSide())) {
                //	持仓方向
                //买卖模式下：可不填写此参数，默认值net，如果填写，仅可以填写net
                //开平仓模式下： 必须填写此参数，且仅可以填写 long：平多 ，short：平空
                request.setPosSide("net");
            } else if ("long".equals(data.getPosSide())) {
                request.setPosSide("long");
            } else if ("short".equals(data.getPosSide())) {
                request.setPosSide("short");
            }
            request.setMgnMode(data.getMgnMode());
            request.setCcy(data.getCcy());
            ClosePosition.Response response = tradeApi.closePosition(request);
            List<ClosePosition.Data> responseData = response.getData();
            //跟单平仓完毕，发送通知
            sendClosePositionMsg(data, info, userSwapConfigMap.get(data.getUniqueCode()).get(0), response);
        });

    }

    /**
     * @description: 跟单平仓完毕，发送通知
     * @author: chen
     * @date: 2024/5/8 下午5:38
     * @Param: [data, info, response]
     * @return: void
     **/
    private void sendClosePositionMsg(CopyTradingSubpositionsHistory.Data data, CopytradingInfo info, UserSwapConfig config, ClosePosition.Response response) {
        StringBuilder sb = new StringBuilder();
        if ("0".equals(response.getCode())) {
            //跟单成功
            sb.append("恭喜您，跟单平仓成功！").append(System.lineSeparator());
        } else {
            sb.append("很抱歉，跟单平仓失败啦！").append(System.lineSeparator());
            sb.append("失败原因：！").append(response.getMsg()).append(System.lineSeparator());
        }
        sb.append("交易员：").append(info.getName()).append(System.lineSeparator());
        sb.append("交易货币：").append(data.getInstId()).append(System.lineSeparator());
        if ("net".equals(data.getPosSide())) {
            //net：买卖模式（subPos为正代表开多，subPos为负代表开空）
            if (Double.parseDouble(data.getSubPos()) >= 0) {
                sb.append("持仓方向：").append("开多").append(System.lineSeparator());
            } else {
                sb.append("持仓方向：").append("开空").append(System.lineSeparator());
            }
        } else {
            sb.append("持仓方向：").append(dictService.getDictLabelNotWeb("sub_pos_current_pos_side", data.getPosSide())).append(System.lineSeparator());
        }
        sb.append("保证金模式：").append(dictService.getDictLabelNotWeb("sub_pos_current_mgn_mode", data.getMgnMode())).append(System.lineSeparator());
        sb.append("杠杆倍数：").append(data.getLever()).append(System.lineSeparator());
        sb.append("开仓均价：").append(data.getOpenAvgPx()).append(System.lineSeparator());
        //sb.append("开仓时间：").append(SubPosCurrent.getOpenTimeDate()).append(System.lineSeparator());
        sb.append("开仓时间：").append(DateTimeUtil.formatDate(new Date(Long.parseLong(data.getOpenTime())), DateTimeUtil.standard_format)).append(System.lineSeparator());
        sb.append("平仓均价：").append(data.getCloseAvgPx()).append(System.lineSeparator());
        sb.append("持仓数量：").append(data.getSubPos()).append(System.lineSeparator());
        sb.append("产品类型：").append(dictService.getDictLabelNotWeb("sub_pos_current_inst_type", data.getInstType())).append(System.lineSeparator());
        sb.append("保证金：").append(data.getMargin()).append(System.lineSeparator());
        sb.append("平仓时间：").append(DateTimeUtil.formatDate(new Date(Long.parseLong(data.getCloseTime())), DateTimeUtil.standard_format)).append(System.lineSeparator());
        sb.append("收益额：").append(NumberUtil.decimalFormatMoney(Double.parseDouble(data.getPnl()))).append(System.lineSeparator());
        sb.append("收益率：").append(NumberUtil.formatPercent(Double.parseDouble(data.getPnlRatio()), 2)).append(System.lineSeparator());
        //发送消息
        ClientUser clientUser = clientUserMapper.selectById(config.getUserId());
        List<String> mobileList = List.of(clientUser.getDingTel());
        DingTalkRobotResponse dingTalkRobotResponse = tradeColsePositionRobot.sendTextMessage(sb.toString(), mobileList, false);
        log.info("发送消息结果：{}", dingTalkRobotResponse.getErrmsg());
    }

    /**
     * @description: 移除开仓表的数据
     * @author: chen
     * @date: 2024/4/30 上午11:29
     * @Param: [newCloseTradinglist]
     * @return: void
     **/
    private void removeCurrentDB(ArrayList<CopyTradingSubpositionsHistory.Data> newCloseTradinglist) {
        newCloseTradinglist.forEach(data -> subPosCurrentMapper.delete(new LambdaQueryWrapper<SubPosCurrent>().eq(SubPosCurrent::getSubPosId, data.getSubPosId())));
    }

    /**
     * @description: 保存新的带单消息到DB，发送钉钉消息
     * @author: chen
     * @date: 2024/4/30 上午10:43
     * @Param: [newTradinglist, info]
     * @return: void
     **/
    private void saveCurrentDBAndSendMsg(ArrayList<CopyTradingCurrentSubpositions.Data> newTradinglist, CopytradingInfo info) {
        log.info("交易员：{}，新增开单记录{}条", info.getName(), newTradinglist.size());
        //获取都有谁关注了当前交易员
        List<ClientUser> userList = copytradingInfoMapper.getFollowList(info.getId());
        List<String> mobileList = userList.stream().map(ClientUser::getDingTel).collect(Collectors.toList());

        //拼接钉钉消息
        newTradinglist.forEach(data -> {
            SubPosCurrent subPosCurrent = new SubPosCurrent();
            BeanUtil.copyProperties(data, subPosCurrent);
            subPosCurrent.setOpenTimeDate(new Date(Long.parseLong(data.getOpenTime())));
            subPosCurrentMapper.insert(subPosCurrent);

            StringBuilder sb = new StringBuilder();
            sb.append("交易员：").append(info.getName()).append(System.lineSeparator());
            String genDingTalkMsg = genCurrentDingTalkMsg(subPosCurrent, info, sb);
            //发送消息
            DingTalkRobotResponse dingTalkRobotResponse = monitorOpenRobot.sendTextMessage(genDingTalkMsg, mobileList, false);
            log.info("发送消息结果：{}", dingTalkRobotResponse.getErrmsg());
        });
    }

    /**
     * @description: 保存新的平仓消息到DB，发送钉钉消息
     * @author: chen
     * @date: 2024/4/30 上午10:42
     * @Param: [newCloseTradinglist, info]
     * @return: void
     **/
    private void saveCloseDBAndSendMsg(ArrayList<CopyTradingSubpositionsHistory.Data> newCloseTradinglist, CopytradingInfo info) {
        log.info("交易员：{}，新增平仓记录{}条", info.getName(), newCloseTradinglist.size());
        //获取都有谁关注了当前交易员
        List<ClientUser> userList = copytradingInfoMapper.getFollowList(info.getId());
        List<String> mobileList = userList.stream().map(ClientUser::getDingTel).collect(Collectors.toList());

        //拼接钉钉消息
        newCloseTradinglist.forEach(data -> {
            SubPosHis subPosHis = new SubPosHis();
            BeanUtil.copyProperties(data, subPosHis);
            subPosHis.setCloseTimeDate(new Date(Long.parseLong(data.getCloseTime())));
            subPosHis.setOpenTimeDate(new Date(Long.parseLong(data.getOpenTime())));
            subPosHisMapper.insert(subPosHis);

            StringBuilder sb = new StringBuilder();
            sb.append("平仓平仓平仓").append(System.lineSeparator());
            sb.append("交易员：").append(info.getName()).append(System.lineSeparator());
            String genDingTalkMsg = genCloseDingTalkMsg(subPosHis, info, sb);
            //发送消息
            DingTalkRobotResponse dingTalkRobotResponse = monitorCloseRobot.sendTextMessage(genDingTalkMsg, mobileList, false);
            log.info("发送消息结果：{}", dingTalkRobotResponse.getErrmsg());
        });
    }

    /**
     * @description: 生成新开单的钉钉消息
     * @author: chen
     * @date: 2024/4/30 上午10:50
     * @Param: [subPosCurrent, info, sb]
     * @return: java.lang.String
     **/
    private String genCurrentDingTalkMsg(SubPosCurrent subPosCurrent, CopytradingInfo info, StringBuilder sb) {
        sb.append("推荐指数：").append(info.getRecomIndex()).append("颗星").append(System.lineSeparator());
        sb.append("交易货币：").append(subPosCurrent.getInstId()).append(System.lineSeparator());
        if ("net".equals(subPosCurrent.getPosSide())) {
            //net：买卖模式（subPos为正代表开多，subPos为负代表开空）
            if (Double.parseDouble(subPosCurrent.getSubPos()) >= 0) {
                sb.append("持仓方向：").append("开多").append(System.lineSeparator());
            } else {
                sb.append("持仓方向：").append("开空").append(System.lineSeparator());
            }
        } else {
            sb.append("持仓方向：").append(dictService.getDictLabelNotWeb("sub_pos_current_pos_side", subPosCurrent.getPosSide())).append(System.lineSeparator());
        }
        sb.append("保证金模式：").append(dictService.getDictLabelNotWeb("sub_pos_current_mgn_mode", subPosCurrent.getMgnMode())).append(System.lineSeparator());
        sb.append("杠杆倍数：").append(subPosCurrent.getLever()).append(System.lineSeparator());
        sb.append("开仓均价：").append(subPosCurrent.getOpenAvgPx()).append(System.lineSeparator());
        //sb.append("开仓时间：").append(SubPosCurrent.getOpenTimeDate()).append(System.lineSeparator());
        sb.append("开仓时间：").append(DateTimeUtil.formatDate(subPosCurrent.getOpenTimeDate(), DateTimeUtil.standard_format)).append(System.lineSeparator());
        sb.append("持仓数量：").append(subPosCurrent.getSubPos()).append(System.lineSeparator());
        sb.append("产品类型：").append(dictService.getDictLabelNotWeb("sub_pos_current_inst_type", subPosCurrent.getInstType())).append(System.lineSeparator());
        sb.append("保证金：").append(subPosCurrent.getMargin()).append(System.lineSeparator());
        sb.append("最新价格：").append(subPosCurrent.getMarkPx()).append(System.lineSeparator());
        sb.append("当前收益：").append(NumberUtil.decimalFormatMoney(Double.parseDouble(subPosCurrent.getUpl()))).append(System.lineSeparator());
        sb.append("当前收益率：").append(NumberUtil.formatPercent(Double.parseDouble(subPosCurrent.getUplRatio()), 2)).append(System.lineSeparator());
        sb.append("币种：").append(subPosCurrent.getCcy()).append(System.lineSeparator());
        return sb.toString();
    }

    /**
     * @description: 生成新平仓的钉钉消息
     * @author: chen
     * @date: 2024/4/30 上午10:50
     * @Param: [subPosHis, info, sb]
     * @return: java.lang.String
     **/
    private String genCloseDingTalkMsg(SubPosHis subPosHis, CopytradingInfo info, StringBuilder sb) {
        sb.append("推荐指数：").append(info.getRecomIndex()).append("颗星").append(System.lineSeparator());
        sb.append("交易货币：").append(subPosHis.getInstId()).append(System.lineSeparator());
        if ("net".equals(subPosHis.getPosSide())) {
            //net：买卖模式（subPos为正代表开多，subPos为负代表开空）
            if (Double.parseDouble(subPosHis.getSubPos()) >= 0) {
                sb.append("持仓方向：").append("开多").append(System.lineSeparator());
            } else {
                sb.append("持仓方向：").append("开空").append(System.lineSeparator());
            }
        } else {
            sb.append("持仓方向：").append(dictService.getDictLabelNotWeb("sub_pos_current_pos_side", subPosHis.getPosSide())).append(System.lineSeparator());
        }
        sb.append("保证金模式：").append(dictService.getDictLabelNotWeb("sub_pos_current_mgn_mode", subPosHis.getMgnMode())).append(System.lineSeparator());
        sb.append("杠杆倍数：").append(subPosHis.getLever()).append(System.lineSeparator());
        sb.append("开仓均价：").append(subPosHis.getOpenAvgPx()).append(System.lineSeparator());
        //sb.append("开仓时间：").append(SubPosCurrent.getOpenTimeDate()).append(System.lineSeparator());
        sb.append("开仓时间：").append(DateTimeUtil.formatDate(subPosHis.getOpenTimeDate(), DateTimeUtil.standard_format)).append(System.lineSeparator());
        sb.append("持仓数量：").append(subPosHis.getSubPos()).append(System.lineSeparator());
        //sb.append("开仓时间：").append(SubPosCurrent.getOpenTimeDate()).append(System.lineSeparator());
        sb.append("平仓时间：").append(DateTimeUtil.formatDate(subPosHis.getCloseTimeDate(), DateTimeUtil.standard_format)).append(System.lineSeparator());
        sb.append("平仓均价：").append(subPosHis.getCloseAvgPx()).append(System.lineSeparator());
        sb.append("收益额：").append(NumberUtil.decimalFormatMoney(Double.parseDouble(subPosHis.getPnl()))).append(System.lineSeparator());
        sb.append("收益率：").append(NumberUtil.formatPercent(Double.parseDouble(subPosHis.getPnlRatio()), 2)).append(System.lineSeparator());
        sb.append("产品类型：").append(dictService.getDictLabelNotWeb("sub_pos_current_inst_type", subPosHis.getInstType())).append(System.lineSeparator());
        sb.append("保证金：").append(subPosHis.getMargin()).append(System.lineSeparator());
        sb.append("币种：").append(subPosHis.getCcy()).append(System.lineSeparator());
        return sb.toString();
    }


}
