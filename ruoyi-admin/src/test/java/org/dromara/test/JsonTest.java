package org.dromara.test;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;

/**
 * @Author: chen
 * @Date: 2024-04-25  18:24
 * @Description: TODO
 * @Version: 1.0
 */
public class JsonTest {
    public static void main(String[] args) {
        test2();
    }

    //测试浮点数转json字符串效果
    public static void test2(){
        HashMap<String, Float> floatHashMap = new HashMap<>();
        floatHashMap.put("floatPrice", 1.0f);
        String floatJsonString = JSON.toJSONString(floatHashMap);
        System.out.println("floatJsonString = " + floatJsonString);

        HashMap<String, Double> doubleHashMap = new HashMap<>();
        doubleHashMap.put("doublePrice", 2.00);
        String doubleJsonString = JSON.toJSONString(doubleHashMap);
        System.out.println("doubleJsonString = " + doubleJsonString);

    }

    public static void test1(){
        String jsonString = "{\"id\":1,\"floatPrice\":\"1.0\",\"doublePrice\":\"2.00\"}";
        Good good = JSON.parseObject(jsonString, Good.class);
        System.out.println("good = " + good);
    }

    public static class Good{
        private int id;
        private String floatPrice;
        private String doublePrice;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getFloatPrice() {
            return floatPrice;
        }

        public void setFloatPrice(String floatPrice) {
            this.floatPrice = floatPrice;
        }

        public String getDoublePrice() {
            return doublePrice;
        }

        public void setDoublePrice(String doublePrice) {
            this.doublePrice = doublePrice;
        }

        @Override
        public String toString() {
            return "good{" +
                    "id=" + id +
                    ", floatPrice='" + floatPrice + '\'' +
                    ", doublePrice='" + doublePrice + '\'' +
                    '}';
        }
    }
}
