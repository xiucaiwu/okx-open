package org.dromara.okx.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 系统用户信息对象 client_user
 *
 * @author cc
 * @date 2024-04-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("client_user")
public class ClientUser extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 账号
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 手机
     */
    private String tel;

    /**
     * 钉钉号
     */
    private String dingTel;

    /**
     * QQ
     */
    private String qq;

    /**
     * 性别
     */
    private String sex;

    /**
     * 简介
     */
    private String introduction;

    /**
     * 上次登录时间
     */
    private Date lastLoginTime;

    /**
     * 删除标志（0：未删除，1：已删除）
     */
    @TableLogic
    private String delFlag;


}
