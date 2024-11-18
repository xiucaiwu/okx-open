package org.dromara.okx.domain.bo;

import org.dromara.okx.domain.InstPushInfo;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 定时推送币信息业务对象 inst_push_info
 *
 * @author Lion Li
 * @date 2024-04-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = InstPushInfo.class, reverseConvertGenerate = false)
public class InstPushInfoBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 币的简称
     */
    @NotBlank(message = "币的简称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 产品id 
     */
    @NotBlank(message = "产品id 不能为空", groups = { AddGroup.class, EditGroup.class })
    private String instId;

    /**
     * 产品类型
     */
    @NotBlank(message = "产品类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String instType;


}
