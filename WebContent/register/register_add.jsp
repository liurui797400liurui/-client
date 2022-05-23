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
<title>员工信息注册</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">员工信息注册</span></td>
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
          	<div class="style_font" align="right">账号：</div>
          </td>
          <!-- onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" 
          onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')"
          -->
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="username" id="username" size="25"  />
          	<font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">密码：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	<input type="password" name="password" id="password" size="25"/><font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">用户类型：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	<select id="roleid" name="roleid" >
				<option value="-1">---选择用户类型---</option>
				<option value="2">员工</option>
			</select><font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">真实姓名：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="truename" id="truename" size="25"/><font class="mustWrite">*</font>
          </td>
        </tr>
        
         <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">电话：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="phone" id="phone" size="25" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
          </td>
         </tr>
         
         <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">地址：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="address" id="address" size="25"/>
          </td>
         </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button" id="button" value="注册" onclick="checkSave()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button2" id="button2" value="重置" onclick="clears()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button2" id="button2" value="返回" onclick="returnToLogin()"/>
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
var roleid_val ;
function checkSave(){
		var username = $("#username"); 			
		var password = $("#password"); 
		var truename = $("#truename");  
					
		var t = document.getElementById("roleid"); 
		roleid_val = t.options[t.selectedIndex].value;	
			 					 
		if(isEmpty(username.val())){
			username.value="";
			alert("账号不能为空"); 
		}else if(isEmpty(password.val())){
			password.value="";
			alert("密码不能为空"); 
		}else if(roleid_val ==-1 ){
			alert("请选择用户类型"); 
		}else if(isEmpty(truename.val())){
			truename.value="";
			alert("姓名不能为空"); 
		}
		//else if( $("#phone").val().length != 11  ){
		//	alert("电话号码应该为11为数字"); 
		//}
		else{ 
			addUserinfo();
		}						
}

function addUserinfo(){
 	 var url = 'addUserInfo.do'; 
     var params;
     params = {
     		username : $("#username").val(),
     		roleid : roleid_val,	 
     		password : $("#password").val(),
     		truename : $("#truename").val(),
     		address : $("#address").val(),
     		phone : $("#phone").val()
     };
     jQuery.post(url, params, callbackAddUserInfo, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackAddUserInfo(data){
		if(data.flag == 7){
			alert("该账号已经存在,不能注册！");
		}else{ 
	        if(data.success){
				alert("员工信息注册成功！");
			 	window.location.href="${pageContext.request.contextPath}/to_register.do";
	        }else{
	       		alert("员工信息注册失败,请与管理员联系");
	        }
        }
}

function clears(){
	$("#username").val("");
 	$("#password").val("");
 	$("#roleid").val("-1");
 	$("#truename").val("");
 	$("#phone").val("");
 	$("#address").val("");
}

 
function returnToLogin(data){
  window.location.href="${pageContext.request.contextPath}/Page_to_ReturnLogin.do";
}

</script>

</html>

