<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	Integer userid = (Integer)session.getAttribute("userid");
 %>
<HTML>
<HEAD>
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<script language="javascript">
	function expand(el){
		childObj = document.getElementById("child" + el);
		if (childObj.style.display == 'none'){
			childObj.style.display = 'block';
		}else{
			childObj.style.display = 'none';
		}
		return;
	}
</script>
</head>
<BODY>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170  background=images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR>
          <TD height=10></TD></TR>
       </TABLE>
       
      <!-- 1 管理员  2 医生  3 患者 -->
      <s:if  test="#session.roleid==1"> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A  class=menuParent onclick=expand(1)  href="javascript:void(0);">用户管理</A></TD></TR>
          <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0   width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="touser_Add.do"  target=main>增加用户</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9>
          </TD>
          <TD><A class=menuChild   href="queryUserInfos.do"   target=main>查询用户</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if>
     <!-- 
     <s:if  test="#session.roleid==1"> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A  class=menuParent onclick=expand(2)  href="javascript:void(0);">会员管理</A></TD></TR>
          <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0   width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="tomember_Add.do"  target=main>增加会员</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9>
          </TD>
          <TD><A class=menuChild   href="queryUserInfos_member.do"   target=main>查询会员</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if>
      -->
     
     <s:if  test="#session.roleid==1"> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A  class=menuParent onclick=expand(5)  href="javascript:void(0);">工资管理</A></TD></TR>
          <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0   width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="toPay_Add.do"  target=main>工资录入</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9>
          </TD>
          <TD><A class=menuChild   href="queryPayInfos.do"   target=main>工资查询</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if>
     
     
     <s:if  test="#session.roleid==2 || #session.roleid==1 "> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A  class=menuParent onclick=expand(15)  href="javascript:void(0);">个人工资</A></TD></TR>
          <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child15 style="DISPLAY: none" cellSpacing=0 cellPadding=0   width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="toView_PayInfo_person.do?id=<%=userid%>"  target=main>个人工资明细</A></TD>
        </TR>
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if>
     
     
     <s:if  test="#session.roleid==1"> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A  class=menuParent onclick=expand(6)  href="javascript:void(0);">奖惩管理</A></TD></TR>
          <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0   width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="toReward_Add.do"  target=main>奖惩录入</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9>
          </TD>
          <TD><A class=menuChild   href="queryRewardInfos.do"   target=main>奖惩查询</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if>
     
     
     <s:if  test="#session.roleid==1"> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A  class=menuParent onclick=expand(7)  href="javascript:void(0);">工资统计</A></TD></TR>
          <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0   width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="queryPayInfosCount.do"  target=main>工资查询统计</A></TD>
        </TR>
        <!-- 
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="images/menu_icon.gif" width=9>
          </TD>
          <TD><A class=menuChild   href="queryDoctorInfos.do"   target=main>查询医生</A></TD></TR>
          --> 
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if>
  
   
     <s:if  test="#session.roleid==1 " >  
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A class=menuParent onclick=expand(4) href="javascript:void(0);">打印报表</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="queryPayInfosPrint.do"  target=main>打印报表</A></TD></TR>
        
        <!-- 
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild   href="queryHealthInfos.do"  target=main>养生医疗知识查询</A></TD></TR>
        --> 
           
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
     </s:if> 
   
      <s:if  test="#session.roleid==1 || #session.roleid==2  " > 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A class=menuParent onclick=expand(12) href="javascript:void(0);">系统公告</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child12 style="display: none" cellSpacing=0 cellPadding=0  width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9  src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="to_fabu_gonggao.do" target=main>系统公告</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR>
      </TABLE>
      </s:if>
      
      
    
      
      
  
    <s:if  test="#session.roleid==1 || #session.roleid==2  || #session.roleid==3 " > 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
          <A class=menuParent onclick=expand(0) href="javascript:void(0);">个人管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child0 style="DISPLAY: none" cellSpacing=0 cellPadding=0  width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="tomodify_password.do" target=main>修改口令</A></TD>
        </TR>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  href="tomodify_userInfo.do" target=main>修改个人信息</A></TD>
        </TR>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild  onclick="if (confirm('确定要退出吗？')) return true; else return false;" 
            href="userExit.do"  target=_top>退出系统</A></TD>
       </TR>
       
       </TABLE>
     </s:if>
       
     </TD>
    <TD width=1 bgColor=#d1e6f7></TD></TR>
    </TABLE>
    
</BODY>
    
</HTML>
