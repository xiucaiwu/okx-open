package org.dromara.okx.domain.bo;

import org.dromara.okx.domain.SubPosHis;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 交易员带单历史业务对象 sub_pos_his
 *
 * @author cc
 * @date 2024-04-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = SubPosHis.class, reverseConvertGenerate = false)
public class SubPosHisBo extends BaseEntity {

    /**
     * id
     */
    @NotNull(message = "id不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 产品ID
     */
    @NotBlank(message = "产品ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private String instId;

    /**
     * 带单仓位ID
     */
    @NotBlank(message = "带单仓位ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private String subPosId;

    /**
     * 持仓方向
     */
    @NotBlank(message = "持仓方向不能为空", groups = { AddGroup.class, EditGroup.class })
    private String posSide;

    /**
     * 保证金模式
     */
    @NotBlank(message = "保证金模式不能为空", groups = { AddGroup.class, EditGroup.class })
    private String mgnMode;

    /**
     * 杠杆倍数
     */
    @NotBlank(message = "杠杆倍数不能为空", groups = { AddGroup.class, EditGroup.class })
    private String lever;

    /**
     * 开仓均价
     */
    @NotBlank(message = "开仓均价不能为空", groups = { AddGroup.class, EditGroup.class })
    private String openAvgPx;

    /**
     * 开仓时间
     */
    @NotNull(message = "开仓时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date openTimeDate;

    /**
     * 持仓张数
     */
    private String subPos;

    /**
     * 平仓时间
     */
    @NotNull(message = "平仓时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date closeTimeDate;

    /**
     * 平仓均价
     */
    @NotBlank(message = "平仓均价不能为空", groups = { AddGroup.class, EditGroup.class })
    private String closeAvgPx;

    /**
     * 收益额
     */
    private String pnl;

    /**
     * 收益率
     */
    private String pnlRatio;

    /**
     * 产品类型
     */
    @NotBlank(message = "产品类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String instType;

    /**
     * 保证金
     */
    private String margin;

    /**
     * 币种
     */
    private String ccy;

    /**
     * 交易员唯一标识代码
     */
    @NotBlank(message = "交易员唯一标识代码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String uniqueCode;


}
