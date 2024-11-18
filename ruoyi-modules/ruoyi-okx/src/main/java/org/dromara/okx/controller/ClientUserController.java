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
import org.dromara.okx.domain.vo.ClientUserVo;
import org.dromara.okx.domain.bo.ClientUserBo;
import org.dromara.okx.service.IClientUserService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 系统用户信息
 *
 * @author cc
 * @date 2024-04-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/okx/clientUser")
public class ClientUserController extends BaseController {

    private final IClientUserService clientUserService;

    /**
     * 查询系统用户信息列表
     */
    @SaCheckPermission("okx:clientUser:list")
    @GetMapping("/list")
    public TableDataInfo<ClientUserVo> list(ClientUserBo bo, PageQuery pageQuery) {
        return clientUserService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出系统用户信息列表
     */
    @SaCheckPermission("okx:clientUser:export")
    @Log(title = "系统用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ClientUserBo bo, HttpServletResponse response) {
        List<ClientUserVo> list = clientUserService.queryList(bo);
        ExcelUtil.exportExcel(list, "系统用户信息", ClientUserVo.class, response);
    }

    /**
     * 获取系统用户信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("okx:clientUser:query")
    @GetMapping("/{id}")
    public R<ClientUserVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(clientUserService.queryById(id));
    }

    /**
     * 新增系统用户信息
     */
    @SaCheckPermission("okx:clientUser:add")
    @Log(title = "系统用户信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ClientUserBo bo) {
        return toAjax(clientUserService.insertByBo(bo));
    }

    /**
     * 修改系统用户信息
     */
    @SaCheckPermission("okx:clientUser:edit")
    @Log(title = "系统用户信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ClientUserBo bo) {
        return toAjax(clientUserService.updateByBo(bo));
    }

    /**
     * 删除系统用户信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("okx:clientUser:remove")
    @Log(title = "系统用户信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(clientUserService.deleteWithValidByIds(List.of(ids), true));
    }
}
