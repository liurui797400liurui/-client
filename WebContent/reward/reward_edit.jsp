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
<title>修改奖惩信息</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">修改奖惩信息</span></td>
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
          	<div class="style_font" align="right">姓名：</div>
          </td>
          <td height="25" width="59%" bgcolor="#FFFFFF" class="style_td">
          	<select id="name" name="name" class="selectStyle" onchange="getUserIno()">
				<option value="-1">--请选择姓名--</option>
				<s:iterator value="#request.nameinfoList" id="nameinfo">
				<option value="${id}" <s:if test="#request.EditRewardInfo.name==truename">selected="selected"</s:if>>${truename}</option>
				</s:iterator>
			</select><font class="mustWrite">*</font>
          	<input type="hidden" id="id" name="id" value="${request.EditRewardInfo.id}"/>
          	<!--  -->
          	基本工资：
          	<input type="text" id="basepay" name="basepay" value="0" readonly="readonly" style="background: #CCCCCC" />
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">部门：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="dep" name="dep" value="${request.EditRewardInfo.dep}" size="30" maxlength="18" 
          	 readonly="readonly" style="background: #CCCCCC"/> 
          	 <font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">奖惩类型：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          
          	<select id="type" name="type" onchange="dealtype()">
				<option value="-1">---选择奖惩类型---</option>
				<option value="1" <s:if test="#request.EditRewardInfo.type==1">selected="selected"</s:if>>请假</option>
				<option value="2" <s:if test="#request.EditRewardInfo.type==2">selected="selected"</s:if>>加班</option>
			</select>
			<font class="mustWrite">*</font>
          </td>
        </tr>
        
       
     <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">请假类型：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          
          	<select id="leavetype" name="leavetype" onchange="jisuan()">
				<option value="-1">---选择请假类型---</option>
				<option value="1" <s:if test="#request.EditRewardInfo.leavetype==1">selected="selected"</s:if>>病假</option>
				<option value="2" <s:if test="#request.EditRewardInfo.leavetype==2">selected="selected"</s:if>>事假</option>
				<option value="3" <s:if test="#request.EditRewardInfo.leavetype==3">selected="selected"</s:if>>其他</option>
			</select>
			
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">请假天数：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="leaveday" name="leaveday" value="${request.EditRewardInfo.leaveday}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="jisuan()"/> 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">加班天数：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="otday" name="otday" value="${request.EditRewardInfo.otday}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')"  onblur="jisuan()"/> 
          </td>
        </tr>
        
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">金额：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="money" name="money" value="${request.EditRewardInfo.money}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')"  /> 
          </td>
        </tr>
        
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          &nbsp;&nbsp;
          <input class="btn" type="button" name="button" id="button" value="修改" onclick="checkSave()"/>
          &nbsp;&nbsp;
          <input class="btn" type="button"  name="button2" id="button2" value="重置" onclick="clears()"/>
          &nbsp;&nbsp;
          <input class="btn" type="button"  name="button3" id="button3" value="返回" onclick="history.go(-1)"/>
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

function jisuan(){
	var type = $("#type").val();
	var leavetype = $("#leavetype").val();
	
	if(type == 1){
		//病假
		if(leavetype == 1){
			var res = parseFloat($("#basepay").val()) * 0.4 * parseFloat($("#leaveday").val()) ;
			$("#money").val(res.toFixed(2));
		}
		//事假
		if(leavetype == 2){
			var res = parseFloat($("#basepay").val())/22 * parseFloat($("#leaveday").val()) ;
			$("#money").val(res.toFixed(2));
		}
		//事假
		if(leavetype == 3){
			$("#money").val(0);
		}
	}
	//加班
	if(type == 2){
		var res = parseFloat($("#basepay").val())/22 * 3 * parseFloat($("#otday").val()) ;
		$("#money").val(res.toFixed(2));
	}

}


function dealtype(){
	var type = $("#type").val();
	if(type == 1){
		$("#otday").attr('disabled', 'true');
		
		$("#leavetype").removeAttr('disabled');
		$("#leaveday").removeAttr('disabled');
	}
	if(type == 2){
		$("#leavetype").attr('disabled', 'true');
		$("#leaveday").attr('disabled', 'true');
		
		$("#otday").removeAttr('disabled');
	}
	
	if(type == -1){
		 
		$("#leavetype").removeAttr('disabled');
		$("#leaveday").removeAttr('disabled');
		$("#otday").removeAttr('disabled');
	}
	
}

$(document).ready(function() {
getUserIno();
}); 

