package org.dromara.okx.util;

/**
 * @Author: chen
 * @Date: 2024-04-25  18:40
 * @Description: TODO
 * @Version: 1.0
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

public class DateTimeUtil {

    public static final String standard_format = "yyyy-MM-dd HH:mm:ss";

    /**
     * 将给定的毫秒值转换为LocalDateTime类型，使用系统默认时区。
     *
     * @param millis 时间的毫秒值
     * @return 转换后的LocalDateTime对象
     */
    public static LocalDateTime convertMillisToLocalDateTime(long millis) {
        return convertMillisToLocalDateTime(millis, ZoneId.systemDefault());
    }

    /**
     * 将给定的毫秒值转换为LocalDateTime类型，使用指定的时区。
     *
     * @param millis 时间的毫秒值
     * @param zoneId 指定时区的ZoneId对象  ZoneId newYorkTimeZone = ZoneId.of("America/New_York");
     * @return 转换后的LocalDateTime对象
     */
    public static LocalDateTime convertMillisToLocalDateTime(long millis, ZoneId zoneId) {
        Instant instant = Instant.ofEpochMilli(millis);
        ZonedDateTime zonedDateTime = instant.atZone(zoneId);
        return zonedDateTime.toLocalDateTime();
    }

    public static String formatDate(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static Date parseDate(String date, String format) throws ParseException {
        return new SimpleDateFormat(format).parse(date);
    }


}

