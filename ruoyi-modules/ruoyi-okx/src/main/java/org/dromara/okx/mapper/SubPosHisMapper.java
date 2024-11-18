package org.dromara.okx.mapper;

import org.dromara.okx.domain.SubPosHis;
import org.dromara.okx.domain.vo.SubPosHisVo;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;

import java.util.List;

/**
 * 交易员带单历史Mapper接口
 *
 * @author cc
 * @date 2024-04-29
 */
public interface SubPosHisMapper extends BaseMapperPlus<SubPosHis, SubPosHisVo> {

    List<SubPosHis> selectNewRecord();
}
