package org.dromara.okx.domain.vo;

import org.dromara.okx.domain.UserSwapConfig;
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
 * 用户合约跟单配置视图对象 user_swap_config
 *
 * @author cc
 * @date 2024-05-08
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = UserSwapConfig.class)
public class UserSwapConfigVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long userId;

    /**
     * 交易员标识码
     */
    @ExcelProperty(value = "交易员标识码")
    private String uniqueCode;

    /**
     * 产品ID
     */
    @ExcelProperty(value = "产品ID")
    private String instId;

    /**
     * 保证金模式
     */
    @ExcelProperty(value = "保证金模式", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sub_pos_current_mgn_mode")
    private String mgnMode;

    /**
     * 产品类型
     */
    @ExcelProperty(value = "产品类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sub_pos_current_inst_type")
    private String instType;

    /**
     * 杠杆倍数
     */
    @ExcelProperty(value = "杠杆倍数")
    private String lever;

    /**
     * 投入u数量
     */
    @ExcelProperty(value = "投入u数量")
    private String num;


}
