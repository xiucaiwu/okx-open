package org.dromara.okx.util;

import io.github.group.robot.dingtalk.core.DingTalkRobotClient;
import io.github.group.robot.dingtalk.core.model.DingTalkRobotResponse;
import io.github.group.robot.dingtalk.core.model.TextMessage;
import io.github.group.robot.dingtalk.core.model.internal.AtMessage;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: chen
 * @Date: 2024-04-26  18:17
 * @Description: 钉钉机器人  跟单交易员开仓
 * @Version: 1.0
 */
@Component
public class DingTradeOrderRobot {

    @Value("${dingRobot.tradeOrder.webhook}")
    private String webhook;

    @Value("${dingRobot.tradeOrder.secret}")
    private String secret;

    public DingTalkRobotResponse sendTextMessage(String textMessage, List<String> atMobileList, boolean atAll) {
        TextMessage message = TextMessage.TextMessageBuilder.builder().at(
            AtMessage.AtMessageBuilder.builder()
                .atMobiles(atMobileList)
                .atAll(atAll)
                .build()
        ).content(textMessage).build();
        DingTalkRobotClient client = new DingTalkRobotClient(webhook, secret);
        return client.sendMessage(message);
    }
}
