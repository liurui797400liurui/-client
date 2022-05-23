package com.eagleeyes.jdbc.db;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.util.Arrays;
import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
@RunWith(Parameterized.class)
public class TestCommonParam {
	public String expected; 
	public String key;
    public TestCommonParam(String key,String expected){  
        this.expected = expected; 
        this.key = key;  

    }      
    @Parameters  
    public static Collection prepareData(){  
        Object[][] object = {//参数化
        		{"",""},
        		{"null",""},
        		{"jdbc.driverClassName","com.mysql.jdbc.Driver"},
        		{"jdbc.url","jdbc:mysql://127.0.0.1:3306/pay?useUnicode=true&amp;characterEncoding=utf8&amp;autoReconnect=true&amp;failOverReadOnly=false"},
        		{"jdbc.username","root"}, 
        		{"jdbc.password","root"}
        		};  
        return Arrays.asList(object);  
    } 
    @Test
    public void testgetString1() {
		CommonParam c=new CommonParam();
		assertEquals("root", c.getString("jdbc.password"));		
	}
	
	@Test
	public void testgetString() {
		CommonParam c=new CommonParam();
		System.out.println("输入key="+key+",预期结果="+expected+" 实际结果="+c.getString(key));
		assertEquals(expected, c.getString(key));		
	}

}
