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
<title>信息发布</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">信息发布</span></td>
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
          <td height="25" width="30%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">编号：</div>
          </td>
          <td height="25" width="70%" bgcolor="#FFFFFF" class="style_td">
              <input type="text" name="id1" id="id1" size="15" value="1" readonly="readonly" style="background-color: gray"/>
              <font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="30%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">发布内容：</div>
          </td>
          <td height="25" width="70%" bgcolor="#FFFFFF" class="style_td">
              <textarea name="content1" id="content1" cols="60" rows="5" maxlength="600">${requestScope.ViewContent.content1 }</textarea>(最多1000个字符)
              <font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button" id="button" value="发布" onclick="checkSave()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button2" id="button2" value="重置" onclick="clears()"/>
          </td>
        </tr>
        
        
        <tr>
          <td height="25" width="30%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">编号：</div>
          </td>
          <td height="25" width="70%" bgcolor="#FFFFFF" class="style_td">
              <input type="text" name="id2" id="id2" size="15" value="2" readonly="readonly" style="background-color: gray"/>
              <font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="30%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">发布内容：</div>
          </td>
          <td height="25" width="70%" bgcolor="#FFFFFF" class="style_td">
              <textarea name="content2" id="content2" cols="60" rows="5" maxlength="600">${requestScope.ViewContent2.content2 }</textarea>(最多1000个字符)
              <font class="mustWrite">*</font>
          </td>
        </tr>
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button222" id="button222" value="发布" onclick="checkSave2()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button222" id="button222" value="重置" onclick="clears2()"/>
          </td>
        </tr>
        
        
        <tr>
          <td height="25" width="30%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">编号：</div>
          </td>
          <td height="25" width="70%" bgcolor="#FFFFFF" class="style_td">
              <input type="text" name="id3" id="id3" size="15" value="3" readonly="readonly" style="background-color: gray"/>
              <font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="30%" align="right" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="right">发布内容：</div>
          </td>
          <td height="25" width="70%" bgcolor="#FFFFFF" class="style_td">
              <textarea name="content3" id="content3" cols="60" rows="5" maxlength="600">${requestScope.ViewContent3.content3 }</textarea>(最多1000个字符)
              <font class="mustWrite">*</font>
          </td>
        </tr>
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button222" id="button222" value="发布" onclick="checkSave3()"/>
          &nbsp;&nbsp;
          <input class="btn" type="reset"  name="button222" id="button222" value="重置" onclick="clears3()"/>
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
		var content1 = $("#content1"); 			
			 					 
		if(isEmpty(content1.val())){
			content1.value="";
			alert("发布内容不能为空"); 
		}else{
			 addContentinfo();
		}						
}
function addContentinfo(){
 	 var url = 'addContentInfo.do'; 
     var params;
     params = {
            id1 : $("#id1").val(),
     		content1 : $("#content1").val()
     };
     jQuery.post(url, params, callbackAddContentInfo, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackAddContentInfo(data){
        if(data.success){
			alert("信息发布成功！");
		 	window.location.href="${pageContext.request.contextPath}/to_fabu_gonggao.do";
        }else{
       		alert("信息发布失败,请与管理员联系");
        }
}
function clears(){
	$("#content").val("");
 	 
}
//////////////////////////////////////////////////////////////////

function checkSave2(){
		var content2 = $("#content2"); 			
		if(isEmpty(content2.val())){
			content2.value="";
			alert("发布内容2不能为空"); 
		}else{
			 addContentinfo2();
		}						
}
function addContentinfo2(){
 	 var url = 'addContentInfo2.do'; 
     var params;
     params = {
            id2 : $("#id2").val(),
     		content2 : $("#content2").val()
     };
     jQuery.post(url, params, callbackAddContentInfo2, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackAddContentInfo2(data){
        if(data.success){
			alert("信息发布成功！");
		 	window.location.href="${pageContext.request.contextPath}/to_fabu_gonggao.do";
        }else{
       		alert("信息发布失败,请与管理员联系");
        }
}



//3//////////////////////////////////////////////////////////////

function checkSave3(){
		var content3 = $("#content3"); 			
		if(isEmpty(content3.val())){
			content3.value="";
			alert("发布内容3不能为空"); 
		}else{
			 addContentinfo3();
		}						
}
function addContentinfo3(){
 	 var url = 'addContentInfo3.do'; 
     var params;
     params = {
            id3 : $("#id3").val(),
     		content3 : $("#content3").val()
     };
     jQuery.post(url, params, callbackAddContentInfo3, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackAddContentInfo3(data){
        if(data.success){
			alert("信息发布成功！");
		 	window.location.href="${pageContext.request.contextPath}/to_fabu_gonggao.do";
        }else{
       		alert("信息发布失败,请与管理员联系");
        }
}








</script>

</html>

