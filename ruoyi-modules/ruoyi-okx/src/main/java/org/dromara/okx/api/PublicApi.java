package org.dromara.okx.api;


import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.okx.client.SignOkxApi;
import org.dromara.okx.protocol.pub.ConvertContractCoin;

@Slf4j
@AllArgsConstructor
public class PublicApi {

    private final SignOkxApi signOkxApi;

    /**
     *  张币转换
     *  <a href="https://www.okx.com/docs-v5/zh/#rest-api-public-data-get-unit-convert"></a>
     */
    public ConvertContractCoin.Response convertContractCoin(ConvertContractCoin.Request request){
        String data = signOkxApi.getSign("/api/v5/public/convert-contract-coin",request.toParameters());
        log.debug("response:{}", data);
        return JSONObject.parseObject(data, ConvertContractCoin.Response.class);
    }
}
