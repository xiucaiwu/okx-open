package org.dromara.okx.util;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiRobotSendRequest;
import com.dingtalk.api.response.OapiRobotSendResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.hc.client5.http.utils.Base64;
import org.dromara.okx.domain.DingText;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * @description: 钉钉机器人   老版的  暂不使用
 * @author: chen
 * @date: 2024/4/25 上午11:41
 **/
@Slf4j
public class OldDingRobotUtil {

   //群机器人复制到的秘钥secret
    private static final String SECRET = "SEC397d2014ced95308e8e18f04a788613ad097d8fef04428cca564aad183ade824";
    /**
     * 配置机器人的webhook
     */
    private static final String WEBHOOK = "https://oapi.dingtalk.com/robot/send?access_token=414efa5ca1ab564413029d1b8c0b37bf0ef326fc3093c7464d57ab328e5dc3f0";

    // 自定义机器人接入 https://open.dingtalk.com/document/robots/custom-robot-access
    // 机器人安全设置 https://open.dingtalk.com/document/robots/customize-robot-security-settings
    // 接口文档：https://open.dingtalk.com/document/group/custom-robot-access

    public static void main(String[] args) throws Exception {
        DingText dingText = new DingText();

        List<String> mList = new ArrayList<>();
        mList.add("15516995759");

        //艾特全体
        //dingText.setIsAtAll(true);
        dingText.setMobileList(mList);
        dingText.setUserIds(null);

        dingText.setContent("测试消息");

        getDingText(dingText);
    }


    public static Boolean getDingText(DingText dingText) throws Exception {
        /* 自定义机器人安全设置-加密 */
        String dingUrl = getDingUrl();
        // 1、根据机器人的token获取DingTalkClient
        DingTalkClient client = new DefaultDingTalkClient(dingUrl);
        // 2、创建请求对象
        OapiRobotSendRequest request = new OapiRobotSendRequest();
        // 3、设置机器人发送信息类型-文本消息
        request.setMsgtype("text");
        // 4、new OapiRobotSendRequest获取发送信息类型对象
        OapiRobotSendRequest.Text text = new OapiRobotSendRequest.Text();
        // 5、设置文本信息
        text.setContent(dingText.getContent());
        request.setText(text);

        // 6、设置配置信息
        OapiRobotSendRequest.At at = new OapiRobotSendRequest.At();
        // 设置手机号
        at.setAtMobiles(dingText.getMobileList());
        // isAtAll类型如果不为Boolean，请升级至最新SDK
        // @全体人员
        at.setIsAtAll(dingText.getIsAtAll());
        // 7、设置UserIds
        at.setAtUserIds(dingText.getUserIds());
        request.setAt(at);
        // 8、发送信息
        OapiRobotSendResponse response = client.execute(request);
        log.info("[Text类型-code]:[{}]", response.getErrorCode());
        log.info("[Text类型-返回信息]:[{}]", response.getErrmsg());
        if (!response.getErrorCode().equals("0")) {
            log.info("钉钉通知发送失败");
        } else {
            log.info("钉钉通知发送成功");
            return true;
        }
        return false;
    }


    /**
     * @return java.lang.String
     * @description [自定义机器人安全设置-加签-获取请求url]
     * @author ･ᴗ･
     * @method getDingUrl
     * @date 2022/8/16 11:04
     */
    private static String getDingUrl() throws Exception {
        // 获取系统时间戳
        Long timestamp = System.currentTimeMillis();
        // 拼接
        String stringToSign = timestamp + "\n" + SECRET;
        // 使用HmacSHA256算法计算签名
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(SECRET.getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
        byte[] signData = mac.doFinal(stringToSign.getBytes(StandardCharsets.UTF_8));
        // 进行Base64 encode 得到最后的sign，可以拼接进url里
        String sign = URLEncoder.encode(new String(Base64.encodeBase64(signData)), "UTF-8");
        // 钉钉机器人地址（配置机器人的webhook），为了让每次请求不同，避免钉钉拦截，加上时间戳
        String dingUrl = WEBHOOK + "&timestamp=" + timestamp + "&sign=" + sign;
        return dingUrl;
    }
}
