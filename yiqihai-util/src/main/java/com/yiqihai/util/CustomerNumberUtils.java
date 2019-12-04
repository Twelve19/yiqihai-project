package com.yiqihai.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * 这个类用来生成用户账号
 */
public class CustomerNumberUtils {
    /**
     * 生成账号
     * 这个方法测试一万次内重复率低几乎为0
     * @return
     */
    public static String getCustomerNumber(){
        Calendar calendar = Calendar.getInstance();
        String time = new SimpleDateFormat("yyyy-MM-ddHHmmss").format(calendar.getTime()).toString();
        StringBuffer s = new StringBuffer(time.substring(14,16));
        Long sys = System.currentTimeMillis();
        s.append(sys.toString().substring(11,13));
        Double tm = Math.random()*10000+1;
        s.append(tm.toString().substring(tm.toString().length()-8,tm.toString().length()));
        return s.toString();
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<String>();
        for(int i = 0; i<10000;i++){
            list.add(CustomerNumberUtils.getCustomerNumber());
        }
        System.out.println("添加10000次结束");
        for (int i=0;i<list.size();i++) {
            for (int j=i+1;j<list.size();j++){
                //System.out.println("for j循环"+j);
                if(j == list.size()-1){
                    break;
                }
                if(list.get(i).equals(list.get(j))){
                    System.out.println("重复数据");
                    System.out.println(list.get(i));
                    System.out.println(list.get(j));
                    System.out.println(i);
                    System.out.println(j);
                }
            }
        }

    }
}
