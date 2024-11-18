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
import org.dromara.okx.domain.vo.SubPosHisVo;
import org.dromara.okx.domain.bo.SubPosHisBo;
import org.dromara.okx.service.ISubPosHisService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 交易员带单历史
 *
 * @author cc
 * @date 2024-04-29
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/okx/subPosHis")
public class SubPosHisController extends BaseController {

    private final ISubPosHisService subPosHisService;

    /**
     * 查询交易员带单历史列表
     */
    @SaCheckPermission("okx:subPosHis:list")
    @GetMapping("/list")
    public TableDataInfo<SubPosHisVo> list(SubPosHisBo bo, PageQuery pageQuery) {
        return subPosHisService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出交易员带单历史列表
     */
    @SaCheckPermission("okx:subPosHis:export")
    @Log(title = "交易员带单历史", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(SubPosHisBo bo, HttpServletResponse response) {
        List<SubPosHisVo> list = subPosHisService.queryList(bo);
        ExcelUtil.exportExcel(list, "交易员带单历史", SubPosHisVo.class, response);
    }

    /**
     * 获取交易员带单历史详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("okx:subPosHis:query")
    @GetMapping("/{id}")
    public R<SubPosHisVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(subPosHisService.queryById(id));
    }

    /**
     * 新增交易员带单历史
     */
    @SaCheckPermission("okx:subPosHis:add")
    @Log(title = "交易员带单历史", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody SubPosHisBo bo) {
        return toAjax(subPosHisService.insertByBo(bo));
    }

    /**
     * 修改交易员带单历史
     */
    @SaCheckPermission("okx:subPosHis:edit")
    @Log(title = "交易员带单历史", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody SubPosHisBo bo) {
        return toAjax(subPosHisService.updateByBo(bo));
    }

    /**
     * 删除交易员带单历史
     *
     * @param ids 主键串
     */
    @SaCheckPermission("okx:subPosHis:remove")
    @Log(title = "交易员带单历史", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(subPosHisService.deleteWithValidByIds(List.of(ids), true));
    }
}
