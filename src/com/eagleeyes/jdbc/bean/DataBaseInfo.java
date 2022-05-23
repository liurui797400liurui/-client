package com.eagleeyes.jdbc.bean;

import java.util.Date;

public class DataBaseInfo implements java.io.Serializable {
	
	private static final long serialVersionUID = 2088724121257491889L;
	
	private String  createperson;//创建人
	private Date	createtime ; //创建时间
	
	
	public String getCreateperson() {
		return createperson;
	}
	public void setCreateperson(String createperson) {
		this.createperson = createperson;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	 
	 
	
	
	 
}