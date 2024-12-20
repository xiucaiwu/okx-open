package org.dromara.okx.api;

import com.alibaba.fastjson.JSONObject;
import com.codingapi.springboot.framework.rest.param.RestParam;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.okx.client.SignOkxApi;
import org.dromara.okx.protocol.account.Balance;
import org.dromara.okx.protocol.account.LeverageInfo;
import org.dromara.okx.protocol.account.LeverageSet;
import org.dromara.okx.protocol.account.Positions;

@Slf4j
@AllArgsConstructor
public class AccountApi {

    private final SignOkxApi signOkxApi;

    /**
     * 获取余额
     * <a href="https://www.okx.com/docs-v5/zh/#rest-api-account-get-balance">api</a>
     * @param ccy 币种，如 BTC 支持多币种查询（不超过20个），币种之间半角逗号分隔
     * @return {@link Balance.Response}
     */
    public Balance.Response balance(String ccy) {
        String data = signOkxApi.getSign("/api/v5/account/balance", RestParam.create().add("ccy", ccy));
        log.debug("response:{}", data);
        return JSONObject.parseObject(data, Balance.Response.class);
    }

    /**
     * 获取杠杆倍数
     * <a href="https://www.okx.com/docs-v5/zh/#rest-api-account-get-leverage">api</a>
     * @param request {@link LeverageInfo.Request}
     * @return {@link LeverageInfo.Response}
     */
    public LeverageInfo.Response leverageInfo(LeverageInfo.Request request) {
        String data = signOkxApi.getSign("/api/v5/account/leverage-info", request.toParameters());
        log.debug("response:{}", data);
        return JSONObject.parseObject(data, LeverageInfo.Response.class);
    }

    /**
     * 设置杠杆倍数
     * 在所以订单已完成状态下才可以设置
     * <a href="https://www.okx.com/docs-v5/zh/#rest-api-account-set-leverage">api</a>
     * @param request {@link LeverageSet.Request}
     * @return {@link LeverageSet.Response}
     */
    public LeverageSet.Response leverageSet(LeverageSet.Request request) {
        String data = signOkxApi.postSign("/api/v5/account/set-leverage", request.toParameters());
        log.debug("response:{}", data);
        return JSONObject.parseObject(data, LeverageSet.Response.class);
    }

    /**
     * 查看持仓信息
     * <a href="https://www.okx.com/docs-v5/zh/#rest-api-account-get-balance">api</a>
     * @param request {@link Positions.Request}
     * @return {@link Positions.Request}
     */
    public Positions.Response positions(Positions.Request request){
        String data = signOkxApi.getSign("/api/v5/account/positions", request.toParameters());
        log.debug("response:{}", data);
        return JSONObject.parseObject(data, Positions.Response.class);
    }

}
