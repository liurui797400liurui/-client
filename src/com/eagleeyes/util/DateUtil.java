package com.eagleeyes.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class DateUtil {
	
	public static String formatY4M2D2H2M2S2ToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String d = sdf.format(date);
		return d;
	}
	
	public static String formatY4M2D2H2M2S2ToStringGuahao(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH-mm-ss");
		String d = sdf.format(date);
		return d;
	}

	public static Date stringToLongDate(String str) {
		if (StringUtils.isBlank(str)) {
			return new Date();
		}
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Date date = new Date();   
		try {   
		    date = format.parse(str); 
		} catch (ParseException e) { 
		    e.printStackTrace();   
		}
		return date;  
	}
	
	public static Date stringToShortDate(String str) {
		if (StringUtils.isBlank(str)) {
			return new Date();
		}
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date date = new Date();   
		try {   
		    date = format.parse(str); 
		} catch (ParseException e) { 
		    e.printStackTrace();   
		}
		return date;  
	}
	
	public static String  dateLongToString(Date date) {
	    String dateStr = "";  
	    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    try {  
	        dateStr = sdf.format(date);  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }
		return dateStr;
	}
	public static String  dateShortToString(Date date) {
	    String dateStr = "";  
	    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
	    try {  
	        dateStr = sdf.format(date);  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }
		return dateStr;
	}

}
