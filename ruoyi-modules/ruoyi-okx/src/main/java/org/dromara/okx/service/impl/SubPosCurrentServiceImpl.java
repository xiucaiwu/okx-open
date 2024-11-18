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
import org.dromara.okx.domain.bo.SubPosCurrentBo;
import org.dromara.okx.domain.vo.SubPosCurrentVo;
import org.dromara.okx.domain.SubPosCurrent;
import org.dromara.okx.mapper.SubPosCurrentMapper;
import org.dromara.okx.service.ISubPosCurrentService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 交易员当前带单Service业务层处理
 *
 * @author cc
 * @date 2024-04-29
 */
@RequiredArgsConstructor
@Service
public class SubPosCurrentServiceImpl implements ISubPosCurrentService {

    private final SubPosCurrentMapper baseMapper;

    /**
     * 查询交易员当前带单
     */
    @Override
    public SubPosCurrentVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询交易员当前带单列表
     */
    @Override
    public TableDataInfo<SubPosCurrentVo> queryPageList(SubPosCurrentBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SubPosCurrent> lqw = buildQueryWrapper(bo);
        Page<SubPosCurrentVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询交易员当前带单列表
     */
    @Override
    public List<SubPosCurrentVo> queryList(SubPosCurrentBo bo) {
        LambdaQueryWrapper<SubPosCurrent> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<SubPosCurrent> buildQueryWrapper(SubPosCurrentBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<SubPosCurrent> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getInstId()), SubPosCurrent::getInstId, bo.getInstId());
        lqw.eq(StringUtils.isNotBlank(bo.getPosSide()), SubPosCurrent::getPosSide, bo.getPosSide());
        lqw.eq(StringUtils.isNotBlank(bo.getMgnMode()), SubPosCurrent::getMgnMode, bo.getMgnMode());
        lqw.eq(StringUtils.isNotBlank(bo.getLever()), SubPosCurrent::getLever, bo.getLever());
        lqw.eq(bo.getOpenTimeDate() != null, SubPosCurrent::getOpenTimeDate, bo.getOpenTimeDate());
        lqw.eq(StringUtils.isNotBlank(bo.getInstType()), SubPosCurrent::getInstType, bo.getInstType());
        lqw.eq(StringUtils.isNotBlank(bo.getUniqueCode()), SubPosCurrent::getUniqueCode, bo.getUniqueCode());
        return lqw;
    }

    /**
     * 新增交易员当前带单
     */
    @Override
    public Boolean insertByBo(SubPosCurrentBo bo) {
        SubPosCurrent add = MapstructUtils.convert(bo, SubPosCurrent.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改交易员当前带单
     */
    @Override
    public Boolean updateByBo(SubPosCurrentBo bo) {
        SubPosCurrent update = MapstructUtils.convert(bo, SubPosCurrent.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(SubPosCurrent entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除交易员当前带单
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
