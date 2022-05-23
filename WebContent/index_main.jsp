<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.eagleeyes.jdbc.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Object obj = session.getAttribute("username");
	if(obj == null){
		out.print("您没有登录");
		response.sendRedirect(path+"/login.jsp");
	}else{
	
	}
 %>
 
<HTML>
<HEAD>
<TITLE>工资管理系统</TITLE> 
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Cache-Control content=no-cache>
<META http-equiv=Expires content=-1000>
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="header.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="170, *">
<FRAME name=menu src="menu.jsp" frameBorder=0 noResize>
<FRAME name=main src="main.jsp" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
</HTML>
