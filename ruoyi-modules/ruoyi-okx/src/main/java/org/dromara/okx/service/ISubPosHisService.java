package org.dromara.okx.service;

import org.dromara.okx.domain.SubPosHis;
import org.dromara.okx.domain.vo.SubPosHisVo;
import org.dromara.okx.domain.bo.SubPosHisBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 交易员带单历史Service接口
 *
 * @author cc
 * @date 2024-04-29
 */
public interface ISubPosHisService {

    /**
     * 查询交易员带单历史
     */
    SubPosHisVo queryById(Long id);

    /**
     * 查询交易员带单历史列表
     */
    TableDataInfo<SubPosHisVo> queryPageList(SubPosHisBo bo, PageQuery pageQuery);

    /**
     * 查询交易员带单历史列表
     */
    List<SubPosHisVo> queryList(SubPosHisBo bo);

    /**
     * 新增交易员带单历史
     */
    Boolean insertByBo(SubPosHisBo bo);

    /**
     * 修改交易员带单历史
     */
    Boolean updateByBo(SubPosHisBo bo);

    /**
     * 校验并批量删除交易员带单历史信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
