<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<HTML>
<HEAD>
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=images/title_bg1.jpg>当前位置: 默认主页</TD>
  </TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/shadow_bg.jpg></TD></TR></TABLE>
  
</BODY>
</HTML>
<script type="text/javascript" > 
var roleid = '${sessionScope.roleid}'; 
//新增用户
function tiaozhuan1(url){
     if( roleid == 1){
       window.location.href="${pageContext.request.contextPath}/"+url; 
     }else{
       alert("没有权限查看");
     }
}

</script>





