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
<title>查看用户</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">查看用户</span></td>
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
        	<td height="25" colspan="7" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
        </tr>
        
        
        
        
	        <tr >
			    <td width="15%" background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center"><span class="STYLE1">用户名：</span></div>
			    </td>
			    <td width="15%"   bgcolor="#FFFFFF">
			        <div align="center"> <span class="STYLE1">${ViewUserinfo.username}</span></div>
			    </td>
			    <td  width="15%" background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">性别：</span>
					</div>
			    </td>
			    <td width="15%"   bgcolor="#FFFFFF">
			        <div align="center">
					<span class="STYLE1">
					<s:if test="#request.ViewUserinfo.sex==1">男</s:if>
					<s:if test="#request.ViewUserinfo.sex==2">女</s:if>
					</span>
					</div>
			    </td>
			    <td width="15%"  background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">用户类型(角色)：</span>
					</div>
			    </td>
			    <td  bgcolor="#FFFFFF">
			       <div align="center"> 
			       <span class="STYLE1">
			       	<s:if test="#request.ViewUserinfo.roleid==1">管理员</s:if> 
					<s:if test="#request.ViewUserinfo.roleid==2">员工</s:if> 
			       </span></div>
			    </td>
			    
			    <!--   照片 -->
			    <td width="15%" bgcolor="#FFFFFF" rowspan="5" align="left">
			       <div align="center" style="padding-top: 5px;">
			       <span class="STYLE1">
			        
			        <s:if test="#request.ViewUserinfo.pic=='' || #request.ViewUserinfo.pic==null ">
			        	还没有上传照片
			        </s:if>
			        <s:else>
			         <img src="${pageContext.request.contextPath}/${ViewUserinfo.pic}" width="120" height="150" border="0">
			        </s:else>
			       </span>  
			       </div>
			    </td>
			    
			  </tr>
        
        	<tr>
			     <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">真实姓名：</span>
					</div>
			     </td>
			     <td bgcolor="#FFFFFF">
			        <div align="center">
							<span class="STYLE1">
								 ${ViewUserinfo.truename}
							</span>
					</div> 
			     </td>
			    <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			        <div align="center">
						<span class="STYLE1">电话号码：</span>
					</div>
			    </td>
			    <td  bgcolor="#FFFFFF">
			        <div align="center">
						  <span class="STYLE1">
							 ${ViewUserinfo.phone}
				          </span>  
					</div>
			    </td>
			    <td  background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">地址：</span>
					</div>
			    </td>
			    <td bgcolor="#FFFFFF">
			       <div align="center">
						<span class="STYLE1">${ViewUserinfo.address}  </span>
				   </div>
			    </td> 
		  </tr>
        
          <tr>
			     <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">年龄：</span>
					</div>
			     </td>
			     <td bgcolor="#FFFFFF">
			        <div align="center">
							<span class="STYLE1">
								 ${ViewUserinfo.age}
							</span>
					</div> 
			     </td>
			    <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			        <div align="center">
						<span class="STYLE1">部门：</span>
					</div>
			    </td>
			    <td  bgcolor="#FFFFFF">
			        <div align="center">
						  <span class="STYLE1">
							 ${ViewUserinfo.dep}
				          </span>  
					</div>
			    </td>
			    <td  background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">学历：</span>
					</div>
			    </td>
			    <td bgcolor="#FFFFFF">
			       <div align="center">
						<span class="STYLE1"> 
					<s:if test="#request.ViewUserinfo.degree==1">初中</s:if> 
					<s:if test="#request.ViewUserinfo.degree==2">高中</s:if>
					<s:if test="#request.ViewUserinfo.degree==3">中专</s:if>
					<s:if test="#request.ViewUserinfo.degree==4">本科</s:if>
					<s:if test="#request.ViewUserinfo.degree==5">研究生</s:if>
					</span>
				   </div>
			    </td> 
		  </tr>
        
          <tr>
			     <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">职位：</span>
					</div>
			     </td>
			     <td bgcolor="#FFFFFF">
			        <div align="center">
							<span class="STYLE1">
								 ${ViewUserinfo.job}
							</span>
					</div> 
			     </td>
			    <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			        <div align="center">
						<span class="STYLE1">身份证号：</span>
					</div>
			    </td>
			    <td  bgcolor="#FFFFFF">
			        <div align="center">
						  <span class="STYLE1">
							 ${ViewUserinfo.idno}
				          </span>  
					</div>
			    </td>
			    <td  background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">政治面貌：</span>
					</div>
			    </td>
			    <td bgcolor="#FFFFFF">
			       <div align="center">
						<span class="STYLE1"> 
					<s:if test="#request.ViewUserinfo.mianmao==1">中共党员</s:if> 
					<s:if test="#request.ViewUserinfo.mianmao==2">中共预备党员</s:if>
					<s:if test="#request.ViewUserinfo.mianmao==3">共青团员</s:if>
					<s:if test="#request.ViewUserinfo.mianmao==4">民盟盟员</s:if>
					</span>
				   </div>
			    </td> 
		  </tr>
        
        
          <tr>
			     <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">邮箱：</span>
					</div>
			     </td>
			     <td bgcolor="#FFFFFF">
			        <div align="center">
							<span class="STYLE1">
								 ${ViewUserinfo.email}
							</span>
					</div> 
			     </td>
			    <td background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			        <div align="center">
						<span class="STYLE1">创建人：</span>
					</div>
			    </td>
			    <td  bgcolor="#FFFFFF">
			        <div align="center">
						  <span class="STYLE1">
							 ${ViewUserinfo.createperson}
				          </span>  
					</div>
			    </td>
			    <td  background="${pageContext.request.contextPath}/images/bg.gif" bgcolor="#FFFFFF">
			         <div align="center">
						<span class="STYLE1">创建时间：</span>
					</div>
			    </td>
			    <td bgcolor="#FFFFFF">
			       <div align="center">
						<span class="STYLE1">  ${ViewUserinfo.createtime} </span>
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
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
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

