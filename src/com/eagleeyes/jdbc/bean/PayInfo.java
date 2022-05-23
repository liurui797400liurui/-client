package com.eagleeyes.jdbc.bean;

//工资信息管理
public class PayInfo extends DataBaseInfo implements java.io.Serializable {
	private static final long serialVersionUID = -6735649590522142790L;
	
	 
	private int id;  
	private String name ; //姓名
	private String dep ;  //部门
	private String basepay ;
	private String jixiaopay ;
	private String fourx ; 
	private String zhufang ; 
	private String traffic ; 
	private String communi ;
	private String mealallow ;
	private String attendsub ;
	private String otmoney ;
	private String award ;
	private String shouldgive ;
	private String tax ;
	private String reallygive ;
	
	
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
	public String getBasepay() {
		return basepay;
	}
	public void setBasepay(String basepay) {
		this.basepay = basepay;
	}
	public String getJixiaopay() {
		return jixiaopay;
	}
	public void setJixiaopay(String jixiaopay) {
		this.jixiaopay = jixiaopay;
	}
	public String getFourx() {
		return fourx;
	}
	public void setFourx(String fourx) {
		this.fourx = fourx;
	}
	public String getZhufang() {
		return zhufang;
	}
	public void setZhufang(String zhufang) {
		this.zhufang = zhufang;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getCommuni() {
		return communi;
	}
	public void setCommuni(String communi) {
		this.communi = communi;
	}
	public String getMealallow() {
		return mealallow;
	}
	public void setMealallow(String mealallow) {
		this.mealallow = mealallow;
	}
	public String getAttendsub() {
		return attendsub;
	}
	public void setAttendsub(String attendsub) {
		this.attendsub = attendsub;
	}
	public String getOtmoney() {
		return otmoney;
	}
	public void setOtmoney(String otmoney) {
		this.otmoney = otmoney;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public String getShouldgive() {
		return shouldgive;
	}
	public void setShouldgive(String shouldgive) {
		this.shouldgive = shouldgive;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getReallygive() {
		return reallygive;
	}
	public void setReallygive(String reallygive) {
		this.reallygive = reallygive;
	}
	 
	 
	
	
	
	
	
	
	
	 
	
	
}
