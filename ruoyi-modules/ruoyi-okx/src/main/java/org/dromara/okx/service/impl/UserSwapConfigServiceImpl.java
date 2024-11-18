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
import org.dromara.okx.domain.bo.UserSwapConfigBo;
import org.dromara.okx.domain.vo.UserSwapConfigVo;
import org.dromara.okx.domain.UserSwapConfig;
import org.dromara.okx.mapper.UserSwapConfigMapper;
import org.dromara.okx.service.IUserSwapConfigService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 用户合约跟单配置Service业务层处理
 *
 * @author cc
 * @date 2024-05-08
 */
@RequiredArgsConstructor
@Service
public class UserSwapConfigServiceImpl implements IUserSwapConfigService {

    private final UserSwapConfigMapper baseMapper;

    /**
     * 查询用户合约跟单配置
     */
    @Override
    public UserSwapConfigVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询用户合约跟单配置列表
     */
    @Override
    public TableDataInfo<UserSwapConfigVo> queryPageList(UserSwapConfigBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<UserSwapConfig> lqw = buildQueryWrapper(bo);
        Page<UserSwapConfigVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询用户合约跟单配置列表
     */
    @Override
    public List<UserSwapConfigVo> queryList(UserSwapConfigBo bo) {
        LambdaQueryWrapper<UserSwapConfig> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<UserSwapConfig> buildQueryWrapper(UserSwapConfigBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<UserSwapConfig> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getUserId() != null, UserSwapConfig::getUserId, bo.getUserId());
        lqw.eq(StringUtils.isNotBlank(bo.getUniqueCode()), UserSwapConfig::getUniqueCode, bo.getUniqueCode());
        lqw.eq(StringUtils.isNotBlank(bo.getInstId()), UserSwapConfig::getInstId, bo.getInstId());
        lqw.eq(StringUtils.isNotBlank(bo.getMgnMode()), UserSwapConfig::getMgnMode, bo.getMgnMode());
        lqw.eq(StringUtils.isNotBlank(bo.getInstType()), UserSwapConfig::getInstType, bo.getInstType());
        return lqw;
    }

    /**
     * 新增用户合约跟单配置
     */
    @Override
    public Boolean insertByBo(UserSwapConfigBo bo) {
        UserSwapConfig add = MapstructUtils.convert(bo, UserSwapConfig.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改用户合约跟单配置
     */
    @Override
    public Boolean updateByBo(UserSwapConfigBo bo) {
        UserSwapConfig update = MapstructUtils.convert(bo, UserSwapConfig.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(UserSwapConfig entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除用户合约跟单配置
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
