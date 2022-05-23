<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>查看奖惩详情</title>
<link href="css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/tab.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
</style>

</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#0099CC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="56%"><table width="91%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="4%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="96%" valign="bottom"><span class="style_navi">查看奖惩信息</span></td>
              </tr>
            </table></td>
            <td width="44%"><div align="right"><span class="style_navi">&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;     
            &nbsp;</span><span class="style_navi"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
   <td>
   
   
    <table width="100%"  border="0" cellpadding="0" cellspacing="1"  bgcolor="#a8c7ce">
        <tr>
        	<td height="25" colspan="4" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
        </tr>
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">姓名：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">${ViewRewardInfo.name}</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">部门：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	 ${ViewRewardInfo.dep}  
			</div>
          </td>
        </tr>
        
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">奖惩类型：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 <s:if test="#request.ViewRewardInfo.type==1">请假</s:if>
          		 <s:if test="#request.ViewRewardInfo.type==2">加班</s:if> 
          		 
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">请假类型：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	<s:if test="#request.ViewRewardInfo.leavetype==1">病假</s:if>
	          	<s:if test="#request.ViewRewardInfo.leavetype==2">事假</s:if>
	          	<s:if test="#request.ViewRewardInfo.leavetype==3">其他</s:if>
	          	<s:if test="#request.ViewRewardInfo.leavetype==-1">无请假</s:if>
			</div>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">请假天数：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewRewardInfo.leaveday}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">加班天数：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewRewardInfo.otday} 
			</div>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">金额：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewRewardInfo.money}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	&nbsp;
			</div>
          </td>
        </tr>
        
        
      
        
		<tr>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button" id="button" value="返回" onclick="history.go(-1);"/></td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
        </tr>
        
      </table>
      <p>&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
  </tr>
</table>
</body>


<script type="text/javascript" >

</script>

</html>

