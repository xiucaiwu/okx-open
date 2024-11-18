package org.dromara.okx.service;

import org.dromara.okx.domain.UserSwapConfig;
import org.dromara.okx.domain.vo.UserSwapConfigVo;
import org.dromara.okx.domain.bo.UserSwapConfigBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 用户合约跟单配置Service接口
 *
 * @author cc
 * @date 2024-05-08
 */
public interface IUserSwapConfigService {

    /**
     * 查询用户合约跟单配置
     */
    UserSwapConfigVo queryById(Long id);

    /**
     * 查询用户合约跟单配置列表
     */
    TableDataInfo<UserSwapConfigVo> queryPageList(UserSwapConfigBo bo, PageQuery pageQuery);

    /**
     * 查询用户合约跟单配置列表
     */
    List<UserSwapConfigVo> queryList(UserSwapConfigBo bo);

    /**
     * 新增用户合约跟单配置
     */
    Boolean insertByBo(UserSwapConfigBo bo);

    /**
     * 修改用户合约跟单配置
     */
    Boolean updateByBo(UserSwapConfigBo bo);

    /**
     * 校验并批量删除用户合约跟单配置信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
