package com.eagleeyes.view.actionjdbc;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.eagleeyes.jdbc.bean.RewardInfo;
import com.eagleeyes.jdbc.bean.UserInfo;
import com.eagleeyes.jdbc.dao.RewardInfoDAO;
import com.eagleeyes.jdbc.dao.UserInfoDAO;
import com.eagleeyes.util.GlobalConstant;
import com.eagleeyes.util.Page;


/**
 * 奖惩信息 Action
 * @author Administrator
 */
public class RewardInfoAction extends BaseAction implements ServletRequestAware,ServletResponseAware, SessionAware {
	
	private static final long serialVersionUID = -9060075978824889865L;
	
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
	
	private String  ids;	 //批量删除
	
	private int id;  
	private String name ; //姓名
	private String dep ;  //部门
	
	private String type ;
	private String leavetype ;
	private String leaveday ; 
	private String otday ; 
	private String money ;
	
	
	RewardInfoDAO rewardInfoDAO = new RewardInfoDAO();
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	
public String toRewardAdd()  {
	try {
		request.setAttribute("nameinfoList",  userInfoDAO.getAllUserInfo(new UserInfo()) );
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}


public void getUserRewardInfo() throws IOException { 
	String json = new String();
	
	try {
		RewardInfo  info = new RewardInfo();
		UserInfo uInfo = new UserInfo();
		uInfo.setId(Integer.parseInt(request.getParameter("id")));
		UserInfo userInfo = userInfoDAO.getUserInfoById( uInfo );
		String  dep = "";
		if (userInfo.getDep() != null) {
			dep = userInfo.getDep();
		}
	 	json="{success:true,dep:\""+dep+"\"}";
	}catch (Exception e) {
		e.printStackTrace();
		json="{success:false,flag:0}";
	}
	response.setContentType("text/json;charset=UTF-8");
	response.getWriter().println(json.toString());
}



/**
* 真正的添加奖惩信息<br/>
*/
public void addRewardInfo() throws IOException { 
	String json = new String();
	try {
		RewardInfo  info = new RewardInfo();
		
		info.setName(name );
		info.setDep(dep);
		
		info.setType(type);
		info.setLeavetype(leavetype);
		info.setLeaveday(leaveday);
		info.setOtday(otday);
		info.setMoney(money);
		
	 	info.setCreateperson((String) session.get("username"));
	 	info.setCreatetime(new Date());
	 	//List<RewardInfo>  infoList = rewardInfoDAO.getAllRewardInfo(info);
		int tag = rewardInfoDAO.addRewardInfo(info);
	 	json="{success:true,flag:"+tag+" }";
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
public String deleteRewardInfo() throws IOException {
	String ids = request.getParameter("ids");
	if("".equals(ids)|| ids == null){return null;}
	int sum =  rewardInfoDAO.deleteRewardInfo(ids);
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
 * 查询所有奖惩信息
 */
public String queryRewardInfos()  {
	String username = (String) session.get("username");
	try {
		//request.setAttribute("LeibieInfoListQuery",  rewardInfoDAO.getAllLeibieInfos(new LeibieInfo()) );
		RewardInfo  rewardInfo = new RewardInfo();
		if (this.name != null) {
			name = URLDecoder.decode(name, "UTF-8");
			rewardInfo.setName(name);
		}
		if (this.dep != null) {
			dep = URLDecoder.decode(dep, "UTF-8");
			rewardInfo.setDep(dep);
		}
		/*if (grade != 0 && grade != -1) {
			hospitalInfo.setGrade(grade);
		}*/
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
		int totalRecords = rewardInfoDAO.getRewardInfosCount(rewardInfo,username);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<RewardInfo>  rewardInfoList = rewardInfoDAO.getAllRewardInfos(rewardInfo, page.getStartRecord(), endIndex,username);
		//传递结果集到页面
		request.setAttribute("rewardInfoList", rewardInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + rewardInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("rewardInfo", rewardInfo);//查询条件使用的
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}

/**
* 根据奖惩信息ID 获取单个奖惩信息
*/
public RewardInfo getRewardInfoById(){
	RewardInfo  rewardInfo = new RewardInfo();
	rewardInfo.setId(Integer.valueOf(request.getParameter("id"))  );
	RewardInfo info = rewardInfoDAO.getRewardInfoById(rewardInfo);
	return info;
}

/**
* 跳转到查看奖惩的基本信息 
*/
public String toViewRewardInfo() {
	try {
		request.setAttribute("ViewRewardInfo", getRewardInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}



public String toViewRewardInfo_person() {
	try {
		UserInfo  uInfo = new UserInfo();
		uInfo.setId(Integer.valueOf(request.getParameter("id"))  );
		UserInfo uInfo2 = userInfoDAO.getUserInfoById(uInfo);
		//uInfo2.getTruename();
		RewardInfo rewardInfo = getRewardInfoByName(uInfo2);
		if (rewardInfo == null) {
			return FAILURE;
		}
		request.setAttribute("ViewRewardInfoP", rewardInfo);
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}

public RewardInfo getRewardInfoByName(UserInfo  uInfo){
	RewardInfo  rewardInfo = new RewardInfo();
	rewardInfo.setName(uInfo.getTruename());
	RewardInfo info = rewardInfoDAO.getRewardInfoByName(rewardInfo);
	return info;
}


/**
* 跳转到编辑奖惩的基本信息 
*/
public String toEditRewardInfo() {
	try {
		//request.setAttribute("LeibieInfoListEidt",  rewardInfoDAO.getAllLeibieInfos(new LeibieInfo()) );
		request.setAttribute("nameinfoList",  userInfoDAO.getAllUserInfo(new UserInfo()) );
		request.setAttribute("EditRewardInfo", getRewardInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}


/**
* 修改奖惩信息
*/
public void editRewardInfo() {
	String json = null;
	try {
		
		RewardInfo  info = new RewardInfo();
		info.setId(id);
		
		info.setName(name );
		info.setDep(dep);
		
		info.setType(type);
		info.setLeavetype(leavetype);
		info.setLeaveday(leaveday);
		info.setOtday(otday);
		info.setMoney(money);
		
		int  res = rewardInfoDAO.updateRewardInfoById(info);
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







public String getIds() {
	return ids;
}
public void setIds(String ids) {
	this.ids = ids;
}
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

///////////////////////////////////////////////////////////////////////////


	
}
