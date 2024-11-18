package org.dromara.okx.domain.bo;

import org.dromara.okx.domain.CopytradingInfo;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 交易员信息业务对象 copytrading_info
 *
 * @author cc
 * @date 2024-04-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CopytradingInfo.class, reverseConvertGenerate = false)
public class CopytradingInfoBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 姓名
     */
    @NotBlank(message = "姓名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 标识码
     */
    @NotBlank(message = "标识码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String uniqueCode;

    /**
     * 推荐指数
     */
    @NotBlank(message = "推荐指数不能为空", groups = { AddGroup.class, EditGroup.class })
    private String recomIndex;

    /**
     * 平台
     */
    @NotBlank(message = "平台不能为空", groups = { AddGroup.class, EditGroup.class })
    private String platform;


}
