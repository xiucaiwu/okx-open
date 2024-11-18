package org.dromara.okx.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.okx.domain.ClientUser;
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
 * 系统用户信息视图对象 client_user
 *
 * @author cc
 * @date 2024-04-30
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ClientUser.class)
public class ClientUserVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long id;

    /**
     * 账号
     */
    @ExcelProperty(value = "账号")
    private String username;

    /**
     * 昵称
     */
    @ExcelProperty(value = "昵称")
    private String nickName;

    /**
     * 头像
     */
    @ExcelProperty(value = "头像")
    private String avatar;

    /**
     * 手机
     */
    @ExcelProperty(value = "手机")
    private String tel;

    /**
     * 钉钉号
     */
    @ExcelProperty(value = "钉钉号")
    private String dingTel;

    /**
     * QQ
     */
    @ExcelProperty(value = "QQ")
    private String qq;

    /**
     * 性别
     */
    @ExcelProperty(value = "性别", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_user_sex")
    private String sex;

    /**
     * 上次登录时间
     */
    @ExcelProperty(value = "上次登录时间")
    private Date lastLoginTime;


}
