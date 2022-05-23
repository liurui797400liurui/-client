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
<title>新增用户</title>
<link href="css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/tab.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/ajaxfileupload.js"></script>
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
                <td width="96%" valign="bottom"><span class="style_navi">增加用户</span></td>
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
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="username" id="username" size="25"/><font class="mustWrite">*</font>
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
				<option value="-1">---选择角色---</option>
				<option value="1">管理员</option>
				<option value="2">员工</option>
			</select><font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">真实姓名：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="truename" id="truename" size="25"/>
          </td>
        </tr>
        
         <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">电话：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="phone" id="phone" size="25"/>
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
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">年龄：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="age" id="age" size="25"/>
          </td>
         </tr>
         
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">性别：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	<select id="sex" name="sex" >
				<option value="-1">---选择性别---</option>
				<option value="1">男</option>
				<option value="2">女</option>
			</select><font class="mustWrite">*</font>
          </td>
        </tr>
         
        <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">部门：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="dep" id="dep" size="25"/>
          </td>
         </tr>
         
         <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">学历：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	<select id="degree" name="degree" >
				<option value="-1">---选择学历---</option>
				<option value="1">初中</option>
				<option value="2">高中</option>
				<option value="3">中专</option>
				<option value="4">本科</option>
				<option value="5">研究生</option>
			</select> 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">政治面貌：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	<select id="mianmao" name="mianmao" >
				<option value="-1">---选择政治面貌---</option>
				<option value="1">中共党员</option>
				<option value="2">中共预备党员</option>
				<option value="3">共青团员</option>
				<option value="4">民盟盟员</option>
			</select> 
          </td>
        </tr>
        
        <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">职位：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="job" id="job" size="25"/>
          </td>
         </tr>
         
         <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">身份证号：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="idno" id="idno" size="25"/>
          </td>
         </tr>
         
         <tr>
          <td height="25" width="41%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">电子邮箱：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<input type="text" name="email" id="email" size="25"/>
          </td>
         </tr>
         
         
         <tr>
			<td height="25" bgcolor="#FFFFFF">
				<div align="right" class="STYLE1">照片：</div>
			</td>
			<td height="25" bgcolor="#FFFFFF" colspan="1" class="style_td">
			<input type="hidden" name="pic_url" id="pic_url" value=""/>
				<div align="left" class="STYLE1">
				    <img src="${pageContext.request.contextPath}/images/loading_icon.gif" id="loading" style="display: none; width: 10px; height: 10px;"> 
			    	<input  type="file" name="image"  id="image" size="40"/>
			      	<label>
			      	<input class="btn" type="button" name="button_upload" id="button_upload" value="上传" onclick="return  ajaxFileUpload()"/>
			    	</label>(照片格式jpg,png 大小 413*626 不大于2M)&nbsp;
			    	<span id="showUploadResult" style="color:blue"></span>
				</div>
				
			</td>
		</tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button" id="button" value="添加" onclick="checkSave()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button2" id="button2" value="重置" onclick="clears()"/>
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


function ajaxFileUpload(){
$("#loading").ajaxStart(function(){  
    $(this).show();  
})  
.ajaxComplete(function(){  
    $(this).hide();  
}); 
$.ajaxFileUpload  
(  
    {  
        url:'${pageContext.request.contextPath}/upload.do',  
        secureuri:false,  
        fileElementId:'image',  
        dataType: 'json',
        success: function (data, status){   
            $("#showUploadResult").html(data.message);
            $("#pic_url").val(data.savePath) ; 
            if(typeof(data.error) != 'undefined'){
                if(data.error != ''){
                    alert(data.error);
                }else{  
                    alert(data.message);  
                }  
            }  
        },  
        error: function (data, status, e){	//服务器响应失败处理函数  
            alert(e);  
        }  
    }  
)  
return false;  
}


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
var sex_val ;
var degree_val ;
var mianmao_val ;


function checkSave(){
		var username = $("#username"); 			
		var password = $("#password"); 
					
		var t = document.getElementById("roleid"); 
		roleid_val = t.options[t.selectedIndex].value;	
		
		var t_sex = document.getElementById("sex"); 
		sex_val = t_sex.options[t_sex.selectedIndex].value;
		
		var t_degree = document.getElementById("degree"); 
		degree_val = t_degree.options[t_degree.selectedIndex].value;
		
		var t_mianmao = document.getElementById("mianmao"); 
		mianmao_val = t_mianmao.options[t_mianmao.selectedIndex].value;
			 					 
		if(isEmpty(username.val())){
			username.value="";
			alert("用户名不能为空"); 
		}else if(isEmpty(password.val())){
			password.value="";
			alert("密码不能为空"); 
		}else if(roleid_val ==-1 ){
			alert("请选择用户类型"); 
		}else if(sex_val ==-1 ){
			alert("请选择性别"); 
		}else{
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
     		phone : $("#phone").val(),
     		sex : sex_val,
     		age : $("#age").val(),
     		dep : $("#dep").val(),
     		degree : degree_val,
     		mianmao : mianmao_val,
     		
     		job : $("#job").val(),
     		pic : $("#pic_url").val(),
     		idno : $("#idno").val(), 
     		email : $("#email").val()
     		
     };
     jQuery.post(url, params, callbackAddUserInfo, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackAddUserInfo(data){
        if(data.success){
			alert("用户信息新增成功！");
		 	window.location.href="${pageContext.request.contextPath}/touser_Add.do";
        }else{
       		alert("用户信息新增失败,请与管理员联系");
        }
}

function clears(){
	$("#username").val("");
 	$("#password").val("");
 	$("#roleid").val("-1");
 	$("#truename").val("");
 	$("#phone").val("");
 	$("#address").val("");
 	
 	$("#age").val("");
 	$("#sex").val("-1");
 	$("#dep").val("");
 	$("#degree").val("-1");
 	$("#job").val("");
 	$("#idno").val("");
 	$("#mianmao").val("-1");
 	$("#email").val("");
 	
}
</script>

</html>

