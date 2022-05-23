package com.eagleeyes.view.actionjdbc;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.eagleeyes.jdbc.bean.UserInfo;
import com.eagleeyes.jdbc.dao.UserInfoDAO;
import com.eagleeyes.util.GlobalConstant;
import com.eagleeyes.util.Page;

/**
 * 用户登录 Action
 * @author Administrator
 */

public class UserInfoAction extends BaseAction implements ServletRequestAware,ServletResponseAware, SessionAware {
	
	private static final long serialVersionUID = -4807858953542890928L;
	
	@SuppressWarnings("unused")
	private HttpServletRequest request; 
	private HttpServletResponse response; 
	private Map<String, Object> session;
	
	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
	}
	public void setServletResponse(HttpServletResponse res) {
		this.response = res;
	}
	@SuppressWarnings("unchecked")
	public void setSession(Map session) {
		this.session = session;
	}
	
	private String  ids;			//批量删除
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
	
	UserInfoDAO userInfoDAO = new UserInfoDAO(); 
	
	
public void userLogin(){
	String json = null;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String roleid = request.getParameter("roleid");
	int  res = 0 ;
	UserInfo uInfo = new UserInfo();
	uInfo.setUsername(username);
	uInfo.setPassword(password);
	uInfo.setRoleid(Integer.parseInt(roleid)); 
	UserInfo  resUser = userInfoDAO.getUserInfo(uInfo);
	if (resUser == null) {
		res = 2; 
	}else if (resUser.getUsername()!=null && resUser.getPassword() != null) {
		session.put("username", resUser.getUsername());
		session.put("username2", resUser.getTruename());
		session.put("usernametrue", resUser.getTruename());
		session.put("userid", resUser.getId());
		session.put("roleid", roleid);
		//session.put("jifen", resUser.getJifen());
		session.put("phone", resUser.getPhone());
		res = 1; 
	}
	
	if (res==1) {
		json="{success:true,flag:1}";//用户名和密码正确
	}else if (res==2) {
		json="{success:false,flag:2}";//用户名或者密码不正确
	}else if (res==3){
		json="{success:false,flag:3}";//密码不正确
	}
	try {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
}

//检查用户是否存在
public void check_userIsExist(){
	String json = null;
	String username = request.getParameter("username");
	int res = 0 ;
	UserInfo uInfo = new UserInfo();
	uInfo.setUsername(username);
	UserInfo  resUser = userInfoDAO.getUserInfoByName(uInfo);
	if (resUser != null) {
		res = 1; 
	}else{
		res = 2; //没有该用户
	}
	
	if (res==1) {
		json="{success:true,flag:1}";//用户名有 存在
	}else if (res==2) {
		json="{success:false,flag:2}";//用户名不存在
	}
	try {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
}

//用户首页找回密码 

public String user_front_resetpass()  {
	try {
		String username = request.getParameter("username");
		UserInfo uInfo = new UserInfo();
		uInfo.setUsername(username);
		UserInfo  info = userInfoDAO.getUserInfoByName(uInfo);
		request.setAttribute("username", info.getUsername());
		request.setAttribute("info", info);
		
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}

//用户首页 重新设置新密码 
public void user_frontloginRestPass(){
	String json = null;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	int res = 0 ;
	UserInfo uInfo = new UserInfo();
	uInfo.setUsername(username);
	uInfo.setPassword(password);
	res = userInfoDAO.updateUserPasswordInfoByUsername(uInfo);
	if (res==1) {
		json="{success:true,flag:1}";//重置成功 
	}else{
		json="{success:false,flag:2}";//重置失败
	}
	try {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
}


public void user_frontlogin(){
	String json = null;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	int  res = 0 ;
	UserInfo uInfo = new UserInfo();
	uInfo.setUsername(username);
	uInfo.setPassword(password);
	UserInfo  resUser = userInfoDAO.getUserInfo_front(uInfo);
	if (resUser == null) {
		res = 2; 
	}else if (resUser.getUsername()!=null && resUser.getPassword() != null) {
		session.put("username", resUser.getUsername());
		session.put("username2", resUser.getTruename());
		session.put("usernametrue", resUser.getTruename());
		session.put("userid", resUser.getId());
		session.put("roleid", resUser.getRoleid()); 
		//session.put("jifen", resUser.getJifen()); 
		res = 1; 
	}
	
	if (res==1) {
		json="{success:true,flag:1}";//用户名和密码正确
	}else if (res==2) {
		json="{success:false,flag:2}";//用户名或者密码不正确
	}else if (res==3){
		json="{success:false,flag:3}";//密码不正确
	}
	try {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println(json.toString());
	} catch (IOException e) {
		e.printStackTrace();
	}
}	

public String userExit()  {
try {
	if(session instanceof SessionMap){
		System.out.println("用户:["+session.get("username")+"]已经安全退出");
		((SessionMap)session).invalidate();
	}
	return SUCCESS;
} catch (Exception e) {
	e.printStackTrace();
	request.setAttribute("error", "系统错误，请求失败!");
	return ERROR;
}
}	
	
public String toUserAdd()  {
	try {
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}
//增加会员信息
//public String toMember_Add()  {
//	try {
//		return SUCCESS;
//	} catch (Exception e) {
//		e.printStackTrace();
//		request.setAttribute("error", "系统错误，请求失败!");
//		return ERROR;
//	}
//}

public String to_register()  {
	try {
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}


public String queryShouye_intro()  {
	try {
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}

public String to_shouye()  {
	try {
//		ContentInfo info = new ContentInfoDAO().getContentInfoById(new ContentInfo());
//		request.setAttribute("gonggaoInfo",  info);
		//session.put("gonggaoInfoSession", info);
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}


public String tomodifyPassword()  {
	try {
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}
 


/**
* 修改用户密码
*/
public void modifyPassword() {
	String json = null;
	try {
		UserInfo  info = new UserInfo();
		info.setId(id);
		info.setPassword(password);
		int res = userInfoDAO.updateUserPasswordInfoById(info);
		if (res==1) {
			json="{success:true,flag:1}";//成功
		}else {
			json="{success:false,flag:2}";
		}
	} catch (Exception e) {
		e.printStackTrace();
		json="{success:false,flag:2}";
	}
	try {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println(json.toString());
	} catch (IOException e1) {
		e1.printStackTrace();
	}
}


/**
* 真正的添加用户信息<br/>
*/
public void addUserInfo() throws IOException {
	String json = new String();
	try {
		UserInfo  info = new UserInfo();
	 	info.setUsername(username);
	 	info.setPassword(password);
	 	info.setRoleid(roleid);
	 	info.setTruename(truename);
	 	info.setPhone(phone);
	 	info.setAddress(address);
	 	info.setAge(age);
	 	info.setSex(sex );
	 	info.setDep(dep);
	 	info.setDegree(degree);
	 	info.setJob(job);
	 	info.setPic(pic);
	 	info.setIdno(idno);
	 	info.setMianmao(mianmao);
	 	info.setEmail(email);
	 	
	 	info.setCreateperson((String) session.get("username"));
	 	info.setCreatetime(new Date());
	 	
	 	UserInfo  dbInfo = userInfoDAO.getUserInfoByName(info);
	 	if (dbInfo != null) {
	 		json="{success:true,flag:7}";
		}else {
			int tag = userInfoDAO.addUserInfo(info);
		 	json="{success:true,flag:"+tag+"}";
		}
	}catch (Exception e) {
		e.printStackTrace();
		json="{success:false,flag:0}";
	}
	response.setContentType("text/json;charset=UTF-8");
	response.getWriter().println(json.toString());
}

/**
 * 删除操作信息
 */
@SuppressWarnings("unused")
public String deleteUserInfo() throws IOException {
	String ids = request.getParameter("ids");
	if("".equals(ids)|| ids == null){return null;}
	int sum =  userInfoDAO.deleteUserInfo(ids);
	if (sum == 0) {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println("{success:false}");
	}else if (sum > 0) {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println("{success:true}");
	}
	return null;
}
/**
 * 查询所有用户信息
 */
public String queryUserInfos()  {
	try {
		UserInfo  userInfo = new UserInfo();
		if (this.username != null) {
			username = URLDecoder.decode(username, "UTF-8");
			userInfo.setUsername(username);
		}
		if (this.phone != null) {
			phone = URLDecoder.decode(phone, "UTF-8");
			userInfo.setPhone(phone);
		}
		//每页显示条数
		int pageRows = GlobalConstant.PAGEROWS;
		//当前页
		int currentPage = 1;
		if (request.getParameter("pageRows") != null && !"".equals(request.getParameter("pageRows"))) {
			pageRows = Integer.parseInt(request.getParameter("pageRows"));
		}
		if (request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//记录总条数
		int totalRecords = userInfoDAO.getUserInfosCount(userInfo);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		//jdbc 分页 
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<UserInfo>  userInfoList = userInfoDAO.getAllUserInfos(userInfo, page.getStartRecord(), endIndex);
		//传递结果集到页面
		request.setAttribute("userInfoList", userInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + userInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("userInfo", userInfo);//查询条件使用的
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}



/**
 * 查询所有会员信息
 */
public String queryUserInfos_member()  {
	try {
		UserInfo  userInfo = new UserInfo();
		if (this.username != null) {
			username = URLDecoder.decode(username, "UTF-8");
			userInfo.setUsername(username);
		}
		if (this.phone != null) {
			phone = URLDecoder.decode(phone, "UTF-8");
			userInfo.setPhone(phone);
		}
		//每页显示条数
		int pageRows = GlobalConstant.PAGEROWS;
		//当前页
		int currentPage = 1;
		if (request.getParameter("pageRows") != null && !"".equals(request.getParameter("pageRows"))) {
			pageRows = Integer.parseInt(request.getParameter("pageRows"));
		}
		if (request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//记录总条数
		int totalRecords = userInfoDAO.getUserInfosCount_member(userInfo);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		//jdbc 分页 
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<UserInfo>  userInfoList = userInfoDAO.getAllUserInfos_member(userInfo, page.getStartRecord(), endIndex);
		//传递结果集到页面
		request.setAttribute("userInfoList", userInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + userInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("userInfo", userInfo);//查询条件使用的
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}

public String queryUserInfos_jifen()  {
	try {
		UserInfo  userInfo = new UserInfo();
		if (this.username != null) {
			username = URLDecoder.decode(username, "UTF-8");
			userInfo.setUsername(username);
		}
		if (this.phone != null) {
			phone = URLDecoder.decode(phone, "UTF-8");
			userInfo.setPhone(phone);
		}
		//每页显示条数
		int pageRows = GlobalConstant.PAGEROWS;
		//当前页
		int currentPage = 1;
		if (request.getParameter("pageRows") != null && !"".equals(request.getParameter("pageRows"))) {
			pageRows = Integer.parseInt(request.getParameter("pageRows"));
		}
		if (request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//记录总条数
		int totalRecords = userInfoDAO.getUserInfosCount_jifen(userInfo);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		//jdbc 分页 
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<UserInfo>  userInfoList = userInfoDAO.getAllUserInfos_jifen(userInfo, page.getStartRecord(), endIndex);
		//传递结果集到页面
		request.setAttribute("userInfoList", userInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + userInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("userInfo", userInfo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}



/**
* 根据用户信息ID 获取单个用户信息
*/
public UserInfo getUserInfoById(){
	UserInfo  userInfo = new UserInfo();
	userInfo.setId(Integer.valueOf(request.getParameter("id"))  );
	UserInfo info = userInfoDAO.getUserInfoById(userInfo);
	return info;
}


public UserInfo getUserInfoById2(){
	UserInfo  userInfo = new UserInfo();
	userInfo.setId( Integer.parseInt(session.get("userid").toString())   );
	UserInfo info = userInfoDAO.getUserInfoById(userInfo);
	return info; 
}


/**
* 跳转到查看用户的基本信息 
* @return 
*/
public String toViewUserInfo() {
	try {
		request.setAttribute("ViewUserinfo", getUserInfoById());
		return SUCCESS;
	} catch (Exception e) { 
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}


public String toViewMemberInfo() {
	try {
		request.setAttribute("ViewMemberinfo", getUserInfoById());
		return SUCCESS;
	} catch (Exception e) { 
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}


/**
* 跳转到编辑用户的基本信息 
*/
public String toEditUserInfo() {
	try {
		request.setAttribute("EditUserinfo", getUserInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}

/**
* 跳转到编辑用户的基本信息 
*/
public String toEditMemberInfo() {
	try {
		request.setAttribute("EditMemberinfo", getUserInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}

/**
*  个人信息修改 
*/
public String tomodify_userInfo() {
	try {
		request.setAttribute("EditUserinfoR", getUserInfoById2());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}



/**
* 修改用户信息
*/
public void editUserInfo() {
	String json = null;
	try {
		UserInfo  info = new UserInfo();
		info.setId(id);
		info.setRoleid(roleid);
		info.setTruename(truename);
		info.setPhone(phone);
		info.setAddress(address);
		
		info.setAge(age);
	 	info.setSex(sex );
	 	info.setDep(dep);
	 	info.setDegree(degree);
	 	info.setJob(job);
	 	info.setPic(pic);
	 	info.setIdno(idno);
	 	info.setMianmao(mianmao);
	 	info.setEmail(email);
		
		int  res = userInfoDAO.updateUserInfoById(info);
		if (res==1) {
			json="{success:true,flag:1}";//成功
		}else {
			json="{success:false,flag:2}";
		}
	} catch (Exception e) {
		e.printStackTrace();
		json="{success:false,flag:2}";
	}
	try {
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().println(json.toString());
	} catch (IOException e1) {
		e1.printStackTrace();
	}
}

 

public String toEdit_UserInfoJifen() {
	try {
		request.setAttribute("EditUserinfoRR", getUserInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}


 

///////////////////////////////////////////////////////////////////////////
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
public String getIds() {
	return ids;
}
public void setIds(String ids) {
	this.ids = ids;
}
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

	
	
}
