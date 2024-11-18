package org.dromara.okx.service;

import org.dromara.okx.domain.SubPosCurrent;
import org.dromara.okx.domain.vo.SubPosCurrentVo;
import org.dromara.okx.domain.bo.SubPosCurrentBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 交易员当前带单Service接口
 *
 * @author cc
 * @date 2024-04-29
 */
public interface ISubPosCurrentService {

    /**
     * 查询交易员当前带单
     */
    SubPosCurrentVo queryById(Long id);

    /**
     * 查询交易员当前带单列表
     */
    TableDataInfo<SubPosCurrentVo> queryPageList(SubPosCurrentBo bo, PageQuery pageQuery);

    /**
     * 查询交易员当前带单列表
     */
    List<SubPosCurrentVo> queryList(SubPosCurrentBo bo);

    /**
     * 新增交易员当前带单
     */
    Boolean insertByBo(SubPosCurrentBo bo);

    /**
     * 修改交易员当前带单
     */
    Boolean updateByBo(SubPosCurrentBo bo);

    /**
     * 校验并批量删除交易员当前带单信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
