package org.dromara.okx.service;

import org.dromara.okx.domain.ClientUser;
import org.dromara.okx.domain.vo.ClientUserVo;
import org.dromara.okx.domain.bo.ClientUserBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 系统用户信息Service接口
 *
 * @author cc
 * @date 2024-04-30
 */
public interface IClientUserService {

    /**
     * 查询系统用户信息
     */
    ClientUserVo queryById(Long id);

    /**
     * 查询系统用户信息列表
     */
    TableDataInfo<ClientUserVo> queryPageList(ClientUserBo bo, PageQuery pageQuery);

    /**
     * 查询系统用户信息列表
     */
    List<ClientUserVo> queryList(ClientUserBo bo);

    /**
     * 新增系统用户信息
     */
    Boolean insertByBo(ClientUserBo bo);

    /**
     * 修改系统用户信息
     */
    Boolean updateByBo(ClientUserBo bo);

    /**
     * 校验并批量删除系统用户信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
