package org.dromara.okx.domain.bo;

import org.dromara.okx.domain.ClientUser;
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
 * 系统用户信息业务对象 client_user
 *
 * @author cc
 * @date 2024-04-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ClientUser.class, reverseConvertGenerate = false)
public class ClientUserBo extends BaseEntity {

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 账号
     */
    @NotBlank(message = "账号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String username;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String password;

    /**
     * 昵称
     */
    @NotBlank(message = "昵称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String nickName;

    /**
     * 头像
     */
    @NotBlank(message = "头像不能为空", groups = { AddGroup.class, EditGroup.class })
    private String avatar;

    /**
     * 手机
     */
    @NotBlank(message = "手机不能为空", groups = { AddGroup.class, EditGroup.class })
    private String tel;

    /**
     * 钉钉号
     */
    @NotBlank(message = "钉钉号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String dingTel;

    /**
     * QQ
     */
    @NotBlank(message = "QQ不能为空", groups = { AddGroup.class, EditGroup.class })
    private String qq;

    /**
     * 性别
     */
    @NotBlank(message = "性别不能为空", groups = { AddGroup.class, EditGroup.class })
    private String sex;

    /**
     * 简介
     */
    @NotBlank(message = "简介不能为空", groups = { AddGroup.class, EditGroup.class })
    private String introduction;

    /**
     * 上次登录时间
     */
    @NotNull(message = "上次登录时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date lastLoginTime;


}
