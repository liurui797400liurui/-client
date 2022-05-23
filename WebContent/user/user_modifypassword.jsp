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
<title>修改密码</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">修改密码</span></td>
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
        	<td height="25" colspan="2" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
        </tr>
        <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">用户名：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="username" id="username" size="25" value="${sessionScope.username}" readonly="readonly" style="background-color: #ADADAD"/><font class="mustWrite">*</font>
          	<input type="hidden" id="id" name="id" value="${sessionScope.userid}"/>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">新密码：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="password" name="password" id="password" size="25" /><font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">确认密码：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="password" name="repassword" id="repassword" size="25" /><font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button" id="button" value="修改" onclick="checkSave()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button2" id="button2" value="返回" onclick="history.back()"/>
          </td>
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
String.prototype.Trim = function(){ return this.replace(/(^\s*)|(\s*$)/g, "");}
/*
*判断字符串是否为空
*/
function isEmpty(value){
		if(value.Trim()==""){
			return true;
		}else{
			return false;
		}
}

function checkSave(){
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		
		if(password =="" ){
			alert("新密码不能为空"); 
		}else if(repassword==""){
		 	alert("确认密码不能为空"); 
		}else if(repassword != password){
		 	alert("新密码和确认密码不一致"); 
		}else{
			 editPasswordinfo();
		}						
}

function editPasswordinfo(){
 	 var url = 'editUserPasswordInfo.do'; 
     var params;
     params = {
     		id:$("#id").val(),
     		password : $("#password").val()
     };
     jQuery.post(url, params, callbackEditUserPasswordInfo, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackEditUserPasswordInfo(data){
	if(data.success){
	  alert("用户口令修改成功！");
 	  window.location.href="${pageContext.request.contextPath}/tomodify_password.do";
    }else{
   		alert("用户口令修改失败,请与管理员联系");
    }
}

</script>

</html>

