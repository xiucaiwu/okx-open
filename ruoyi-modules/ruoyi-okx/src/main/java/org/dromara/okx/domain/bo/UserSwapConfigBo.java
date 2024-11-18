package org.dromara.okx.domain.bo;

import org.dromara.okx.domain.UserSwapConfig;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 用户合约跟单配置业务对象 user_swap_config
 *
 * @author cc
 * @date 2024-05-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = UserSwapConfig.class, reverseConvertGenerate = false)
public class UserSwapConfigBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 交易员标识码
     */
    @NotBlank(message = "交易员标识码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String uniqueCode;

    /**
     * 产品ID
     */
    @NotBlank(message = "产品ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private String instId;

    /**
     * 保证金模式
     */
    @NotBlank(message = "保证金模式不能为空", groups = { AddGroup.class, EditGroup.class })
    private String mgnMode;

    /**
     * 产品类型
     */
    @NotBlank(message = "产品类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String instType;

    /**
     * 杠杆倍数
     */
    @NotBlank(message = "杠杆倍数不能为空", groups = { AddGroup.class, EditGroup.class })
    private String lever;

    /**
     * 投入u数量
     */
    @NotBlank(message = "投入u数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private String num;


}
