package org.dromara.okx.domain.vo;

import org.dromara.okx.domain.InstPushInfo;
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
 * 定时推送币信息视图对象 inst_push_info
 *
 * @author Lion Li
 * @date 2024-04-28
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = InstPushInfo.class)
public class InstPushInfoVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 币的简称
     */
    @ExcelProperty(value = "币的简称")
    private String name;

    /**
     * 产品id 
     */
    @ExcelProperty(value = "产品id ")
    private String instId;

    /**
     * 产品类型
     */
    @ExcelProperty(value = "产品类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "trading_inst_type")
    private String instType;


}
