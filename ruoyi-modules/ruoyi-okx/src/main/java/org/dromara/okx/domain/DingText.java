package org.dromara.okx.domain;

import lombok.Data;

import java.util.List;

/**
 * @description:
 * @author: chen
 * @date: 2024/4/25 上午11:43
 **/
@Data
public class DingText {
    /**
     * 信息内容(例如添加了一个自定义关键词：监控报警，则这个机器人所发送的消息，【必须包含监控报警这个词，才能发送成功】）
     */
    private String content;

    /**
     * @指定人员手机号
     */
    private List<String> mobileList;

    /**
     * 是否@全体人员
     */
    private Boolean isAtAll;

    /**
     * @指定人员UserId
     */
    private List<String> userIds;
}