function getUserIno(){
	var userid = $("#name").val();
	
	var url = 'getUserPayInfo.do'; 
     var params;
     params = {
     		id : userid 
     };
     jQuery.post(url, params, callbackgetUserRewardInfo, 'json');
}

function callbackgetUserRewardInfo(data){
        if(data.success){
        	if(data.dep == null){ 
        		$("#dep").val(""); 
        	}else{
        		$("#dep").val( data.dep ); 
        		$("#basepay").val( data.basepay );  
        	}
			  
        }else{
       		 $("#dep").val(""); 
        }
}


//计算四险，住房公积金
function calsixian(){
	var sixian = parseFloat($("#basepay").val()) * 0.2 ;
	$("#fourx").val(sixian.toFixed(2));
	
	var zhufang = parseFloat($("#basepay").val()) * 0.08 ;
	$("#zhufang").val(zhufang.toFixed(2));
	
	//应发奖惩
	var yingfa = parseFloat($("#basepay").val()) + parseFloat($("#jixiaopay").val()) + parseFloat($("#traffic").val()) + parseFloat($("#communi").val()) 
				+ parseFloat($("#mealallow").val()) + parseFloat($("#otmoney").val())+ parseFloat($("#award").val()) 
				- parseFloat($("#fourx").val()) - parseFloat($("#zhufang").val()) - parseFloat($("#attendsub").val())
				 
	$("#shouldgive").val( yingfa.toFixed(2)  );
	
	//计算个人所得税
	var tax = 0;
	if( parseFloat(yingfa) < 1500   ){
		tax =  parseFloat(yingfa) * 0.03 ;
	}
	if( 1500 <= parseFloat(yingfa) && parseFloat(yingfa) < 4500   ){
		tax =  parseFloat(yingfa) * 0.1 - 105  ;
	}
	
	if( 4500 <= parseFloat(yingfa) && parseFloat(yingfa) < 9000   ){
		tax =  parseFloat(yingfa) * 0.2 - 555  ;
	}
	
	if( 9000 <= parseFloat(yingfa) && parseFloat(yingfa) < 35000   ){
		tax =  parseFloat(yingfa) * 0.25 - 1005  ;
	}
	
	if( 35000 <= parseFloat(yingfa) && parseFloat(yingfa) < 55000   ){
		tax =  parseFloat(yingfa) * 0.3 - 2755  ;
	}
	
	if( 55000 <= parseFloat(yingfa) && parseFloat(yingfa) < 80000   ){
		tax =  parseFloat(yingfa) * 0.35 - 5505  ;
	}
	
	if( 80000 <= parseFloat(yingfa)    ){
		tax =  parseFloat(yingfa) * 0.45 - 13505  ;
	}
	
	$("#tax").val( tax.toFixed(2)  ); 
	
	//实发奖惩
	$("#reallygive").val(  ( parseFloat($("#shouldgive").val() )-parseFloat($("#tax").val() ) ).toFixed(2)  ); 
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
var grade_val ;
var type_val ;

function checkSave(){
		var name = $("#name"); 		
			
		//var t = document.getElementById("grade"); 
		//grade_val = t.options[t.selectedIndex].value;
		
		//var tt = document.getElementById("type"); 
		//type_val = tt.options[tt.selectedIndex].value;	
			 					 
		if( $("#name").val() == "-1"   ){
			name.value="";
			alert("姓名不能为空"); 
		}else if( isEmpty($("#dep").val()) ){
			dep.value="";
			alert("部门不能为空");
		} else if( $("#type").val() == "-1"  ){
			type.value="";
			alert("奖惩类型不能为空");
		}
		else{
			 editRewardinfo();
		}						
}

function editRewardinfo(){
 	 var url = 'editRewardInfo.do'; 
     var params;
     params = {
       		id : $("#id").val(),
       		
     		name : $("#name  option:selected").text(),
     		dep: $("#dep").val(),
     		
     		type : $("#type").val(),
     		leavetype : $("#leavetype").val(), 
     		leaveday : $("#leaveday").val(), 
     		otday : $("#otday").val(), 
     		money : $("#money").val() 
     };
     jQuery.post(url, params, callbackEditRewardInfo, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackEditRewardInfo(data){
        if(data.success){
			alert("奖惩信息修改成功！");
		 	window.location.href="${pageContext.request.contextPath}/queryRewardInfos.do";
        }else{
       		alert("奖惩信息修改失败,请与管理员联系");
        }
}

function clears(){

	 $("#type").val('-1');
	$("#leavetype").val(-1); 
	
	$("#leaveday").val(0);
	$("#otday").val(0);
	$("#money").val(0);
	
}
</script>

</html>

