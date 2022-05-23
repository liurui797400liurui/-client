package com.eagleeyes.jdbc.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.eagleeyes.jdbc.bean.RewardInfo;
import com.eagleeyes.jdbc.db.ConnDB;
import com.eagleeyes.util.DateUtil;
//奖惩信息
public class RewardInfoDAO {
	
private  ConnDB connDB = new ConnDB();
public  static String  tableName = "tb_reward";
public  static String  tableNameAlias = "reward";

//新增奖惩信息
public int addRewardInfo(RewardInfo  rewardInfo) {
 String sql = "";
 int falg = 0;
 try {
     sql = "insert into  "+tableName+"(name,dep,type,leavetype" +
     		" ,leaveday,otday,money "+ 
     		" ,createperson,createtime)  values(" +
     		 
     		 " '"+rewardInfo.getName()+"'  ,'"+rewardInfo.getDep()+"' ,'"+rewardInfo.getType()+"','"+rewardInfo.getLeavetype()+"'  " +
     		 " ,'"+rewardInfo.getLeaveday()+"'  ,'"+rewardInfo.getOtday()+"' ,'"+rewardInfo.getMoney()+"'    " +
     		 
     		 " ,'"+rewardInfo.getCreateperson()+"' ,'"+DateUtil.dateLongToString(rewardInfo.getCreatetime())+"'  )";
     falg = connDB.executeUpdate(sql);
     connDB.close();
     
 }catch(Exception ex){
	 ex.printStackTrace();
     falg=0;
 }
 connDB.close();
 return falg;
}


//获取所有 奖惩 信息 
@SuppressWarnings("unchecked")
public  List<RewardInfo>  getAllRewardInfos(RewardInfo rewardInfo, int firstSize, int maxSize,String username) throws SQLException {
    	List<RewardInfo>  rewardInfoList = new ArrayList<RewardInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
        sqlBuffer.append(sql);
        //名称
        if (StringUtils.isNotBlank(rewardInfo.getName())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".name  like '%"+rewardInfo.getName()+"%' ");
        }
        //部门
        if (StringUtils.isNotBlank(rewardInfo.getDep())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".dep  like '%"+rewardInfo.getDep()+"%' ");
        }
        sqlBuffer.append(" order by createtime desc");
        JdbcUtil jdbcUtil = new JdbcUtil();
        ResultSet rs = jdbcUtil.queryPageRelativeResult(sqlBuffer.toString(), firstSize, maxSize);
        try {
            while (rs.next()) {
            	rewardInfoList.add(setRewardInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        return  rewardInfoList;
}

//获取所有 奖惩 信息 
@SuppressWarnings("unchecked")
public  List<RewardInfo>  getAllRewardInfos(RewardInfo rewardInfo) throws SQLException {
    	List<RewardInfo>  rewardInfoList = new ArrayList<RewardInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
        sqlBuffer.append(sql);
        sqlBuffer.append(" order by createtime desc");
        ResultSet rs = connDB.executeQuery(sql);
        try {
            while (rs.next()) {
            	rewardInfoList.add(setRewardInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        return  rewardInfoList;
}


public  RewardInfo  setRewardInfos(ResultSet rs ) throws SQLException{
	RewardInfo info = new RewardInfo();
	info.setId(rs.getInt("id"));
	info.setName(rs.getString("name"));
	info.setDep(rs.getString("dep"));
	info.setType(rs.getString("type"));
	info.setLeavetype(rs.getString("leavetype"));
	info.setLeaveday(rs.getString("leaveday"));
	info.setOtday(rs.getString("otday"));
	info.setMoney(rs.getString("money"));
	
	info.setCreateperson(rs.getString("createperson"));
	if (StringUtils.isNotBlank(rs.getString("createtime"))) {
	info.setCreatetime(  DateUtil.stringToLongDate( rs.getString("createtime")) );
	}
	return info;
}
 
public  int  getRewardInfosCount(RewardInfo rewardInfo,String username) {
	 int res = 0;
	 StringBuffer sqlBuffer = new StringBuffer();
     String sql = "select  count(1) as count from  "+tableName+"   as  "+tableNameAlias+"  where 1=1   ";
     sqlBuffer.append(sql);
     //名称
     if (StringUtils.isNotBlank(rewardInfo.getName())) {
   	  	sqlBuffer.append(" and  "+tableNameAlias+".name  like '%"+rewardInfo.getName()+"%' ");
     }
     if (StringUtils.isNotBlank(rewardInfo.getDep())) {
   	  	sqlBuffer.append(" and  "+tableNameAlias+".dep  like '%"+rewardInfo.getDep()+"%' ");
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
 public int deleteRewardInfo(String  ids) {
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
  * 查询单个奖惩信息
  */
 @SuppressWarnings("unused")
 public  RewardInfo  getRewardInfoById(RewardInfo  rewardInfo) {
    String  sql1 = "select * from  "+tableName+"  where  id = '"+rewardInfo.getId()+"' ";
    ResultSet rs = connDB.executeQuery(sql1);
    int id = 0;
    RewardInfo info = null;
        try {
            if (rs.next()) {
            	 info = setRewardInfos(rs);
            }
        }catch(Exception ex){
        	ex.printStackTrace();
        }
        connDB.close();
    return info;
 }
 
 
 public  RewardInfo  getRewardInfoByName(RewardInfo  rewardInfo) {
	    String  sql1 = "select * from  "+tableName+"  where  name = '"+rewardInfo.getName()+"' ";
	    ResultSet rs = connDB.executeQuery(sql1);
	    int id = 0;
	    RewardInfo info = null;
	        try {
	            if (rs.next()) {
	            	 info = setRewardInfos(rs);
	            }
	        }catch(Exception ex){
	        	ex.printStackTrace();
	        }
	        connDB.close();
	    return info;
	 }
	
 
 public  List<RewardInfo>  getRewardInfoListByName(RewardInfo  rewardInfo) {
	    String  sql1 = "select * from  "+tableName+"  where  name = '"+rewardInfo.getName()+"' ";
	    ResultSet rs = connDB.executeQuery(sql1);
	    int id = 0;
	    List<RewardInfo> list = new ArrayList<RewardInfo>();
	    RewardInfo info = null;
	        try {
	            while (rs.next()) {
	            	 info = setRewardInfos(rs);
	            	 list.add(info);
	            }
	        }catch(Exception ex){
	        	ex.printStackTrace();
	        }
	        connDB.close();
	    return list;
	 }
	 
 
 /**
  * 查询单个奖惩信息
  */
 @SuppressWarnings("unused")
 public  RewardInfo  getRewardInfoById(String   payId) {
    String  sql1 = "select * from  "+tableName+"  where  id = '"+payId+"' ";
    ResultSet rs = connDB.executeQuery(sql1);
    int id = 0;
    RewardInfo info = null;
        try {
            if (rs.next()) {
            	 info = setRewardInfos(rs);
            }
        }catch(Exception ex){
        	ex.printStackTrace();
        }
        connDB.close();
    return info;
 }
 
  
//按照奖惩信息的ID 更新奖惩的基本信息
public int updateRewardInfoById(RewardInfo  rewardInfo){
  String sql="" +
  	"  update  "+tableName+"  set name='"+ rewardInfo.getName() +"',dep='"+rewardInfo.getDep()+"' " +
  	" ,type='"+rewardInfo.getType()+"'  ,leavetype='"+rewardInfo.getLeavetype()+"'   " +
  	" ,leaveday='"+rewardInfo.getLeaveday()+"'  ,otday='"+rewardInfo.getOtday()+"'   " +
  	" ,money='"+rewardInfo.getMoney()+"'     " +
  	 
  	
  	"  where id='"+rewardInfo.getId()+"'";
  int ret = connDB.executeUpdate(sql); 
  connDB.close();
  return ret;
}


public static void main(String[] args) throws SQLException {
	 
}
    
        
        
        
}
