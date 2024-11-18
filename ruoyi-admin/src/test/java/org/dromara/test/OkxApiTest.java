package org.dromara.test;

import org.dromara.okx.api.CopyTradingApi;
import org.dromara.okx.api.MarketApi;
import org.dromara.okx.api.PublicApi;
import org.dromara.okx.api.TradeApi;
import org.dromara.okx.client.SignOkxApi;
import org.dromara.okx.protocol.CopyTrading.CopyTradingCurrentSubpositions;
import org.dromara.okx.protocol.CopyTrading.CopyTradingSubpositionsHistory;
import org.dromara.okx.protocol.market.Trades;
import org.dromara.okx.protocol.pub.ConvertContractCoin;
import org.dromara.okx.protocol.trade.ClosePosition;
import org.dromara.okx.protocol.trade.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * @Author: chen
 * @Date: 2024-04-23  18:00
 * @Description: TODO
 * @Version: 1.0
 */
@SpringBootTest
public class OkxApiTest {

    @Autowired
    private MarketApi marketApi;

    @Autowired
    private PublicApi publicApi;

    @Autowired
    private TradeApi tradeApi;

    @Autowired
    private SignOkxApi signOkxApi;

    @Autowired
    private CopyTradingApi copyTradingApi;

    @Test
    void trades() {
        Trades.Response response = marketApi.trades("BTC-USDT");
        assertTrue(response!=null);
        assertTrue(!response.getData().isEmpty());
        System.out.println(response.getData());
    }
    @Test
    void trades2() {
        System.out.println("signOkxApi = " + signOkxApi);
    }


    //当前带单
    @Test
    void copyTradingCurrentSubpositions() {
        CopyTradingCurrentSubpositions.Request request = new CopyTradingCurrentSubpositions.Request();
        request.setUniqueCode("540D011FDACCB47A");
        CopyTradingCurrentSubpositions.Response response = copyTradingApi.getCopyTradingCurrentSubpositions(request);
        List<CopyTradingCurrentSubpositions.Data> data = response.getData();
        System.out.println(data);
    }

    //历史带单
    @Test
    void copyTradingSubpositionsHis() {
        //okx查询
        CopyTradingSubpositionsHistory.Request request = new CopyTradingSubpositionsHistory.Request();
        request.setUniqueCode("4CC714DF5A1691A0");
        //request.setBefore("709968709797097472");
        List<CopyTradingSubpositionsHistory.Data> dataList = copyTradingApi.getCopyTradingSubpositionsHistory(request).getData();
        System.out.println(dataList);
    }

    //下单  买卖都有
    @Test
    void order(){
        Order.Request request = new Order.Request();
        request.setInstId("BTC-USDT-SWAP");
        request.setTdMode("isolated");
        request.setClOrdId("11111");
        request.setSide("buy");  //buy  sell
        request.setOrdType("market");
        request.setPx("62980");
        request.setPosSide("long"); //long  short
        ConvertContractCoin.Request request1 = new ConvertContractCoin.Request();
        request1.setInstId("BTC-USDT-SWAP");
        request1.setPx("62980");
        request1.setSz((double)10*10/62980+"");  //币的持仓量=本金u*倍数/当前市价
        ConvertContractCoin.Response response1 = publicApi.convertContractCoin(request1);
        List<ConvertContractCoin.Data> data1 = response1.getData();
        request.setSz(data1.get(0).getSz());
        Order.Response response = tradeApi.order(request);
        List<Order.Data> data = response.getData();
        System.out.println(data);
    }

    //市价全平
    @Test
    void closePosition(){
        ClosePosition.Request request = new ClosePosition.Request();
        request.setInstId("BTC-USDT-SWAP");
        request.setPosSide("long");
        request.setMgnMode("isolated");
        request.setCcy("USDT");
        ClosePosition.Response response = tradeApi.closePosition(request);
        List<ClosePosition.Data> data = response.getData();
        System.out.println(data);
    }

    //币、张转换
    @Test
    void publicApi(){
        ConvertContractCoin.Request request = new ConvertContractCoin.Request();
        request.setInstId("BTC-USDT-SWAP");
        request.setPx("62700");
        request.setSz((double)50*10/62750+"");  //币的持仓量=本金u*倍数/市价
        ConvertContractCoin.Response response = publicApi.convertContractCoin(request);
        List<ConvertContractCoin.Data> data = response.getData();
        System.out.println(data);
    }


}
