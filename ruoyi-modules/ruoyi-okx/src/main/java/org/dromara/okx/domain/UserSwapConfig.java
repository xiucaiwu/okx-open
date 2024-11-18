package org.dromara.okx.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 用户合约跟单配置对象 user_swap_config
 *
 * @author cc
 * @date 2024-05-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("user_swap_config")
public class UserSwapConfig extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 交易员标识码
     */
    private String uniqueCode;

    /**
     * 产品ID
     */
    private String instId;

    /**
     * 保证金模式
     */
    private String mgnMode;

    /**
     * 产品类型
     */
    private String instType;

    /**
     * 杠杆倍数
     */
    private String lever;

    /**
     * 投入u数量
     */
    private String num;

    /**
     * 删除标志（0：未删除，1：已删除）
     */
    @TableLogic
    private String delFlag;


}
