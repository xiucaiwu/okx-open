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
import org.dromara.okx.domain.vo.SubPosCurrentVo;
import org.dromara.okx.domain.bo.SubPosCurrentBo;
import org.dromara.okx.service.ISubPosCurrentService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 交易员当前带单
 *
 * @author cc
 * @date 2024-04-29
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/okx/subPosCurrent")
public class SubPosCurrentController extends BaseController {

    private final ISubPosCurrentService subPosCurrentService;

    /**
     * 查询交易员当前带单列表
     */
    @SaCheckPermission("okx:subPosCurrent:list")
    @GetMapping("/list")
    public TableDataInfo<SubPosCurrentVo> list(SubPosCurrentBo bo, PageQuery pageQuery) {
        return subPosCurrentService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出交易员当前带单列表
     */
    @SaCheckPermission("okx:subPosCurrent:export")
    @Log(title = "交易员当前带单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(SubPosCurrentBo bo, HttpServletResponse response) {
        List<SubPosCurrentVo> list = subPosCurrentService.queryList(bo);
        ExcelUtil.exportExcel(list, "交易员当前带单", SubPosCurrentVo.class, response);
    }

    /**
     * 获取交易员当前带单详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("okx:subPosCurrent:query")
    @GetMapping("/{id}")
    public R<SubPosCurrentVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(subPosCurrentService.queryById(id));
    }

    /**
     * 新增交易员当前带单
     */
    @SaCheckPermission("okx:subPosCurrent:add")
    @Log(title = "交易员当前带单", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody SubPosCurrentBo bo) {
        return toAjax(subPosCurrentService.insertByBo(bo));
    }

    /**
     * 修改交易员当前带单
     */
    @SaCheckPermission("okx:subPosCurrent:edit")
    @Log(title = "交易员当前带单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody SubPosCurrentBo bo) {
        return toAjax(subPosCurrentService.updateByBo(bo));
    }

    /**
     * 删除交易员当前带单
     *
     * @param ids 主键串
     */
    @SaCheckPermission("okx:subPosCurrent:remove")
    @Log(title = "交易员当前带单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(subPosCurrentService.deleteWithValidByIds(List.of(ids), true));
    }
}
