package org.dromara.okx.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 交易员信息对象 copytrading_info
 *
 * @author cc
 * @date 2024-04-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("copytrading_info")
public class CopytradingInfo extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 标识码
     */
    private String uniqueCode;

    /**
     * 推荐指数
     */
    private String recomIndex;

    /**
     * 平台
     */
    private String platform;

    /**
     * 删除标志（0：未删除，1：已删除）
     */
    @TableLogic
    private String delFlag;


}
