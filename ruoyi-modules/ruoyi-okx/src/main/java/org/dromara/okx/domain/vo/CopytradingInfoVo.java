package org.dromara.okx.domain.vo;

import org.dromara.okx.domain.CopytradingInfo;
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
 * 交易员信息视图对象 copytrading_info
 *
 * @author cc
 * @date 2024-04-28
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = CopytradingInfo.class)
public class CopytradingInfoVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 姓名
     */
    @ExcelProperty(value = "姓名")
    private String name;

    /**
     * 标识码
     */
    @ExcelProperty(value = "标识码")
    private String uniqueCode;

    /**
     * 推荐指数
     */
    @ExcelProperty(value = "推荐指数")
    private String recomIndex;

    /**
     * 平台
     */
    @ExcelProperty(value = "平台", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "copytrading_platform")
    private String platform;


}
