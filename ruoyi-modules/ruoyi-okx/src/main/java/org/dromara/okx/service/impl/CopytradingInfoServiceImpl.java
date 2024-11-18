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
import org.dromara.okx.domain.bo.CopytradingInfoBo;
import org.dromara.okx.domain.vo.CopytradingInfoVo;
import org.dromara.okx.domain.CopytradingInfo;
import org.dromara.okx.mapper.CopytradingInfoMapper;
import org.dromara.okx.service.ICopytradingInfoService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 交易员信息Service业务层处理
 *
 * @author cc
 * @date 2024-04-28
 */
@RequiredArgsConstructor
@Service
public class CopytradingInfoServiceImpl implements ICopytradingInfoService {

    private final CopytradingInfoMapper baseMapper;

    /**
     * 查询交易员信息
     */
    @Override
    public CopytradingInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询交易员信息列表
     */
    @Override
    public TableDataInfo<CopytradingInfoVo> queryPageList(CopytradingInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<CopytradingInfo> lqw = buildQueryWrapper(bo);
        Page<CopytradingInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询交易员信息列表
     */
    @Override
    public List<CopytradingInfoVo> queryList(CopytradingInfoBo bo) {
        LambdaQueryWrapper<CopytradingInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<CopytradingInfo> buildQueryWrapper(CopytradingInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<CopytradingInfo> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), CopytradingInfo::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getUniqueCode()), CopytradingInfo::getUniqueCode, bo.getUniqueCode());
        lqw.eq(StringUtils.isNotBlank(bo.getRecomIndex()), CopytradingInfo::getRecomIndex, bo.getRecomIndex());
        lqw.eq(StringUtils.isNotBlank(bo.getPlatform()), CopytradingInfo::getPlatform, bo.getPlatform());
        return lqw;
    }

    /**
     * 新增交易员信息
     */
    @Override
    public Boolean insertByBo(CopytradingInfoBo bo) {
        CopytradingInfo add = MapstructUtils.convert(bo, CopytradingInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改交易员信息
     */
    @Override
    public Boolean updateByBo(CopytradingInfoBo bo) {
        CopytradingInfo update = MapstructUtils.convert(bo, CopytradingInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(CopytradingInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除交易员信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
