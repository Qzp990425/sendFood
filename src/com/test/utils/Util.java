package com.test.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Util {

	//时间格式化
	public static String formatDate(Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return dateFormat.format(date);
	}
    
	//获取UUID唯一标识
    public static String getRandomUUID() {
    	return UUID.randomUUID().toString().replace("-", "");
    }
    
}
