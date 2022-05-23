package com.eagleeyes.jdbc.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.eagleeyes.jdbc.bean.UserInfo;
import com.eagleeyes.jdbc.db.ConnDB;
import com.eagleeyes.util.DateUtil;

public class UserInfoDAO {
	
private  ConnDB connDB = new ConnDB();
public  static String  tableName = "tb_user";
public  static String  tableNameAlias = "user_er";



public  UserInfo  getUserInfo(UserInfo userInfo) {
	 StringBuffer sqlBuffer = new StringBuffer();
    String sql = "select *  from  "+tableName+"  as  "+tableNameAlias+"  where username='"+userInfo.getUsername()+"' " +
    		"  and password='"+ userInfo.getPassword()+"' "    +
    		"  and roleid='"+userInfo.getRoleid()+"'  ";
    sqlBuffer.append(sql);
    ResultSet rs = connDB.executeQuery(sqlBuffer.toString());
    UserInfo info = null;
    try {
	     while (rs.next()) {
	    	 info = new UserInfo();
	    	 info.setId(rs.getInt("id"));
	    	 info.setRoleid(rs.getInt("roleid"));
	    	 info.setUsername(rs.getString("username"));
	    	 info.setTruename(rs.getString("truename"));
	    	 info.setPassword(rs.getString("password"));
	    	 info.setPhone(rs.getString("phone"));
	    	 info.setAddress(rs.getString("address"));
	    	 info.setAge(rs.getString("age"));
	    	 info.setSex(rs.getInt("sex") );
	    	 info.setDep(rs.getString("dep"));
	    	 info.setDegree(rs.getString("degree"));
	    	 info.setJob(rs.getString("job"));
	    	 info.setPic(rs.getString("pic"));
	    	 info.setIdno(rs.getString("idno"));
	    	 info.setMianmao(rs.getString("mianmao"));
	    	 info.setEmail(rs.getString("email"));
	    	 
	     }
    }catch (Exception ex) {ex.printStackTrace();}
    connDB.close();
    return  info;
}

public  UserInfo  getUserInfo_front(UserInfo userInfo) {
	 StringBuffer sqlBuffer = new StringBuffer();
   String sql = "select *  from  "+tableName+"  as  "+tableNameAlias+"  where username='"+userInfo.getUsername()+"' " +
   		"  and password='"+ userInfo.getPassword()+"' "    +
   		"  ";
   sqlBuffer.append(sql);
   ResultSet rs = connDB.executeQuery(sqlBuffer.toString());
   UserInfo info = null;
   try {
	     while (rs.next()) {
	    	 info = setUserInfo(rs);
	     }
   }catch (Exception ex) {ex.printStackTrace();}
   connDB.close();
   return  info;
}

public  UserInfo  setUserInfo(ResultSet rs) throws SQLException {
	UserInfo info = new UserInfo();
	 info.setId(rs.getInt("id"));
	 info.setRoleid(rs.getInt("roleid"));
	 info.setUsername(rs.getString("username"));
	 info.setTruename(rs.getString("truename"));
	 info.setPassword(rs.getString("password"));
	 info.setPhone(rs.getString("phone"));
	 info.setAddress(rs.getString("address"));
	 info.setAge(rs.getString("age"));
	 info.setSex(rs.getInt("sex") );
	 info.setDep(rs.getString("dep"));
	 info.setDegree(rs.getString("degree"));
	 info.setJob(rs.getString("job"));
	 info.setPic(rs.getString("pic"));
	 info.setIdno(rs.getString("idno"));
	 info.setMianmao(rs.getString("mianmao"));
	 info.setEmail(rs.getString("email"));
  return  info;
}



//新增用户信息
public int addUserInfo(UserInfo  userInfo) {
 String sql = "";
 int falg = 0;
 try {
     sql = "insert into  "+tableName+"(roleid,username,password,truename,phone,address " +
     		" ,age,sex,dep,degree,job,pic,idno,mianmao,email"+ 
     		" ,createperson,createtime)  values(" +
     		 
     		 " '"+userInfo.getRoleid()+"','"+userInfo.getUsername()+"','"+userInfo.getPassword()+"' " +
     		 " ,'"+userInfo.getTruename()+"','"+userInfo.getPhone()+"' ,'"+userInfo.getAddress()+"'  "+
     		 
     		 " ,'"+userInfo.getAge()+"','"+userInfo.getSex()+"' ,'"+userInfo.getDep()+"'  "+
     		 " ,'"+userInfo.getDegree()+"','"+userInfo.getJob()+"' ,'"+userInfo.getPic()+"'  "+
     		 " ,'"+userInfo.getIdno()+"','"+userInfo.getMianmao()+"' ,'"+userInfo.getEmail()+"'  "+
     		
     		 " ,'"+userInfo.getCreateperson()+"' ,'"+DateUtil.dateLongToString(userInfo.getCreatetime())+"'  )";
     falg = connDB.executeUpdate(sql);
     connDB.close();
 }catch(Exception ex){
	   ex.printStackTrace();
     falg=0;
 }
 connDB.close();
 return falg;
}

public  List<UserInfo>  getAllUserInfo(UserInfo userInfo) {
	List<UserInfo>  userInfoList = new ArrayList<UserInfo>();
	
	StringBuffer sqlBuffer = new StringBuffer();
    String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
    sqlBuffer.append(sql);
    sqlBuffer.append(" order by createtime desc");
    ResultSet rs = connDB.executeQuery(sqlBuffer.toString());
    
   try {
	     while (rs.next()) {
	    	 userInfoList.add(setUserInfos(rs));
	     }
	     
   }catch (Exception ex) {ex.printStackTrace();}
   connDB.close();
   return  userInfoList;
}



//获取所有 用户 信息 
@SuppressWarnings("unchecked")
public  List<UserInfo>  getAllUserInfos(UserInfo userInfo, int firstSize, int maxSize) throws SQLException {
    	List<UserInfo>  userInfoList = new ArrayList<UserInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
        sqlBuffer.append(sql);
        //用户名
        if (StringUtils.isNotBlank(userInfo.getUsername())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".username like '%"+userInfo.getUsername()+"%' ");
        }
        //电话
        if (StringUtils.isNotBlank(userInfo.getPhone())) {
      	  	sqlBuffer.append(" and   "+tableNameAlias+".phone  like '%"+userInfo.getPhone()+"%' ");
        }
        sqlBuffer.append(" order by createtime desc");
        JdbcUtil jdbcUtil = new JdbcUtil();
        ResultSet rs = jdbcUtil.queryPageRelativeResult(sqlBuffer.toString(), firstSize, maxSize);
        try {
            while (rs.next()) {
            	userInfoList.add(setUserInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        return  userInfoList;
}

//获取所有 会员 信息 
@SuppressWarnings("unchecked")
public  List<UserInfo>  getAllUserInfos_member(UserInfo userInfo, int firstSize, int maxSize) throws SQLException {
    	List<UserInfo>  userInfoList = new ArrayList<UserInfo>();
    	StringBuffer sqlBuffer = new StringBuffer();
        String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1  and roleid !='1' ";
        sqlBuffer.append(sql);
        //用户名
        if (StringUtils.isNotBlank(userInfo.getUsername())) {
      	  	sqlBuffer.append(" and  "+tableNameAlias+".username like '%"+userInfo.getUsername()+"%' ");
        }
        //电话
        if (StringUtils.isNotBlank(userInfo.getPhone())) {
      	  	sqlBuffer.append(" and   "+tableNameAlias+".phone  like '%"+userInfo.getPhone()+"%' ");
        }
        sqlBuffer.append(" order by createtime desc");
        JdbcUtil jdbcUtil = new JdbcUtil();
        ResultSet rs = jdbcUtil.queryPageRelativeResult(sqlBuffer.toString(), firstSize, maxSize);
        try {
            while (rs.next()) {
            	userInfoList.add(setUserInfos(rs));
            }
        }catch (Exception ex) {ex.printStackTrace();}
        connDB.close();
        return  userInfoList;
}

public  List<UserInfo>  getAllUserInfos_jifen(UserInfo userInfo, int firstSize, int maxSize) throws SQLException {
	List<UserInfo>  userInfoList = new ArrayList<UserInfo>();
	StringBuffer sqlBuffer = new StringBuffer();
    String sql = "select * from  "+tableName+"  "+tableNameAlias+"  where 1=1 ";
    sqlBuffer.append(sql);
    //用户名
    if (StringUtils.isNotBlank(userInfo.getUsername())) {
  	  	sqlBuffer.append(" and  "+tableNameAlias+".username like '%"+userInfo.getUsername()+"%' ");
    }
    //电话
    if (StringUtils.isNotBlank(userInfo.getPhone())) {
  	  	sqlBuffer.append(" and   "+tableNameAlias+".phone  like '%"+userInfo.getPhone()+"%' ");
    }
    sqlBuffer.append(" order by createtime desc");
    JdbcUtil jdbcUtil = new JdbcUtil();
    ResultSet rs = jdbcUtil.queryPageRelativeResult(sqlBuffer.toString(), firstSize, maxSize);
    try {
        while (rs.next()) {
        	userInfoList.add(setUserInfos(rs));
        }
    }catch (Exception ex) {ex.printStackTrace();}
    connDB.close();
    return  userInfoList;
}



public  UserInfo  setUserInfos(ResultSet rs ) throws SQLException{
	 UserInfo info = new UserInfo();
	 info.setId(rs.getInt("id"));
	 info.setRoleid(rs.getInt("roleid"));
	 info.setUsername(rs.getString("username"));
	 info.setTruename(rs.getString("truename"));
	 info.setPassword(rs.getString("password"));
	 info.setPhone(rs.getString("phone"));
	 info.setAddress(rs.getString("address"));
	 info.setAge(rs.getString("age"));
	 info.setSex(rs.getInt("sex") );
	 info.setDep(rs.getString("dep"));
	 info.setDegree(rs.getString("degree"));
	 info.setJob(rs.getString("job"));
	 info.setPic(rs.getString("pic"));
	 info.setIdno(rs.getString("idno"));
	 info.setMianmao(rs.getString("mianmao"));
	 info.setEmail(rs.getString("email"));
	
	info.setCreateperson(rs.getString("createperson"));
	if (StringUtils.isNotBlank(rs.getString("createtime"))) {
	info.setCreatetime(rs.getDate("createtime"));
	}
	return info;
}
public  int  getUserInfosCount(UserInfo userInfo) {
	 int res = 0;
	 StringBuffer sqlBuffer = new StringBuffer();
     String sql = "select  count(1) as count from  "+tableName+"   as  "+tableNameAlias+"  where 1=1  ";
     sqlBuffer.append(sql);
     //用户名
     if (StringUtils.isNotBlank(userInfo.getUsername())) {
   	  	sqlBuffer.append(" and  "+tableNameAlias+".username like '%"+userInfo.getUsername()+"%' ");
     }
     //电话
     if (StringUtils.isNotBlank(userInfo.getPhone())) {
   	  	sqlBuffer.append(" and   "+tableNameAlias+".phone  like '%"+userInfo.getPhone()+"%' ");
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

public  int  getUserInfosCount_member(UserInfo userInfo) {
	 int res = 0;
	 StringBuffer sqlBuffer = new StringBuffer();
    String sql = "select  count(1) as count from  "+tableName+"   as  "+tableNameAlias+"  where 1=1 and roleid!='1' ";
    sqlBuffer.append(sql);
    //用户名
    if (StringUtils.isNotBlank(userInfo.getUsername())) {
  	  	sqlBuffer.append(" and  "+tableNameAlias+".username like '%"+userInfo.getUsername()+"%' ");
    }
    //电话
    if (StringUtils.isNotBlank(userInfo.getPhone())) {
  	  	sqlBuffer.append(" and   "+tableNameAlias+".phone  like '%"+userInfo.getPhone()+"%' ");
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

public  int  getUserInfosCount_jifen(UserInfo userInfo) {
	 int res = 0;
	 StringBuffer sqlBuffer = new StringBuffer();
    String sql = "select  count(1) as count from  "+tableName+"   as  "+tableNameAlias+"  where 1=1  ";
    sqlBuffer.append(sql);
    //用户名
    if (StringUtils.isNotBlank(userInfo.getUsername())) {
  	  	sqlBuffer.append(" and  "+tableNameAlias+".username like '%"+userInfo.getUsername()+"%' ");
    }
    //电话
    if (StringUtils.isNotBlank(userInfo.getPhone())) {
  	  	sqlBuffer.append(" and   "+tableNameAlias+".phone  like '%"+userInfo.getPhone()+"%' ");
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
 public int deleteUserInfo(String  ids) {
 	int flag = 0;
 	if(ids == null || ids.length()<1){
 		return 0;
 	}
 	String[] ids1 = ids.split(",");
 	for (int i = 0; i < ids1.length; i++) {
 		if (ids1[i] != null && !"".equals(ids1[i])) {
 			String sql = "delete from  "+tableName+"   where  id = '"+ids1[i]+"'  ";
 			flag = connDB.executeUpdate(sql);
 		}
 	}
 	connDB.close();
 	return flag;
 }
 
 /**
  * 查询单个用户信息
  */
 @SuppressWarnings("unused")
 public  UserInfo  getUserInfoById(UserInfo  userInfo) {
    String  sql1 = "select * from  "+tableName+"  where  id = '"+userInfo.getId()+"' ";
    ResultSet rs = connDB.executeQuery(sql1);
    int id = 0;
    UserInfo  info = null;
        try {
            if (rs.next()) {
            	 info = setUserInfos(rs);
            }
        }catch(Exception ex){
        	ex.printStackTrace();
        }
        connDB.close();
    return info;
 }
 
 //按照用户姓名 来查询用户信息 ---  按照用户 账号信息查询 
 public  UserInfo  getUserInfoByName(UserInfo  userInfo) {
	    String  sql1 = "select * from  "+tableName+"  where  username = '"+userInfo.getUsername()+"' ";
	    ResultSet rs = connDB.executeQuery(sql1);
	    UserInfo  info = null;
	        try {
	            if (rs.next()) {
	            	 info = setUserInfos(rs);
	            }
	        }catch(Exception ex){
	        	ex.printStackTrace();
	        }
	        connDB.close();
	    return info;
	 }
 
 
 public  UserInfo  getUserInfoByName2(UserInfo  userInfo) {
	    String  sql1 = "select * from  "+tableName+"  where  truename = '"+userInfo.getUsername()+"' ";
	    ResultSet rs = connDB.executeQuery(sql1);
	    UserInfo  info = null;
	        try {
	            if (rs.next()) {
	            	 info = setUserInfos(rs);
	            }
	        }catch(Exception ex){
	        	ex.printStackTrace();
	        }
	        connDB.close();
	    return info;
	 }
 
	
//按照用户信息的ID 更新用户的基本信息
public int updateUserInfoById(UserInfo  userInfo){
  String sql="" +
  	"  update "+tableName+" set roleid='"+ userInfo.getRoleid() +"',truename='"+userInfo.getTruename()+"' " +
  	" ,phone='"+userInfo.getPhone()+"',address='"+userInfo.getAddress()+"'  " +
  	" ,age='"+userInfo.getAge()+"',sex='"+userInfo.getSex()+"'  " +
  	" ,dep='"+userInfo.getDep()+"',degree='"+userInfo.getDegree()+"'  " +
  	" ,job='"+userInfo.getJob()+"',pic='"+userInfo.getPic()+"'  " +
  	" ,idno='"+userInfo.getIdno()+"',mianmao='"+userInfo.getMianmao()+"'  " +
  	" ,email='"+userInfo.getEmail()+"'   " +
  	
  	"  where id='"+userInfo.getId()+"'";
  int ret = connDB.executeUpdate(sql); 
  connDB.close();
  return ret;
}

//public int updateUserInfoJifenById(UserInfo  userInfo){
//	  String sql="" +
//	  	"  update "+tableName+" set   " +
//	  	"  jifen='"+userInfo.getJifen()+"' " +
//	  	"  where id='"+userInfo.getId()+"'";
//	  int ret = connDB.executeUpdate(sql); 
//	  connDB.close();
//	  return ret;
//	}

//按照用户信息的ID 更新用户的密码
public int updateUserPasswordInfoById(UserInfo  userInfo){
  String sql="" +
  	"  update "+tableName+" set password='"+ userInfo.getPassword() +"'  "  +
  	"  where id='"+userInfo.getId()+"'";
  int ret = connDB.executeUpdate(sql); 
  connDB.close();
  return ret;
}

//按照用户信息的账号  更新用户的密码
public int updateUserPasswordInfoByUsername(UserInfo  userInfo){
  String sql="" +
  	"  update "+tableName+" set password='"+ userInfo.getPassword() +"'  "  +
  	"  where username='"+userInfo.getUsername()+"'";
  int ret = connDB.executeUpdate(sql); 
  connDB.close();
  return ret;
}



//按照用户的用户名  更新 积分
//public int updateUserJIfenInfoByName(UserInfo  userInfo){
//String sql="" +
//	"  update "+tableName+" set jifen='"+ userInfo.getJifen() +"'  "  +
//	"  where username='"+userInfo.getUsername()+"'";
//int ret = connDB.executeUpdate(sql); 
//connDB.close();
//return ret;
//}

//public int updateUserJIfenInfoByName2(UserInfo  userInfo){
//	String sql="" +
//		"  update "+tableName+" set jifen='"+ userInfo.getJifen() +"'  "  +
//		"  where truename='"+userInfo.getUsername()+"'";
//	int ret = connDB.executeUpdate(sql); 
//	connDB.close();
//	return ret;
//	}


public static void main(String[] args) throws SQLException {
	 
}
    
        
        
        
}
