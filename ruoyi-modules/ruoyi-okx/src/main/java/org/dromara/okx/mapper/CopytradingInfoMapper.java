package org.dromara.okx.mapper;

import org.dromara.okx.domain.ClientUser;
import org.dromara.okx.domain.CopytradingInfo;
import org.dromara.okx.domain.vo.CopytradingInfoVo;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;

import java.util.List;

/**
 * 交易员信息Mapper接口
 *
 * @author cc
 * @date 2024-04-28
 */
public interface CopytradingInfoMapper extends BaseMapperPlus<CopytradingInfo, CopytradingInfoVo> {

    List<ClientUser> getFollowList(Long id);
}
