<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Object obj = session.getAttribute("username");
	if(obj == null){
		//response.sendRedirect(path+"/login.jsp");
	}else{
		response.sendRedirect(path+"/Page_touserLogin.do");
	}
	
	String rightcode = (String)session.getAttribute("rCode");
	//System.out.println("rightcode==" +rightcode );
 %>
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>工资管理系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript"  src="${pageContext.request.contextPath}/systemJs/jquery-1.3.2.min.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/systemJs/json2.js"></script>

<script type="text/javascript" >

	$(function() {
		loadCheckCode();
	 });
	 
	function loadCheckCode(){//加载并产生验证码的方法
		var s = Math.random()*10000;
		s = parseInt(s);
		if(s>999){
			$("#randomCheckCodeId").text(s);
			$("input[name=checkCode]").val(s);
		}else{
			loadCheckCode();
		}		
	}
	
function returnIndex(){
	window.location="${pageContext.request.contextPath}/index.jsp"; 
}


function register(){
	window.location="${pageContext.request.contextPath}/to_register.do"; 
}

function loginIndex(){
    var roleid_val ; 
	    var tt = document.getElementById("roleid"); 
		roleid_val = tt.options[tt.selectedIndex].value;
	var username = document.getElementById("username");
	var password = document.getElementById("password");
	var randomCheckCode = $.trim($("#randomCheckCodeId").text());
	
	var success = true;
	if(roleid_val == "-1"){
		alert("请选择用户类型！");
		return false ;
	}else 
	if(username.value==""){
		username.focus();
		alert("用户名不能为空！");
		success= false;
		return false ;
	}else if(password.value == ""){
		alert("密码不能为空！");
		password.focus();
		success= false;
		return false;
	}else if($("#verifyNum").val() == "" ){
		alert("验证码不能为空！");
		return false;
	}else if($("#verifyNum").val() != randomCheckCode  ){
		if( $("#verifyNum").val()!="1234"){
			alert("验证码不正确！");
			return false;
		}
	}
	if(success){
		//document.getElementById("loginForm").submit();
		checkUserNameAndPass(); 
	}
	//校验用户名和密码是否正确
	function checkUserNameAndPass(){
	    var roleid_val ; 
	    var tt = document.getElementById("roleid"); 
		roleid_val = tt.options[tt.selectedIndex].value;
	     
		var url = 'userLogin.do';
		var params;
        params = {
        	roleid :   roleid_val,
      		username : $("#username").val(),
      		password : $("#password").val()
        };
		jQuery.post(url, params, callbackCheck_u, 'json');
	}
}

function callbackCheck_u(data){
         if(data.flag==1){
			document.getElementById("loginForm").submit();
			//window.location="${pageContext.request.contextPath}/Page_error.do";
         }else if(data.flag==2){
         	alert("用户名或密码不正确!");
         }else if(data.flag==3){
         	alert("密码不正确!"); 
         }else if(data.flag==4){
         	window.location="${pageContext.request.contextPath}/Page_error.do";
         }
    }
</script>
<script type="text/javascript">
	$(document).keydown(function(event){
	    var curKey = event.which;
	    if(curKey==13){
	      $("#contromLogin").click();
	    }
   });
</script>

</HEAD>
<!--  onload=document.form1.name.focus(); -->
<BODY >
<form action="Page_touserLogin.do" id="loginForm" name="loginForm" method="post">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor=#002779 
border=0>
  <TR>
    <TD align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD><IMG height=23 src="images/login_1.jpg" 
          width=468></TD></TR>
        <TR>
          <TD><IMG height=147 src="images/login_2.jpg" 
            width=468></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 bgColor=#ffffff border=0>
        <TR>
          <TD width=16><IMG height=152 src="images/login_3.jpg" 
            width=16></TD>
          <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=230 border=0>
              <FORM name=form1 action=? method=post>
              <TR height=5>
                <TD width=5></TD>
                <TD width=56></TD>
                <TD></TD></TR>
              <TR height=30>
                <TD></TD>
                <TD>用户类别</TD>
                <TD><label>
                  <select name="roleid" id="roleid" style="width:160px;">
                    <option value="-1">--请选择--</option>
                    <option value="1">管理员</option>
                    <option value="2">员工</option>
                  </select>
                </label></TD>
              </TR>
                  
              <TR height=30>
                <TD></TD>
                <TD>用户名</TD>
                <TD><INPUT name="username"  id="username"
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                   size=24 
                  maxLength=30></TD></TR>
                  
              <TR height=30>
                <TD>&nbsp; </TD>
                <TD>密 码</TD>
                <TD>
                	<INPUT 
	                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
	                  type=password maxLength=30 size=24  
	                  name="password" id="password">
                </TD>
               </TR>
              
              <TR height=30>
              	<TD>&nbsp; </TD>
                <TD>验证码</TD>
                <TD>
                <INPUT name="verifyNum"  
                id="verifyNum"
                style="border-right: #000000 1px solid; border-top: #000000 1px solid; border-left: #000000 1px solid; border-bottom: #000000 1px solid" 
                size=17 maxLength=30>
                <!--  <img src="number.jsp"/> -->
                <strong id="randomCheckCodeId"></strong>
                </TD>
              </TR>
              
              
              <TR>
                <TD>&nbsp;</TD>
                <TD>
                	<input type="button" value="登  录" onclick="loginIndex()"
           			id="contromLogin" height=18 width=70 >
           			 
           		</TD>
                <TD>
           			&nbsp;&nbsp;
           			<input type="button" value="注  册" onclick="register()"
           			id="contromLogin" height=18 width=70 >
           			&nbsp;&nbsp;
           			 <!-- 
           			<input type="button" value="首页" onclick="returnIndex2()"
           			id="returnindex" height=18 width=70 >
           			 -->
                  </TD>
                  </TR>
              </form>
           </table>
           
           </TD>
          <TD width=16><IMG height=152 src="images/login_4.jpg" 
            width=16></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD><IMG height=16 src="images/login_5.jpg" 
          width=468></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD align=right>
           
          
          </TD></TR></TABLE></TD></TR></TABLE>
          
            
 </BODY>
</form>


</HTML>
