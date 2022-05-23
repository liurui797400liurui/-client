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
<title>系统公告</title>
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
                <td width="96%" valign="bottom"><span class="style_navi">系统公告</span></td>
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
        	<td height="25" colspan="4" bgcolor="#FFFFFF" class="style_td">&nbsp; <strong>国家税收条款和比例： </strong></td>
        </tr>
       
        <tr>
          <td height="25" width="100%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          	
          		<!-- 条款比例 -->
          		
					<h3>个人税率表</h3>
						<div><strong>2011年9月1日起调整后，也就是2012年实行的7级超额累进个人所得税税率表</strong></div>
						<div>应纳个人所得税税额= 应纳税所得额× 适用税率- 速算扣除数</div>
						<div>扣除标准3500元/月（2011年9月1日起正式执行）（工资、薪金所得适用）</div>
						<div>个税免征额3500元 　（工资薪金所得适用）</div>
						<table border="1" cellpadding="1" cellspacing="0" log-set-param="table_view">
						  <tbody>
						    <tr>
						      <td align="center" valign="center" width="0"><div>级数</div></td>
						      <td align="center" valign="center" width="0"><div>全月应纳税所得额（含税级距）【税率资讯网提供】</div></td>
						      <td><div>全月应纳税所得额（不含税级距）</div></td>
						      <td align="center" valign="center" width="0"><div>税率(%)</div></td>
						      <td align="center" valign="center" width="0"><div>速算扣除数</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>1</div></td>
						      <td><div>不超过1,500元</div></td>
						      <td><div>不超过1455元的</div></td>
						      <td><div>3</div></td>
						      <td><div>0</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>2</div></td>
						      <td><div>超过1,500元至4,500元的部分</div></td>
						      <td><div>超过1455元至4155元的部分</div></td>
						      <td><div>10</div></td>
						      <td><div>105</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>3</div></td>
						      <td><div>超过4,500元至9,000元的部分</div></td>
						      <td><div>超过4155元至7755元的部分</div></td>
						      <td><div>20</div></td>
						      <td><div>555</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>4</div></td>
						      <td><div>超过9,000元至35,000元的部分</div></td>
						      <td><div>超过7755元至27255元的部分</div></td>
						      <td><div>25</div></td>
						      <td><div>1,005</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>5</div></td>
						      <td><div>超过35,000元至55,000元的部分</div></td>
						      <td><div>超过27255元至41255元的部分</div></td>
						      <td><div>30</div></td>
						      <td><div>2,755</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>6</div></td>
						      <td><div>超过55,000元至80,000元的部分</div></td>
						      <td><div>超过41255元至57505元的部分</div></td>
						      <td><div>35</div></td>
						      <td><div>5,505</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="0"><div>7</div></td>
						      <td><div>超过80,000元的部分</div></td>
						      <td><div>超过57505元的部分</div></td>
						      <td><div>45</div></td>
						      <td><div>13,505</div></td>
						    </tr>
						  </tbody>
						</table>
          	
          	
          		<!--  -->
          	</div>
          </td>
          
        </tr>
        
        
        <tr>
        	<td height="25" colspan="4" bgcolor="#FFFFFF" class="style_td">&nbsp; <strong>公司奖惩制度： </strong></td>
        </tr>
       
        <tr>
          <td height="25" width="100%" bgcolor="#FFFFFF" class="style_td">
          	<div align="center">
          	
          		<!-- 条款比例 -->
          		
						<h3>公司奖惩制度</h3>
						<div><strong>公司奖惩制度明细如下：</strong></div>
						<div></div>
						<div></div>
						<div></div>
						<table width="678" border="1" cellpadding="1" cellspacing="0" log-set-param="table_view">
						  <tbody>
						    <tr>
						      <td align="center" valign="center" width="87"><div>部门</div></td>
						      <td align="center" valign="center" width="317"><div>请假扣减金额</div></td>
						      <td width="136"><div>加班增加金额基数</div></td>
						      <td align="center" valign="center" width="81"><div>倍率</div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="87"><div>所有部门</div></td>
						      <td><div>病假（扣除每日基本工资的40% * 请假天数）</div></td>
						      <td><div>每日基本工资的</div></td>
						      <td><div>
						        <div align="center">3</div>
						      </div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="87"><div>所有部门</div></td>
						      <td><div>不发放当日基本工资</div></td>
						      <td><div>每日基本工资的</div></td>
						      <td><div>
						        <div align="center">3</div>
						      </div></td>
						    </tr>
						    <tr>
						      <td align="center" valign="center" width="87"><div>所有部门</div></td>
						      <td><div>其他（暂无）</div></td>
						      <td><div>每日基本工资的</div></td>
						      <td><div>
						        <div align="center">3</div>
						      </div></td>
						    </tr>
						  </tbody>
						</table>
          	
          	
          		<!--  -->
          	</div>
          </td>
          
        </tr>
        
        
       
         
        
        
        <!-- 
		<tr>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
          <td height="25" bgcolor="#FFFFFF" class="style_td">
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;
          &nbsp;&nbsp;
          </td>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style_td">&nbsp;</td>
        </tr>
         -->
         
         
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

