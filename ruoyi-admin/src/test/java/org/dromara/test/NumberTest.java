package org.dromara.test;

import cn.hutool.core.util.NumberUtil;

/**
 * @Author: chen
 * @Date: 2024-04-30  11:12
 * @Description: TODO
 * @Version: 1.0
 */
public class NumberTest {
    public static void main(String[] args) {
        String s = NumberUtil.formatPercent(Double.parseDouble("0.210056"), 2);
        System.out.println("s = " + s);
        String s1 = NumberUtil.decimalFormatMoney(Double.parseDouble("0.2200313"));
        System.out.println("s1 = " + s1);
        System.out.println((double) 50 * 10 / 62750);
    }
}
