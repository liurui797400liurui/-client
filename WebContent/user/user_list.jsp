<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
	<base href="<%=basePath%>">
	<title>用户信息查询</title>
	<link href="css/admin.css" type="text/css" rel="stylesheet">
	<link href="css/list.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/tab.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/systemJs/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3; /*color: #e1e2e3;*/
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
</head>
<body>
<form id="myform" name="myform" method="post">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#0099CC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">用户信息列表</span></td>
              </tr>
            </table></td>
            <td><div align="right">
            	<span class="STYLE1">
            	<!-- 
              	<input type="checkbox" name="checkbox11" id="checkbox11" />
              	全选   &nbsp;&nbsp;--> 
              	
              <a href="touser_Add.do" class="common_a"><img src="images/add.gif" width="10" height="10" /> 添加 </a> &nbsp;
              <a class="common_a" onclick="deleteRecord('n','n')"><img src="images/del.gif" width="10" height="10" /> 批量删除</a>   &nbsp;&nbsp;
              <!--<img src="images/edit.gif" width="10" height="10" /> 编辑   &nbsp;-->  </span>
              <span class="STYLE1"> &nbsp;</span>
              </div>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    
    <table width="100%"   border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="14%" height="30">&nbsp;</td>
        <td width="12%" height="30" align="right" class="STYLE19">用户名：</td>
        <td width="12%" class="STYLE19"><input name="username" type="text" id="username" size="15" /></td>
        <td width="9%" align="right" class="STYLE19">电话：</td>
        <td width="13%" class="STYLE19"><input name="phone" type="text" id="phone" size="15" /></td>
        <td width="40%"><input type="button"  class="btn"   value="查询" onclick="query()"/></td>
      </tr>
    </table>
    
    <!-- 列表 onmouseover="changeto()"  onmouseout="changeback()" -->
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" onclick="choose('allChoose','chooseId')" id="allChoose" />
        </div></td>
        <td width="3%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">序号</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户类型(角色)</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">真实姓名</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系电话</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">性别</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">学历</span></div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">地址</span></div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
      
      <s:iterator value="#request.userInfoList" id="info" status="status">
      <tr>
        <td height="20" bgcolor="#FFFFFF">
         <div align="center">
          <input type="checkbox" id="chooseId" name="chooseId"  value="${info.id}" />
         </div>
        </td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${status.index+requestScope.page.startRecord}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19">${info.username}</span></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
        	<s:if test="#request.info.roleid==1">管理员</s:if>
        	<s:if test="#request.info.roleid==2">员工</s:if>
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${info.truename}</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${info.phone}</div></td>
        
        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
        <div align="center">
        <s:if test="#request.info.sex==1">男</s:if>
        <s:if test="#request.info.sex==2">女</s:if>
        </div>
        </td>
        
        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
        <div align="center">
        <s:if test="#request.info.degree==1">初中</s:if>
        <s:if test="#request.info.degree==2">高中</s:if>
        <s:if test="#request.info.degree==3">中专</s:if>
        <s:if test="#request.info.degree==4">本科</s:if>
        <s:if test="#request.info.degree==5">研究生</s:if>
        </div>
        </td>
        
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${info.address}</div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21"> 
        <a onclick="editRecord('${info.id}')" class="common_a"> 编辑 </a>| 
        <a class="common_a" onclick="viewRecord('${info.id}')">查看</a> | 
        <a class="common_a" onclick="deleteRecord('${info.id}','${info.roleid}')">删除 </a>
        </div></td>
      </tr>
      </s:iterator>
      
    </table></td>
  </tr>
  
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left">
        <s:if test="#request.page.totalRecords!=0"> 
        <span class="STYLE22">
        &nbsp;&nbsp;&nbsp;&nbsp;共有<strong>${requestScope.page.totalRecords}</strong> 条记录，当前第<strong> ${requestScope.page.currentPage} </strong> 页，共 <strong>${requestScope.page.totalPages}</strong> 页</span>
      	</s:if>
      	<s:else>
       		您查找的记录为0条
       	</s:else>
        </div>
        </td>
        <td class="STYLE4" width="33%">
		  <div id="msgDiv"></div>
		</td>
        <td width="67%">
        <table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <s:if test="#request.page.totalRecords!=0">
          <tr>
            <td width="49"><div align="center"><img src="images/main_54.gif" width="40" height="15" onClick="page(1)"/></div></td><!-- 首页 -->
            <td width="49"><div align="center"><img src="images/main_56.gif" width="45" height="15" onClick="page(${page.currentPage-1})"/></div></td><!-- 上一页 -->
            <td width="49"><div align="center"><img src="images/main_58.gif" width="45" height="15" onClick="page(${page.currentPage+1})" /></div></td><!-- 下一页 -->
            <td width="49"><div align="center"><img src="images/main_60.gif" width="40" height="15" onClick="page(${page.totalPages})"/></div></td><!-- 尾页 -->
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" size="4" name="textfield" id="pageTo" value="${page.currentPage}" onMouseOver="this.select()" 
              onKeyPress="if(event.keyCode==13){return page('pageTo');}" style="width:20px; height:12px; font-size:10px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="35"><img src="images/main_62.gif" width="26" height="15" onClick="page('pageTo')"/></td><!-- 转 -->
          </tr>
          </s:if>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 
