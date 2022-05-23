package com.eagleeyes.view.actionjdbc;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.eagleeyes.jdbc.bean.PayInfo;
import com.eagleeyes.jdbc.bean.RewardInfo;
import com.eagleeyes.jdbc.bean.UserInfo;
import com.eagleeyes.jdbc.dao.PayInfoDAO;
import com.eagleeyes.jdbc.dao.RewardInfoDAO;
import com.eagleeyes.jdbc.dao.UserInfoDAO;
import com.eagleeyes.util.GlobalConstant;
import com.eagleeyes.util.Page;


/**
 * 工资信息 Action
 * @author Administrator
 */
public class PayInfoAction extends BaseAction implements ServletRequestAware,ServletResponseAware, SessionAware {
	
	private static final long serialVersionUID = -9060075978824889864L;
	
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
	
	
	PayInfoDAO payInfoDAO = new PayInfoDAO();
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	RewardInfoDAO rewardInfoDAO = new RewardInfoDAO();
	
public String toPayAdd()  {
	try {
		request.setAttribute("nameinfoList",  userInfoDAO.getAllUserInfo(new UserInfo()) );
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}



public String to_addgonggaoInfo()  {
	try {
		
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，请求失败!");
		return ERROR;
	}
}



public void getUserPayInfo() throws IOException { 
	String json = new String();
	
	try {
		
		PayInfo  info = new PayInfo();
		UserInfo uInfo = new UserInfo();
		uInfo.setId(Integer.parseInt(request.getParameter("id")));
		UserInfo userInfo = userInfoDAO.getUserInfoById( uInfo );
		
		PayInfo needPayInfo = new PayInfo ();
		needPayInfo.setName(userInfo.getTruename());
		PayInfo dbpayinfo = payInfoDAO.getPayInfoByName(needPayInfo);
		
		String  dep = "";
		float  basepay = 0;
		
		if (userInfo.getDep() != null) {
			dep = userInfo.getDep();
		}
		if (dbpayinfo != null) {
			basepay = (new BigDecimal(dbpayinfo.getBasepay()) ).floatValue() ;
		}
		
		//考勤扣除额
		float  attendsub = 0;
		float  otmoney = 0;
		
		RewardInfo  needrewardinfo = new RewardInfo();
		needrewardinfo.setName(userInfo.getTruename());
		
		List<RewardInfo> dbRewardInfoList = rewardInfoDAO.getRewardInfoListByName(needrewardinfo);
		for (int i = 0; i < dbRewardInfoList.size(); i++) {
			RewardInfo  info2 = dbRewardInfoList.get(i) ;
			//请假
			if (Integer.parseInt( info2.getType() ) == 1 ) {
				attendsub = attendsub + (new BigDecimal(info2.getMoney()) ).floatValue() ;
			}
			
			//加班
			if (Integer.parseInt( info2.getType() ) == 2 ) {
				otmoney = otmoney + (new BigDecimal(info2.getMoney()) ).floatValue() ;
			}
		}
		
	 	json="{success:true,dep:\""+dep+"\",basepay:\""+basepay+"\" ,attendsub:\""+attendsub+"\" ,otmoney:\""+otmoney+"\"  }";
	 	
	}catch (Exception e) {
		e.printStackTrace();
		json="{success:false,flag:0}";
	}
	response.setContentType("text/json;charset=UTF-8");
	response.getWriter().println(json.toString());
}



/**
* 真正的添加工资信息<br/>
*/
public void addPayInfo() throws IOException { 
	String json = new String();
	try {
		PayInfo  info = new PayInfo();
		
		info.setName(name );
		info.setDep(dep);
		info.setBasepay(basepay);
		info.setJixiaopay(jixiaopay);
		info.setFourx(fourx);
		info.setZhufang(zhufang);
		info.setTraffic(traffic);
		info.setCommuni(communi);
		info.setMealallow(mealallow);
		info.setAttendsub(attendsub);
		info.setOtmoney(otmoney);
		info.setAward(award);
		info.setShouldgive(shouldgive);
		info.setTax(tax);
		info.setReallygive(reallygive);
		
		
	 	info.setCreateperson((String) session.get("username"));
	 	info.setCreatetime(new Date());
	 	//List<PayInfo>  infoList = payInfoDAO.getAllPayInfo(info);
		int tag = payInfoDAO.addPayInfo(info);
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
public String deletePayInfo() throws IOException {
	String ids = request.getParameter("ids");
	if("".equals(ids)|| ids == null){return null;}
	int sum =  payInfoDAO.deletePayInfo(ids);
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
 * 查询所有工资信息
 */
public String queryPayInfos()  {
	String username = (String) session.get("username");
	try {
		//request.setAttribute("LeibieInfoListQuery",  payInfoDAO.getAllLeibieInfos(new LeibieInfo()) );
		PayInfo  payInfo = new PayInfo();
		if (this.name != null) {
			name = URLDecoder.decode(name, "UTF-8");
			payInfo.setName(name);
		}
		if (this.dep != null) {
			dep = URLDecoder.decode(dep, "UTF-8");
			payInfo.setDep(dep);
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
		int totalRecords = payInfoDAO.getPayInfosCount(payInfo,username);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<PayInfo>  payInfoList = payInfoDAO.getAllPayInfos(payInfo, page.getStartRecord(), endIndex,username);
		//传递结果集到页面
		request.setAttribute("payInfoList", payInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + payInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("payInfo", payInfo);//查询条件使用的
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}





/**
 * 统计工资信息
 */
public String queryPayInfosCount()  {
	String username = (String) session.get("username");
	try {
		//request.setAttribute("LeibieInfoListQuery",  payInfoDAO.getAllLeibieInfos(new LeibieInfo()) );
		PayInfo  payInfo = new PayInfo();
		if (this.name != null) {
			name = URLDecoder.decode(name, "UTF-8");
			payInfo.setName(name);
		}
		if (this.dep != null) {
			dep = URLDecoder.decode(dep, "UTF-8");
			payInfo.setDep(dep);
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
		int totalRecords = payInfoDAO.getPayInfosCount(payInfo,username);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<PayInfo>  payInfoList = payInfoDAO.getAllPayInfos(payInfo, page.getStartRecord(), endIndex,username);
		//传递结果集到页面
		request.setAttribute("payInfoList", payInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + payInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("payInfo", payInfo);//查询条件使用的
		
		float paysum = 0;
		for (int i = 0; i < payInfoList.size(); i++) {
			String  reallygive = payInfoList.get(i).getReallygive();
			if (StringUtils.isNotBlank(reallygive)) {
				paysum = paysum + ((new BigDecimal(reallygive))).floatValue();
			}
		}
		request.setAttribute("paysum", BigDecimal.valueOf(paysum).setScale(2, BigDecimal.ROUND_HALF_UP));
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}



/**
 * 打印报表_list 
 */
public String queryPayInfosPrint()  {
	String username = (String) session.get("username");
	try {
		//request.setAttribute("LeibieInfoListQuery",  payInfoDAO.getAllLeibieInfos(new LeibieInfo()) );
		PayInfo  payInfo = new PayInfo();
		if (this.name != null) {
			name = URLDecoder.decode(name, "UTF-8");
			payInfo.setName(name);
		}
		if (this.dep != null) {
			dep = URLDecoder.decode(dep, "UTF-8");
			payInfo.setDep(dep);
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
		int totalRecords = payInfoDAO.getPayInfosCount(payInfo,username);
		Page page = new Page();
		page.setTotalRecords(totalRecords);
		page.setPageRows(pageRows);
		page.setCurrentPage(currentPage);
		int endIndex = pageRows;
		endIndex = page.getStartRecord() + pageRows; 
		if (endIndex > totalRecords) {
            endIndex = totalRecords;  
        }
		List<PayInfo>  payInfoList = payInfoDAO.getAllPayInfos(payInfo, page.getStartRecord(), endIndex,username);
		//传递结果集到页面
		request.setAttribute("payInfoList", payInfoList);
		if (page.getTotalRecords() != 0) {
			page.setStartRecord(page.getStartRecord() + 1);
		}
		page.setEndRecord(page.getStartRecord() + payInfoList.size()-1);
		request.setAttribute("page", page);
		request.setAttribute("payInfo", payInfo);//查询条件使用的
		
		float paysum = 0;
		for (int i = 0; i < payInfoList.size(); i++) {
			String  reallygive = payInfoList.get(i).getReallygive();
			if (StringUtils.isNotBlank(reallygive)) {
				paysum = paysum + ((new BigDecimal(reallygive))).floatValue();
			}
		}
		request.setAttribute("paysum", BigDecimal.valueOf(paysum).setScale(2, BigDecimal.ROUND_HALF_UP));
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}












/**
* 根据工资信息ID 获取单个工资信息
*/
public PayInfo getPayInfoById(){
	PayInfo  payInfo = new PayInfo();
	payInfo.setId(Integer.valueOf(request.getParameter("id"))  );
	PayInfo info = payInfoDAO.getPayInfoById(payInfo);
	return info;
}

/**
* 跳转到查看工资的基本信息 
*/
public String toViewPayInfo() {
	try {
		request.setAttribute("ViewPayInfo", getPayInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}

/**
* 跳转到查看工资的基本信息---统计工资模块使用
*/
public String toViewPayInfoCount() {
	try {
		request.setAttribute("ViewPayInfo", getPayInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}


public String toViewPayInfo_person() {
	try {
		UserInfo  uInfo = new UserInfo();
		uInfo.setId(Integer.valueOf(request.getParameter("id"))  );
		UserInfo uInfo2 = userInfoDAO.getUserInfoById(uInfo);
		//uInfo2.getTruename();
		PayInfo payInfo = getPayInfoByName(uInfo2);
		if (payInfo == null) {
			return FAILURE;
		}
		request.setAttribute("ViewPayInfoP", payInfo);
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}

public PayInfo getPayInfoByName(UserInfo  uInfo){
	PayInfo  payInfo = new PayInfo();
	payInfo.setName(uInfo.getTruename());
	PayInfo info = payInfoDAO.getPayInfoByName(payInfo);
	return info;
}


/**
* 跳转到编辑工资的基本信息 
*/
public String toEditPayInfo() {
	try {
		//request.setAttribute("LeibieInfoListEidt",  payInfoDAO.getAllLeibieInfos(new LeibieInfo()) );
		request.setAttribute("nameinfoList",  userInfoDAO.getAllUserInfo(new UserInfo()) );
		request.setAttribute("EditPayInfo", getPayInfoById());
		return SUCCESS;
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "系统错误，用户登录失败!");
		return ERROR;
	}
}


/**
* 修改工资信息
*/
public void editPayInfo() {
	String json = null;
	try {
		
		PayInfo  info = new PayInfo();
		info.setId(id);
		
		info.setName(name );
		info.setDep(dep);
		info.setBasepay(basepay);
		info.setJixiaopay(jixiaopay);
		info.setFourx(fourx);
		info.setZhufang(zhufang);
		info.setTraffic(traffic);
		info.setCommuni(communi);
		info.setMealallow(mealallow);
		info.setAttendsub(attendsub);
		info.setOtmoney(otmoney);
		info.setAward(award);
		info.setShouldgive(shouldgive);
		info.setTax(tax);
		info.setReallygive(reallygive);
		
		int  res = payInfoDAO.updatePayInfoById(info);
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

///////////////////////////////////////////////////////////////////////////

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
