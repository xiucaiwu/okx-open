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
import org.dromara.okx.domain.vo.CopytradingInfoVo;
import org.dromara.okx.domain.bo.CopytradingInfoBo;
import org.dromara.okx.service.ICopytradingInfoService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 交易员信息
 *
 * @author cc
 * @date 2024-04-28
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/okx/copytradingInfo")
public class CopytradingInfoController extends BaseController {

    private final ICopytradingInfoService copytradingInfoService;

    /**
     * 查询交易员信息列表
     */
    @SaCheckPermission("okx:copytradingInfo:list")
    @GetMapping("/list")
    public TableDataInfo<CopytradingInfoVo> list(CopytradingInfoBo bo, PageQuery pageQuery) {
        return copytradingInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出交易员信息列表
     */
    @SaCheckPermission("okx:copytradingInfo:export")
    @Log(title = "交易员信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(CopytradingInfoBo bo, HttpServletResponse response) {
        List<CopytradingInfoVo> list = copytradingInfoService.queryList(bo);
        ExcelUtil.exportExcel(list, "交易员信息", CopytradingInfoVo.class, response);
    }

    /**
     * 获取交易员信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("okx:copytradingInfo:query")
    @GetMapping("/{id}")
    public R<CopytradingInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(copytradingInfoService.queryById(id));
    }

    /**
     * 新增交易员信息
     */
    @SaCheckPermission("okx:copytradingInfo:add")
    @Log(title = "交易员信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CopytradingInfoBo bo) {
        return toAjax(copytradingInfoService.insertByBo(bo));
    }

    /**
     * 修改交易员信息
     */
    @SaCheckPermission("okx:copytradingInfo:edit")
    @Log(title = "交易员信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CopytradingInfoBo bo) {
        return toAjax(copytradingInfoService.updateByBo(bo));
    }

    /**
     * 删除交易员信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("okx:copytradingInfo:remove")
    @Log(title = "交易员信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(copytradingInfoService.deleteWithValidByIds(List.of(ids), true));
    }
}