</form>
</body>
</html>
<script type="text/javascript" >
/*
*查询
*/
function query(){
	var queryForm=document.getElementById("myform");
	if(!validationFormText(queryForm)){ 
	   return false; 
    }
    queryForm.action="${pageContext.request.contextPath}/queryUserInfos.do";
	queryForm.submit();
}
			
/*
*输出提示信息
*/
function displayInfo(msg){
	 $(document).ready(function(){
           $("#msgDiv").fadeIn("fast");   
		$("#msgDiv").fadeOut(10*1000);  
	});	
	var msgDiv=document.getElementById("msgDiv");
	msgDiv.innerHTML="";
	msg="<font color='#ff0000' size='2px'><b>"+msg+"</b></font>";
	msgDiv.innerHTML=msg;
	return ;
}
				
/**
  *分页跳转
*/
var paramUrl="&&username=${requestScope.userInfo.username}";
	paramUrl+="&&phone=${requestScope.userInfo.phone}";
	//paramUrl+="&&applyPersonAccount=${requestScope.carDeleteInfo.applyPersonAccount}";
var total=${requestScope.page.totalPages}+"";
if(total==""){
	total=1;
}
var current=${requestScope.page.currentPage}+"";
if(current==""){
	current=1;
}
function page(page){
	var pageUrl="${pageContext.request.contextPath}/queryUserInfos.do";
		pageUrl+="?"+paramUrl;
	if(page=='pageTo'){
		var pageTo=document.getElementById("pageTo").value;	
		if(pageTo<=total && pageTo>0){
				pageUrl+="&currentPage="+pageTo;
		 }else{
				displayInfo("没有此页！");
				return false;
		}	
	}else{
		if(page<1){
			displayInfo("当前已经是第一页！");
			return false;
		}else if(page>total){
			displayInfo("当前已经是最后一页！");
			return false;
		}else{
			pageUrl+="&&currentPage="+page;
		}
	}
	window.location.href=encodeURI(encodeURI(pageUrl));	
}


/**
 *删除
*/			
function deleteRecord(flag,roleid){
	//批量删除
	if(flag=="n"){
		var num=0;
		var allIds="";
		var el = document.getElementsByTagName('input');
		var len = el.length;
		for(var i=0; i<len; i++){
			if((el[i].type=="checkbox") && (el[i].name=="chooseId")){
					if(el[i].checked){
						num++;
						allIds += (allIds=="") ? el[i].value : ","+el[i].value;															
					}							
			}
		}
		if(num==0){
			alert("请选择至少一条记录!");	
		}else{			
			if(window.confirm("数据删除后不可恢复，确定要删除吗?")){						
				var url = '${pageContext.request.contextPath}/Delete_UserInfo.do';
              	var params = { ids : allIds };
             	jQuery.post(url, params, callbackDeleteRecord, 'json');               			             
			}else{
				return ;
			}								
		}
		
	}else{//单个删除
	   if(roleid==1){
	      alert("超级用户不能删除");
	   }else{
			if(window.confirm("数据删除后不可恢复，确定要删除吗?")){			
					var url = '${pageContext.request.contextPath}/Delete_UserInfo.do';
	              	var params = {ids : flag};
	             	jQuery.post(url, params, callbackDeleteRecord, 'json');               			             
			}else{
					return ;
			}	
		}		
	}
}

/**
*删除的回调函数
*/ 
function callbackDeleteRecord(data){
 if(data.success){    
 	page(${requestScope.page.currentPage});
	}else{
		window.location="${pageContext.request.contextPath}/Page_error.do";
 }
}

//用户信息-查看
function viewRecord(id){
	window.location.href = "${pageContext.request.contextPath}/toView_UserInfo.do?id="+id+"";
}

//编辑“用户” 的信息 			
function editRecord(id){
	window.location.href = "${pageContext.request.contextPath}/toEdit_UserInfo.do?id="+id+"";
}
</script>	























