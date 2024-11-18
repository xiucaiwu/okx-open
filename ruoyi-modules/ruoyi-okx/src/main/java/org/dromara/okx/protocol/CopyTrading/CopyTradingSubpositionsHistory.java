package org.dromara.okx.protocol.CopyTrading;

import com.codingapi.springboot.framework.rest.param.IRestParam;
import org.dromara.okx.protocol.OkxResponse;

import java.util.List;

/**
 * @Author: chen
 * @Date: 2024-04-30  09:47
 * @Description: 获取交易员历史带单情况   公共接口
 * 限速：5次/2s
 * @Version: 1.0
 */
public class CopyTradingSubpositionsHistory {
    public static class Data {
        private String instId; // 产品ID
        private String subPosId; // 带单仓位ID
        //持仓方向
        //long：开平仓模式开多
        //short：开平仓模式开空
        //net：买卖模式（subPos为正代表开多，subPos为负代表开空）
        private String posSide;
        //保证金模式，isolated：逐仓 ；cross：全仓
        private String mgnMode;
        private String lever; // 杠杆倍数
        private String openAvgPx; // 开仓均价
        private String openTime; // 开仓时间
        private String subPos; // 持仓张数
        private String closeTime; // 平仓时间
        private String closeAvgPx; // 平仓均价
        private String pnl; // 收益额
        private String pnlRatio; // 收益率
        //产品类型  SPOT：币币  SWAP：永续合约
        private String instType; //
        private String margin; // 保证金
        private String ccy; // 币种
        private String uniqueCode; // 交易员唯一标识代码

        public String getInstId() {
            return instId;
        }

        public void setInstId(String instId) {
            this.instId = instId;
        }

        public String getSubPosId() {
            return subPosId;
        }

        public void setSubPosId(String subPosId) {
            this.subPosId = subPosId;
        }

        public String getPosSide() {
            return posSide;
        }

        public void setPosSide(String posSide) {
            this.posSide = posSide;
        }

        public String getMgnMode() {
            return mgnMode;
        }

        public void setMgnMode(String mgnMode) {
            this.mgnMode = mgnMode;
        }

        public String getLever() {
            return lever;
        }

        public void setLever(String lever) {
            this.lever = lever;
        }

        public String getOpenAvgPx() {
            return openAvgPx;
        }

        public void setOpenAvgPx(String openAvgPx) {
            this.openAvgPx = openAvgPx;
        }

        public String getOpenTime() {
            return openTime;
        }

        public void setOpenTime(String openTime) {
            this.openTime = openTime;
        }

        public String getSubPos() {
            return subPos;
        }

        public void setSubPos(String subPos) {
            this.subPos = subPos;
        }

        public String getCloseTime() {
            return closeTime;
        }

        public void setCloseTime(String closeTime) {
            this.closeTime = closeTime;
        }

        public String getCloseAvgPx() {
            return closeAvgPx;
        }

        public void setCloseAvgPx(String closeAvgPx) {
            this.closeAvgPx = closeAvgPx;
        }

        public String getPnl() {
            return pnl;
        }

        public void setPnl(String pnl) {
            this.pnl = pnl;
        }

        public String getPnlRatio() {
            return pnlRatio;
        }

        public void setPnlRatio(String pnlRatio) {
            this.pnlRatio = pnlRatio;
        }

        public String getInstType() {
            return instType;
        }

        public void setInstType(String instType) {
            this.instType = instType;
        }

        public String getMargin() {
            return margin;
        }

        public void setMargin(String margin) {
            this.margin = margin;
        }

        public String getCcy() {
            return ccy;
        }

        public void setCcy(String ccy) {
            this.ccy = ccy;
        }

        public String getUniqueCode() {
            return uniqueCode;
        }

        public void setUniqueCode(String uniqueCode) {
            this.uniqueCode = uniqueCode;
        }

        @Override
        public String toString() {
            return "Data{" +
                "instId='" + instId + '\'' +
                ", subPosId='" + subPosId + '\'' +
                ", posSide='" + posSide + '\'' +
                ", mgnMode='" + mgnMode + '\'' +
                ", lever='" + lever + '\'' +
                ", openAvgPx='" + openAvgPx + '\'' +
                ", openTime='" + openTime + '\'' +
                ", subPos='" + subPos + '\'' +
                ", closeTime='" + closeTime + '\'' +
                ", closeAvgPx='" + closeAvgPx + '\'' +
                ", pnl='" + pnl + '\'' +
                ", pnlRatio='" + pnlRatio + '\'' +
                ", instType='" + instType + '\'' +
                ", margin='" + margin + '\'' +
                ", ccy='" + ccy + '\'' +
                ", uniqueCode='" + uniqueCode + '\'' +
                '}';
        }
    }

    //解析结果
    public static class Response extends OkxResponse {
        public Response() {
        }

        public List<CopyTradingSubpositionsHistory.Data> getData() {
            return this.getMultiData(CopyTradingSubpositionsHistory.Data.class);
        }

        public String toString() {
            return "CopyTradingSubpositionsHistory.Response()";
        }
    }

    //参数类
    public static class Request implements IRestParam {
        //	产品类型
        //SWAP：永续合约，默认值
        private String instType;
        //	交易员唯一标识码，仅适用于跟单  必需参数
        private String uniqueCode;
        private String after;
        private String before;
        private String limit;

        public String getInstType() {
            return instType;
        }

        public void setInstType(String instType) {
            this.instType = instType;
        }

        public String getUniqueCode() {
            return uniqueCode;
        }

        public void setUniqueCode(String uniqueCode) {
            this.uniqueCode = uniqueCode;
        }

        public String getAfter() {
            return after;
        }

        public void setAfter(String after) {
            this.after = after;
        }

        public String getBefore() {
            return before;
        }

        public void setBefore(String before) {
            this.before = before;
        }

        public String getLimit() {
            return limit;
        }

        public void setLimit(String limit) {
            this.limit = limit;
        }

        @Override
        public String toString() {
            return "Request{" +
                "instType='" + instType + '\'' +
                ", uniqueCode='" + uniqueCode + '\'' +
                ", after='" + after + '\'' +
                ", before='" + before + '\'' +
                ", limit='" + limit + '\'' +
                '}';
        }
    }
}
