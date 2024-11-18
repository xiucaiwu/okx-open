package org.dromara.okx.mapper;

import org.dromara.okx.domain.SubPosCurrent;
import org.dromara.okx.domain.vo.SubPosCurrentVo;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;

import java.util.List;

/**
 * 交易员当前带单Mapper接口
 *
 * @author cc
 * @date 2024-04-29
 */
public interface SubPosCurrentMapper extends BaseMapperPlus<SubPosCurrent, SubPosCurrentVo> {

    List<SubPosCurrent> selectNewRecord();

}
