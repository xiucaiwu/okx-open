package org.dromara.okx.service;

import org.dromara.okx.domain.InstPushInfo;
import org.dromara.okx.domain.vo.InstPushInfoVo;
import org.dromara.okx.domain.bo.InstPushInfoBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 定时推送币信息Service接口
 *
 * @author Lion Li
 * @date 2024-04-28
 */
public interface IInstPushInfoService {

    /**
     * 查询定时推送币信息
     */
    InstPushInfoVo queryById(Long id);

    /**
     * 查询定时推送币信息列表
     */
    TableDataInfo<InstPushInfoVo> queryPageList(InstPushInfoBo bo, PageQuery pageQuery);

    /**
     * 查询定时推送币信息列表
     */
    List<InstPushInfoVo> queryList(InstPushInfoBo bo);

    /**
     * 新增定时推送币信息
     */
    Boolean insertByBo(InstPushInfoBo bo);

    /**
     * 修改定时推送币信息
     */
    Boolean updateByBo(InstPushInfoBo bo);

    /**
     * 校验并批量删除定时推送币信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
