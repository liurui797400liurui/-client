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
<title>查看工资详情</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">查看工资信息</span></td>
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
          	<div align="center">${ViewPayInfo.name}</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">部门：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	 ${ViewPayInfo.dep}  
			</div>
          </td>
        </tr>
        
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">基本工资：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.basepay}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">绩效工资：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewPayInfo.jixiaopay} 
			</div>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">四险：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.fourx}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">住房公积金：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewPayInfo.zhufang} 
			</div>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">交通费：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.traffic}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">通讯费：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewPayInfo.communi} 
			</div>
          </td>
        </tr>
        
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">就餐补助：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.mealallow}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">加班金额：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewPayInfo.otmoney} 
			</div>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">奖金：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.award}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">考勤扣除额：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewPayInfo.attendsub} 
			</div>
          </td>
        </tr>
        
        <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">应发工资：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.shouldgive}  
          	</div>
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">个人所得税：</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
            <div align="center">
	          	${ViewPayInfo.tax} 
			</div>
          </td>
        </tr>
        
         <tr>
          <td height="25" width="25%" align="center" bgcolor="#FFFFFF" class="style_td">
          	<div class="style_font" align="center">实发工资：</div>
          </td>
          <td height="25" width="25%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          		 ${ViewPayInfo.reallygive}  
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

