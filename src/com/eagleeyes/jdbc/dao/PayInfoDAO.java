package com.eagleeyes.jdbc.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.eagleeyes.jdbc.bean.PayInfo;
import com.eagleeyes.jdbc.db.ConnDB;
import com.eagleeyes.util.DateUtil;
//工资信息
public class PayInfoDAO {
	
private  ConnDB connDB = new ConnDB();
public  static String  tableName = "tb_pay";
public  static String  tableNameAlias = "pay";

//新增工资信息
public int addPayInfo(PayInfo  payInfo) {
 String sql = "";
 int falg = 0;
 try {
     sql = "insert into  "+tableName+"(name,dep,basepay,jixiaopay" +
     		" ,fourx,zhufang,traffic,communi,mealallow,attendsub,otmoney,award,shouldgive,tax,reallygive"+ 
     		" ,createperson,createtime)  values(" +
     		 
     		 " '"+payInfo.getName()+"'  ,'"+payInfo.getDep()+"' ,'"+payInfo.getBasepay()+"','"+payInfo.getJixiaopay()+"'  " +
     		 " ,'"+payInfo.getFourx()+"'  ,'"+payInfo.getZhufang()+"' ,'"+payInfo.getTraffic()+"','"+payInfo.getCommuni()+"'  " +
     		 " ,'"+payInfo.getMealallow()+"'  ,'"+payInfo.getAttendsub()+"' ,'"+payInfo.getOtmoney()+"' ,'"+payInfo.getAward()+"' ,'"+payInfo.getShouldgive()+"'  " +
     		 " ,'"+payInfo.getTax()+"'  ,'"+payInfo.getReallygive()+"'  " +
     		 
     		 " ,'"+payInfo.getCreateperson()+"' ,'"+DateUtil.dateLongToString(payInfo.getCreatetime())+"'  )";
     falg = connDB.executeUpdate(sql);
     connDB.close();
     
 }catch(Exception ex){
	 ex.printStackTrace();
     falg=0;
 }
 connDB.close();
 return falg;
}


//获取所有 工资 信息 
@SuppressWarnings("unchecked")
public  List<PayInfo>  getAllPayInfos(PayInfo payInfo, int firstSize, int maxSize,String username) throws SQLException {
    	List<PayInfo>  payInfoList = new ArrayList<PayInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
        sqlBuffer.append(sql);
        //名称
        if (StringUtils.isNotBlank(payInfo.getName())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".name  like '%"+payInfo.getName()+"%' ");
        }
        if (StringUtils.isNotBlank(payInfo.getDep())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".dep  like '%"+payInfo.getDep()+"%' ");
        }
        //部门
        /*if (payInfo.getGrade() != 0 && payInfo.getGrade() != -1 ) {
      	  	sqlBuffer.append(" and   "+tableNameAlias+".grade  = '"+payInfo.getGrade()+"'  ");
        }*/
        sqlBuffer.append(" order by createtime desc");
        JdbcUtil jdbcUtil = new JdbcUtil();
        ResultSet rs = jdbcUtil.queryPageRelativeResult(sqlBuffer.toString(), firstSize, maxSize);
        try {
            while (rs.next()) {
            	payInfoList.add(setPayInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        return  payInfoList;
}

//获取所有 工资 信息 -不分页
@SuppressWarnings("unchecked")
public  List<PayInfo>  getAllPayInfosNoPage(PayInfo payInfo) throws SQLException {
    	List<PayInfo>  payInfoList = new ArrayList<PayInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
        sqlBuffer.append(sql);
        //名称
        if (StringUtils.isNotBlank(payInfo.getName())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".name  like '%"+payInfo.getName()+"%' ");
        }
      //部门
        if (StringUtils.isNotBlank(payInfo.getDep())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".dep  like '%"+payInfo.getDep()+"%' ");
        }
        sqlBuffer.append(" order by createtime desc");
       
        ResultSet rs = connDB.executeQuery(sqlBuffer.toString());
        try {
            while (rs.next()) {
            	payInfoList.add(setPayInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        
   return  payInfoList;
}

//获取所有 工资 信息 
@SuppressWarnings("unchecked")
public  List<PayInfo>  getAllPayInfos(PayInfo payInfo) throws SQLException {
    	List<PayInfo>  payInfoList = new ArrayList<PayInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
        sqlBuffer.append(sql);
        sqlBuffer.append(" order by createtime desc");
        ResultSet rs = connDB.executeQuery(sql);
        try {
            while (rs.next()) {
            	payInfoList.add(setPayInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        return  payInfoList;
}


public  PayInfo  setPayInfos(ResultSet rs ) throws SQLException{
	PayInfo info = new PayInfo();
	info.setId(rs.getInt("id"));
	info.setName(rs.getString("name"));
	info.setDep(rs.getString("dep"));
	info.setBasepay(rs.getString("basepay"));
	info.setJixiaopay(rs.getString("jixiaopay"));
	info.setFourx(rs.getString("fourx"));
	info.setZhufang(rs.getString("zhufang"));
	info.setTraffic(rs.getString("traffic"));
	info.setCommuni(rs.getString("communi"));
	info.setMealallow(rs.getString("mealallow"));
	info.setAttendsub(rs.getString("attendsub"));
	info.setOtmoney(rs.getString("otmoney"));
	info.setAward(rs.getString("award"));
	info.setShouldgive(rs.getString("shouldgive"));
	info.setTax(rs.getString("tax"));
	info.setReallygive(rs.getString("reallygive"));
	
	
	info.setCreateperson(rs.getString("createperson"));
	if (StringUtils.isNotBlank(rs.getString("createtime"))) {
	info.setCreatetime(  DateUtil.stringToLongDate( rs.getString("createtime")) );
	}
	return info;
}
 
public  int  getPayInfosCount(PayInfo payInfo,String username) {
	 int res = 0;
	 StringBuffer sqlBuffer = new StringBuffer();
     String sql = "select  count(1) as count from  "+tableName+"   as  "+tableNameAlias+"  where 1=1   ";
     sqlBuffer.append(sql);
     //名称
     if (StringUtils.isNotBlank(payInfo.getName())) {
   	  	sqlBuffer.append(" and  "+tableNameAlias+".name  like '%"+payInfo.getName()+"%' ");
     }
     if (StringUtils.isNotBlank(payInfo.getDep())) {
   	  	sqlBuffer.append(" and  "+tableNameAlias+".dep  like '%"+payInfo.getDep()+"%' ");
     }
     ResultSet rs = connDB.executeQuery(sqlBuffer.toString());
     try {
	     while (rs.next()) {
	    	 res= rs.getInt("count");
	     }
     }catch (Exception ex) {ex.printStackTrace();}
     connDB.close();
     return  res;
}

//删除操作信息
 public int deletePayInfo(String  ids) {
 	int flag = 0;
 	if(ids == null || ids.length()<1){
 		return 0;
 	}
 	String[] ids1 = ids.split(",");
 	for (int i = 0; i < ids1.length; i++) {
 		if (ids1[i] != null && !"".equals(ids1[i])) {
 			String sql = " delete from  "+tableName+"  where  id = '"+ids1[i]+"'  ";
 			flag = connDB.executeUpdate(sql);
 		}
 	}
 	connDB.close();
 	return flag;
 }
 
 /**
  * 查询单个工资信息
  */
 @SuppressWarnings("unused")
 public  PayInfo  getPayInfoById(PayInfo  payInfo) {
    String  sql1 = "select * from  "+tableName+"  where  id = '"+payInfo.getId()+"' ";
    ResultSet rs = connDB.executeQuery(sql1);
    int id = 0;
    PayInfo info = null;
        try {
            if (rs.next()) {
            	 info = setPayInfos(rs);
            }
        }catch(Exception ex){
        	ex.printStackTrace();
        }
        connDB.close();
    return info;
 }
 
 
 public  PayInfo  getPayInfoByName(PayInfo  payInfo) {
	    String  sql1 = "select * from  "+tableName+"  where  name = '"+payInfo.getName()+"' ";
	    ResultSet rs = connDB.executeQuery(sql1);
	    int id = 0;
	    PayInfo info = null;
	        try {
	            if (rs.next()) {
	            	 info = setPayInfos(rs);
	            }
	        }catch(Exception ex){
	        	ex.printStackTrace();
	        }
	        connDB.close();
	    return info;
	 }
	 
 
 
 /**
  * 查询单个工资信息
  */
 @SuppressWarnings("unused")
 public  PayInfo  getPayInfoById(String   payId) {
    String  sql1 = "select * from  "+tableName+"  where  id = '"+payId+"' ";
    ResultSet rs = connDB.executeQuery(sql1);
    int id = 0;
    PayInfo info = null;
        try {
            if (rs.next()) {
            	 info = setPayInfos(rs);
            }
        }catch(Exception ex){
        	ex.printStackTrace();
        }
        connDB.close();
    return info;
 }
 
  
//按照工资信息的ID 更新工资的基本信息
public int updatePayInfoById(PayInfo  payInfo){
  String sql="" +
  	"  update  "+tableName+"  set name='"+ payInfo.getName() +"',dep='"+payInfo.getDep()+"' " +
  	" ,basepay='"+payInfo.getBasepay()+"'  ,jixiaopay='"+payInfo.getJixiaopay()+"'   " +
  	" ,fourx='"+payInfo.getFourx()+"'  ,zhufang='"+payInfo.getZhufang()+"'   " +
  	" ,traffic='"+payInfo.getTraffic()+"'  ,communi='"+payInfo.getCommuni()+"'   " +
  	" ,mealallow='"+payInfo.getMealallow()+"'  ,attendsub='"+payInfo.getAttendsub()+"'   " +
  	" ,otmoney='"+payInfo.getOtmoney()+"'  ,award='"+payInfo.getAward()+"'   " +
  	" ,shouldgive='"+payInfo.getShouldgive()+"'  ,tax='"+payInfo.getTax()+"'   " +
  	" ,reallygive='"+payInfo.getReallygive()+"'    " +
  	
  	"  where id='"+payInfo.getId()+"'";
  int ret = connDB.executeUpdate(sql); 
  connDB.close();
  return ret;
}


public static void main(String[] args) throws SQLException {
	 
}
    
        
        
        
}
