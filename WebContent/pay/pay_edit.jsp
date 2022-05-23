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
<title>修改工资信息</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">修改工资信息</span></td>
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
				<option value="${id}" <s:if test="#request.EditPayInfo.name==truename">selected="selected"</s:if>>${truename}</option>
				</s:iterator>
			</select><font class="mustWrite">*</font>
          	<input type="hidden" id="id" name="id" value="${request.EditPayInfo.id}"/>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">部门：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="dep" name="dep" value="${request.EditPayInfo.dep}" size="30" maxlength="18" 
          	 readonly="readonly" style="background: #CCCCCC"/> 
          	 <font class="mustWrite">*</font>
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">基本工资：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="basepay" name="basepay" value="${request.EditPayInfo.basepay}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()"/> 
          </td>
        </tr>
        
       
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">绩效工资：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="jixiaopay" name="jixiaopay" value="${request.EditPayInfo.jixiaopay}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()"/> 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">交通费：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="traffic" name="traffic" value="${request.EditPayInfo.traffic}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()" /> 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">通讯费：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="communi" name="communi" value="${request.EditPayInfo.communi}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()" /> 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">就餐补助：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="mealallow" name="mealallow" value="${request.EditPayInfo.mealallow}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()" /> 
          </td>
        </tr>
        
         <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">加班金额：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="otmoney" name="otmoney" value="${request.EditPayInfo.otmoney}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()" /> 
          </td>
        </tr>
        
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">奖金：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="award" name="award" value="${request.EditPayInfo.award}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" onblur="calsixian()" /> 
          </td>
        </tr>
        
         <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">四险：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="fourx" name="fourx" value="${request.EditPayInfo.fourx}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" style="background: #CCCCCC" />
          	 四险 = 基本工资 * 20% 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">住房公积金：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="zhufang" name="zhufang" value="${request.EditPayInfo.zhufang}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" style="background: #CCCCCC"  /> 
          	 住房公积金 = 基本工资 * 8% 
          </td>
        </tr>
        
         <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">考勤扣除额：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="attendsub" name="attendsub" value="${request.EditPayInfo.attendsub}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" style="background: #CCCCCC" onblur="calsixian()"/> 
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">应发工资：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="shouldgive" name="shouldgive" value="${request.EditPayInfo.shouldgive}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" style="background: #CCCCCC"  /> 
          	 <br/>
          	 应发工资 = 基本工资 + 绩效工资 + 交通费 + 通讯费 + 就餐补助 + 加班金额 + 奖金 <br/> - 四险 - 住房公积金 - 考勤扣除额
          </td>
        </tr>
        
        <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">扣除个人所得税：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="tax" name="tax" value="${request.EditPayInfo.tax}"  size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" style="background: #CCCCCC"  /> 
          </td>
        </tr>
        
         <tr>
          <td height="25" align="right" bgcolor="#FFFFFF" class="style_td">实发工资：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          	 <input type="text" id="reallygive" name="reallygive" value="${request.EditPayInfo.reallygive}" size="30" maxlength="18" 
          	 onkeyup="this.value=this.value.replace(/[^\d\.]+?/g,'')" style="background: #CCCCCC"  /> 
          	 实发工资 = 应发工资 - 个人所得税
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
function getUserIno(){
	var userid = $("#name").val();
	
	var url = 'getUserPayInfo.do'; 
     var params;
     params = {
     		id : userid 
     };
     jQuery.post(url, params, callbackgetUserPayInfo, 'json');
}

function callbackgetUserPayInfo(data){
        if(data.success){
        	if(data.dep == null){ 
        		$("#dep").val(""); 
        	}else{
        		$("#dep").val( data.dep ); 
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
	
	//应发工资
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
	
	//实发工资
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
		} else{
			 editPayinfo();
		}						
}

function editPayinfo(){
 	 var url = 'editPayInfo.do'; 
     var params;
     params = {
       		id : $("#id").val(),
       		
     		name : $("#name  option:selected").text(),
     		dep: $("#dep").val(),
     		basepay:$("#basepay").val(),
     		jixiaopay:$("#jixiaopay").val(), 
     		fourx:$("#fourx").val(), 
     		zhufang:$("#zhufang").val(), 
     		traffic:$("#traffic").val(),
     		
     		communi:$("#communi").val(),
     		mealallow:$("#mealallow").val(),
     		attendsub:$("#attendsub").val(),
     		otmoney:$("#otmoney").val(),
     		award:$("#award").val(),
     		shouldgive:$("#shouldgive").val(),
     		tax:$("#tax").val(),
     		reallygive:$("#reallygive").val()
     };
     jQuery.post(url, params, callbackEditPayInfo, 'json');
}
/**
*异步添加的回调函数
*/ 
function callbackEditPayInfo(data){
        if(data.success){
			alert("工资信息修改成功！");
		 	window.location.href="${pageContext.request.contextPath}/queryPayInfos.do";
        }else{
       		alert("工资信息修改失败,请与管理员联系");
        }
}

function clears(){
	$("#basepay").val(0);
	$("#jixiaopay").val(0); 
	$("#fourx").val(0);
	$("#zhufang").val(0);
	$("#traffic").val(0);
	$("#communi").val(0);
	$("#mealallow").val(0);
	$("#attendsub").val(0);
	$("#otmoney").val(0);
	$("#award").val(0);
	$("#shouldgive").val(0);
	$("#tax").val(0);
	$("#reallygive").val(0);
}
</script>

</html>

