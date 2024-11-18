package org.dromara.okx.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.okx.domain.SubPosHis;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 交易员带单历史视图对象 sub_pos_his
 *
 * @author cc
 * @date 2024-04-29
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = SubPosHis.class)
public class SubPosHisVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @ExcelProperty(value = "id")
    private Long id;

    /**
     * 产品ID
     */
    @ExcelProperty(value = "产品ID")
    private String instId;

    /**
     * 持仓方向
     */
    @ExcelProperty(value = "持仓方向", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sub_pos_current_pos_side")
    private String posSide;

    /**
     * 保证金模式
     */
    @ExcelProperty(value = "保证金模式", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sub_pos_current_mgn_mode")
    private String mgnMode;

    /**
     * 杠杆倍数
     */
    @ExcelProperty(value = "杠杆倍数")
    private String lever;

    /**
     * 开仓均价
     */
    @ExcelProperty(value = "开仓均价")
    private String openAvgPx;

    /**
     * 开仓时间
     */
    @ExcelProperty(value = "开仓时间")
    private Date openTimeDate;

    /**
     * 持仓张数
     */
    @ExcelProperty(value = "持仓张数")
    private String subPos;

    /**
     * 平仓时间
     */
    @ExcelProperty(value = "平仓时间")
    private Date closeTimeDate;

    /**
     * 平仓均价
     */
    @ExcelProperty(value = "平仓均价")
    private String closeAvgPx;

    /**
     * 收益额
     */
    @ExcelProperty(value = "收益额")
    private String pnl;

    /**
     * 收益率
     */
    @ExcelProperty(value = "收益率")
    private String pnlRatio;

    /**
     * 产品类型
     */
    @ExcelProperty(value = "产品类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sub_pos_current_inst_type")
    private String instType;

    /**
     * 保证金
     */
    @ExcelProperty(value = "保证金")
    private String margin;

    /**
     * 币种
     */
    @ExcelProperty(value = "币种")
    private String ccy;

    /**
     * 交易员唯一标识代码
     */
    @ExcelProperty(value = "交易员唯一标识代码")
    private String uniqueCode;


}
