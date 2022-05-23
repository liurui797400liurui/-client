<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" background="images/header_bg.jpg" border=0>
  <TR height=56>
    <td width=260> <!-- header_left-1-001.jpg  header_left1.jpg 原始图片 -->
    	<img height=56 src="images/header_left1.jpg" width=260>
    </td>
    <TD style="font-weight: bold; color: #fff; padding-top: 20px" align=middle>
    当前用户：${sessionScope.usernametrue} <!-- sessionScope.username -->
    &nbsp;&nbsp;
    <a href="Page_touserLogin.do" target="_parent"><font style="color: #fff">首页</font></a> 
    &nbsp;&nbsp;
    <!-- 
    <a href="Page_tozhuye_query2.do" target="_parent">
    <font style="color: #fff">返回主页</font></a> 
     -->
    </TD>
    <TD align=right width=268>&nbsp;</TD>
  </TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR bgColor=#1c5db6 height=4>
    <TD></TD></TR></TABLE></BODY></HTML>

    
    
