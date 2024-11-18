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
import org.dromara.okx.domain.bo.ClientUserBo;
import org.dromara.okx.domain.vo.ClientUserVo;
import org.dromara.okx.domain.ClientUser;
import org.dromara.okx.mapper.ClientUserMapper;
import org.dromara.okx.service.IClientUserService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 系统用户信息Service业务层处理
 *
 * @author cc
 * @date 2024-04-30
 */
@RequiredArgsConstructor
@Service
public class ClientUserServiceImpl implements IClientUserService {

    private final ClientUserMapper baseMapper;

    /**
     * 查询系统用户信息
     */
    @Override
    public ClientUserVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询系统用户信息列表
     */
    @Override
    public TableDataInfo<ClientUserVo> queryPageList(ClientUserBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ClientUser> lqw = buildQueryWrapper(bo);
        Page<ClientUserVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询系统用户信息列表
     */
    @Override
    public List<ClientUserVo> queryList(ClientUserBo bo) {
        LambdaQueryWrapper<ClientUser> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ClientUser> buildQueryWrapper(ClientUserBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ClientUser> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getUsername()), ClientUser::getUsername, bo.getUsername());
        lqw.like(StringUtils.isNotBlank(bo.getNickName()), ClientUser::getNickName, bo.getNickName());
        lqw.eq(StringUtils.isNotBlank(bo.getTel()), ClientUser::getTel, bo.getTel());
        lqw.eq(StringUtils.isNotBlank(bo.getDingTel()), ClientUser::getDingTel, bo.getDingTel());
        lqw.eq(StringUtils.isNotBlank(bo.getQq()), ClientUser::getQq, bo.getQq());
        lqw.eq(StringUtils.isNotBlank(bo.getSex()), ClientUser::getSex, bo.getSex());
        lqw.eq(bo.getLastLoginTime() != null, ClientUser::getLastLoginTime, bo.getLastLoginTime());
        return lqw;
    }

    /**
     * 新增系统用户信息
     */
    @Override
    public Boolean insertByBo(ClientUserBo bo) {
        ClientUser add = MapstructUtils.convert(bo, ClientUser.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改系统用户信息
     */
    @Override
    public Boolean updateByBo(ClientUserBo bo) {
        ClientUser update = MapstructUtils.convert(bo, ClientUser.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ClientUser entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除系统用户信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
