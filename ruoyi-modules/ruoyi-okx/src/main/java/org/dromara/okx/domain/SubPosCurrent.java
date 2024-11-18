package org.dromara.okx.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 交易员当前带单对象 sub_pos_current
 *
 * @author cc
 * @date 2024-04-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sub_pos_current")
public class SubPosCurrent extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 产品ID
     */
    private String instId;

    /**
     * 带单仓位ID
     */
    private String subPosId;

    /**
     * 持仓方向
     */
    private String posSide;

    /**
     * 保证金模式
     */
    private String mgnMode;

    /**
     * 杠杆倍数
     */
    private String lever;

    /**
     * 开仓均价
     */
    private String openAvgPx;

    /**
     * 开仓时间
     */
    private String openTime;

    /**
     * 开仓时间
     */
    private Date openTimeDate;

    /**
     * 持仓张数
     */
    private String subPos;

    /**
     * 产品类型
     */
    private String instType;

    /**
     * 保证金
     */
    private String margin;

    /**
     * 未实现收益
     */
    private String upl;

    /**
     * 未实现收益率
     */
    private String uplRatio;

    /**
     * 标记价格（仅适用于合约）
     */
    private String markPx;

    /**
     * 交易员标识码
     */
    private String uniqueCode;

    /**
     * 币种
     */
    private String ccy;

    /**
     * 
     */
    @TableLogic
    private String delFlag;


}
