package org.dromara.okx.service;

import org.dromara.okx.domain.CopytradingInfo;
import org.dromara.okx.domain.vo.CopytradingInfoVo;
import org.dromara.okx.domain.bo.CopytradingInfoBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 交易员信息Service接口
 *
 * @author cc
 * @date 2024-04-28
 */
public interface ICopytradingInfoService {

    /**
     * 查询交易员信息
     */
    CopytradingInfoVo queryById(Long id);

    /**
     * 查询交易员信息列表
     */
    TableDataInfo<CopytradingInfoVo> queryPageList(CopytradingInfoBo bo, PageQuery pageQuery);

    /**
     * 查询交易员信息列表
     */
    List<CopytradingInfoVo> queryList(CopytradingInfoBo bo);

    /**
     * 新增交易员信息
     */
    Boolean insertByBo(CopytradingInfoBo bo);

    /**
     * 修改交易员信息
     */
    Boolean updateByBo(CopytradingInfoBo bo);

    /**
     * 校验并批量删除交易员信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
