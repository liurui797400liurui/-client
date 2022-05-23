package com.eagleeyes.jdbc.bean;

//奖惩信息管理
public class RewardInfo extends DataBaseInfo implements java.io.Serializable {
	private static final long serialVersionUID = -6735649590522142792L;
	
	 
	private int id;  
	private String name ; //姓名
	private String dep ;  //部门
	
	private String type ;
	private String leavetype ;
	private String leaveday ; 
	private String otday ; 
	private String money ;
	
	
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
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLeavetype() {
		return leavetype;
	}
	public void setLeavetype(String leavetype) {
		this.leavetype = leavetype;
	}
	public String getLeaveday() {
		return leaveday;
	}
	public void setLeaveday(String leaveday) {
		this.leaveday = leaveday;
	}
	public String getOtday() {
		return otday;
	}
	public void setOtday(String otday) {
		this.otday = otday;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	} 
	
	 
	 
	
	
	
	
	 
	
	
}
