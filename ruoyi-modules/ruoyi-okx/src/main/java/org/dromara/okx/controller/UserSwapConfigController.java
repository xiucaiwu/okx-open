package org.dromara.okx.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.web.core.BaseController;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.okx.domain.vo.UserSwapConfigVo;
import org.dromara.okx.domain.bo.UserSwapConfigBo;
import org.dromara.okx.service.IUserSwapConfigService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 用户合约跟单配置
 *
 * @author cc
 * @date 2024-05-08
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/okx/userSwapConfig")
public class UserSwapConfigController extends BaseController {

    private final IUserSwapConfigService userSwapConfigService;

    /**
     * 查询用户合约跟单配置列表
     */
    @SaCheckPermission("okx:userSwapConfig:list")
    @GetMapping("/list")
    public TableDataInfo<UserSwapConfigVo> list(UserSwapConfigBo bo, PageQuery pageQuery) {
        return userSwapConfigService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出用户合约跟单配置列表
     */
    @SaCheckPermission("okx:userSwapConfig:export")
    @Log(title = "用户合约跟单配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(UserSwapConfigBo bo, HttpServletResponse response) {
        List<UserSwapConfigVo> list = userSwapConfigService.queryList(bo);
        ExcelUtil.exportExcel(list, "用户合约跟单配置", UserSwapConfigVo.class, response);
    }

    /**
     * 获取用户合约跟单配置详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("okx:userSwapConfig:query")
    @GetMapping("/{id}")
    public R<UserSwapConfigVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(userSwapConfigService.queryById(id));
    }

    /**
     * 新增用户合约跟单配置
     */
    @SaCheckPermission("okx:userSwapConfig:add")
    @Log(title = "用户合约跟单配置", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody UserSwapConfigBo bo) {
        return toAjax(userSwapConfigService.insertByBo(bo));
    }

    /**
     * 修改用户合约跟单配置
     */
    @SaCheckPermission("okx:userSwapConfig:edit")
    @Log(title = "用户合约跟单配置", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody UserSwapConfigBo bo) {
        return toAjax(userSwapConfigService.updateByBo(bo));
    }

    /**
     * 删除用户合约跟单配置
     *
     * @param ids 主键串
     */
    @SaCheckPermission("okx:userSwapConfig:remove")
    @Log(title = "用户合约跟单配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(userSwapConfigService.deleteWithValidByIds(List.of(ids), true));
    }
}
