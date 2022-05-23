package com.eagleeyes.jdbc.bean;
//类别
public class LeibieInfo extends DataBaseInfo implements java.io.Serializable {
	
	private static final long serialVersionUID = -4005769274450018735L;
	
	private int 	id;
	private String 	name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	 
	
	
}
