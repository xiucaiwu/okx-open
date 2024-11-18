package org.dromara.okx.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.dromara.okx.domain.bo.SubPosHisBo;
import org.dromara.okx.domain.vo.SubPosHisVo;
import org.dromara.okx.domain.SubPosHis;
import org.dromara.okx.mapper.SubPosHisMapper;
import org.dromara.okx.service.ISubPosHisService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 交易员带单历史Service业务层处理
 *
 * @author cc
 * @date 2024-04-29
 */
@RequiredArgsConstructor
@Service
public class SubPosHisServiceImpl implements ISubPosHisService {

    private final SubPosHisMapper baseMapper;

    /**
     * 查询交易员带单历史
     */
    @Override
    public SubPosHisVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询交易员带单历史列表
     */
    @Override
    public TableDataInfo<SubPosHisVo> queryPageList(SubPosHisBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SubPosHis> lqw = buildQueryWrapper(bo);
        Page<SubPosHisVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询交易员带单历史列表
     */
    @Override
    public List<SubPosHisVo> queryList(SubPosHisBo bo) {
        LambdaQueryWrapper<SubPosHis> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<SubPosHis> buildQueryWrapper(SubPosHisBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<SubPosHis> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getInstId()), SubPosHis::getInstId, bo.getInstId());
        lqw.eq(StringUtils.isNotBlank(bo.getPosSide()), SubPosHis::getPosSide, bo.getPosSide());
        lqw.eq(StringUtils.isNotBlank(bo.getMgnMode()), SubPosHis::getMgnMode, bo.getMgnMode());
        lqw.eq(StringUtils.isNotBlank(bo.getLever()), SubPosHis::getLever, bo.getLever());
        lqw.eq(bo.getOpenTimeDate() != null, SubPosHis::getOpenTimeDate, bo.getOpenTimeDate());
        lqw.eq(bo.getCloseTimeDate() != null, SubPosHis::getCloseTimeDate, bo.getCloseTimeDate());
        lqw.eq(StringUtils.isNotBlank(bo.getInstType()), SubPosHis::getInstType, bo.getInstType());
        lqw.eq(StringUtils.isNotBlank(bo.getUniqueCode()), SubPosHis::getUniqueCode, bo.getUniqueCode());
        return lqw;
    }

    /**
     * 新增交易员带单历史
     */
    @Override
    public Boolean insertByBo(SubPosHisBo bo) {
        SubPosHis add = MapstructUtils.convert(bo, SubPosHis.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改交易员带单历史
     */
    @Override
    public Boolean updateByBo(SubPosHisBo bo) {
        SubPosHis update = MapstructUtils.convert(bo, SubPosHis.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(SubPosHis entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除交易员带单历史
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
