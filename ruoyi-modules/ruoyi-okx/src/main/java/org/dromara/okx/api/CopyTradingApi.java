package org.dromara.okx.api;

import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.okx.client.SignOkxApi;
import org.dromara.okx.protocol.CopyTrading.CopyTradingCurrentSubpositions;
import org.dromara.okx.protocol.CopyTrading.CopyTradingSubpositionsHistory;

/**
 * @Author: chen
 * @Date: 2024-04-24  11:18
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@AllArgsConstructor
public class CopyTradingApi {

    private final SignOkxApi signOkxApi;


    //接口显示   5次/2s
    public CopyTradingCurrentSubpositions.Response getCopyTradingCurrentSubpositions(CopyTradingCurrentSubpositions.Request request) {
        String data = this.signOkxApi.getSign("/api/v5/copytrading/public-current-subpositions", request.toParameters());
        log.debug("获取交易员当前带单结果：response:{}", data);
        return JSONObject.parseObject(data, CopyTradingCurrentSubpositions.Response.class);
    }

    public CopyTradingSubpositionsHistory.Response getCopyTradingSubpositionsHistory(CopyTradingSubpositionsHistory.Request request) {
        String data = this.signOkxApi.getSign("/api/v5/copytrading/public-subpositions-history", request.toParameters());
        log.debug("获取交易员历史带单结果: response:{}", data);
        return JSONObject.parseObject(data, CopyTradingSubpositionsHistory.Response.class);
    }


}
