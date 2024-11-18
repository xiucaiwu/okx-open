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
import org.dromara.okx.domain.vo.InstPushInfoVo;
import org.dromara.okx.domain.bo.InstPushInfoBo;
import org.dromara.okx.service.IInstPushInfoService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 定时推送币信息
 *
 * @author Lion Li
 * @date 2024-04-28
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/okx/initpushInfo")
public class InstPushInfoController extends BaseController {

    private final IInstPushInfoService instPushInfoService;

    /**
     * 查询定时推送币信息列表
     */
    @SaCheckPermission("okx:initpushInfo:list")
    @GetMapping("/list")
    public TableDataInfo<InstPushInfoVo> list(InstPushInfoBo bo, PageQuery pageQuery) {
        return instPushInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出定时推送币信息列表
     */
    @SaCheckPermission("okx:initpushInfo:export")
    @Log(title = "定时推送币信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(InstPushInfoBo bo, HttpServletResponse response) {
        List<InstPushInfoVo> list = instPushInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "定时推送币信息", InstPushInfoVo.class, response);
    }

    /**
     * 获取定时推送币信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("okx:initpushInfo:query")
    @GetMapping("/{id}")
    public R<InstPushInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(instPushInfoService.queryById(id));
    }

    /**
     * 新增定时推送币信息
     */
    @SaCheckPermission("okx:initpushInfo:add")
    @Log(title = "定时推送币信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody InstPushInfoBo bo) {
        return toAjax(instPushInfoService.insertByBo(bo));
    }

    /**
     * 修改定时推送币信息
     */
    @SaCheckPermission("okx:initpushInfo:edit")
    @Log(title = "定时推送币信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody InstPushInfoBo bo) {
        return toAjax(instPushInfoService.updateByBo(bo));
    }

    /**
     * 删除定时推送币信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("okx:initpushInfo:remove")
    @Log(title = "定时推送币信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(instPushInfoService.deleteWithValidByIds(List.of(ids), true));
    }
}
