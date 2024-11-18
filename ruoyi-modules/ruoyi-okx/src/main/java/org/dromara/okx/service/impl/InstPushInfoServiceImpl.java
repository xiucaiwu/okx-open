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
import org.dromara.okx.domain.bo.InstPushInfoBo;
import org.dromara.okx.domain.vo.InstPushInfoVo;
import org.dromara.okx.domain.InstPushInfo;
import org.dromara.okx.mapper.InstPushInfoMapper;
import org.dromara.okx.service.IInstPushInfoService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 定时推送币信息Service业务层处理
 *
 * @author Lion Li
 * @date 2024-04-28
 */
@RequiredArgsConstructor
@Service
public class InstPushInfoServiceImpl implements IInstPushInfoService {

    private final InstPushInfoMapper baseMapper;

    /**
     * 查询定时推送币信息
     */
    @Override
    public InstPushInfoVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询定时推送币信息列表
     */
    @Override
    public TableDataInfo<InstPushInfoVo> queryPageList(InstPushInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<InstPushInfo> lqw = buildQueryWrapper(bo);
        Page<InstPushInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询定时推送币信息列表
     */
    @Override
    public List<InstPushInfoVo> queryList(InstPushInfoBo bo) {
        LambdaQueryWrapper<InstPushInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<InstPushInfo> buildQueryWrapper(InstPushInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<InstPushInfo> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), InstPushInfo::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getInstId()), InstPushInfo::getInstId, bo.getInstId());
        lqw.eq(StringUtils.isNotBlank(bo.getInstType()), InstPushInfo::getInstType, bo.getInstType());
        return lqw;
    }

    /**
     * 新增定时推送币信息
     */
    @Override
    public Boolean insertByBo(InstPushInfoBo bo) {
        InstPushInfo add = MapstructUtils.convert(bo, InstPushInfo.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改定时推送币信息
     */
    @Override
    public Boolean updateByBo(InstPushInfoBo bo) {
        InstPushInfo update = MapstructUtils.convert(bo, InstPushInfo.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(InstPushInfo entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除定时推送币信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
