package com.eagleeyes.jdbc.db;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * 获取配置资源文件信息
 */
public class CommonParam {
	
    private String propertyFileName;
    private  ResourceBundle resourceBundle;
    
    public CommonParam() {
        propertyFileName = "dbConfig";
        resourceBundle = ResourceBundle.getBundle(propertyFileName);
    }
    
    public  String getString(String key) {
    	
        if (key == null || key.equals("") || key.equals("null")) {
            return "";
        }
        String result = "";
        try {
            result = resourceBundle.getString(key);
        } catch (MissingResourceException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
    public static void main(String[] args) {
    	
    	CommonParam commonParam = new CommonParam();
    	String  driver = commonParam.getString("jdbc.driverClassName");
    	System.out.println(driver);
	}
    
    
    
}