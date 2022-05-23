package com.eagleeyes.jdbc.bean;


//用户登录信息对象
public class UserInfo extends DataBaseInfo implements java.io.Serializable {
	private static final long serialVersionUID = -715061235577618257L;
	
	private int 	id;
	private int 	roleid;		 
	private String 	username;		 
	private String 	password;		 
	private String 	truename;		 
	private String 	phone; 
	private String 	address;
	private String 	age;
	private int 	sex;
	private String 	dep;
	private String 	degree;
	private String 	job;
	private String 	pic;
	private String 	idno;
	private String 	mianmao;
	private String 	email;
	
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
		this.idno = idno;
	}
	public String getMianmao() {
		return mianmao;
	}
	public void setMianmao(String mianmao) {
		this.mianmao = mianmao;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

		 
	
	 
	
	
}
