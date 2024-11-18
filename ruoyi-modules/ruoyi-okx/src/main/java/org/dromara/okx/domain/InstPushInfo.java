package org.dromara.okx.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 定时推送币信息对象 inst_push_info
 *
 * @author Lion Li
 * @date 2024-04-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("inst_push_info")
public class InstPushInfo extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 币的简称
     */
    private String name;

    /**
     * 产品id 
     */
    private String instId;

    /**
     * 产品类型
     */
    private String instType;

    /**
     * 删除标志（0：未删除，1：已删除）
     */
    @TableLogic
    private String delFlag;


}
