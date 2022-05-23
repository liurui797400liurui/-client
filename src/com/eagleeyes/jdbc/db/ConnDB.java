package com.eagleeyes.jdbc.db; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class ConnDB {
	int i = 0;
	Logger logger = Logger.getLogger(ConnDB.class);
	public Connection conn = null; 
	public Statement stmt = null;  
	public ResultSet rs = null;  
	
	private  String dbClassName_mysql 	= "com.mysql.jdbc.Driver"; 
	private  String dbUrl = "";
	private  String dbUser = "";
	private  String dbPwd = "";
	 
	public  Connection getConnection() {
		CommonParam commonParam = new CommonParam();
		
//		dbClassName_mysql  = commonParam.getString("SQLServer_DB_CLASS_NAME");//驱动
//		dbUrl =  commonParam.getString("SQLServer_DB_URL");//数据库
//		dbUser = commonParam.getString("SQLServer_DB_USER");//用户名
//		dbPwd  = commonParam.getString("SQLServer_DB_PWD");//密码
		
		dbClassName_mysql  = commonParam.getString("jdbc.driverClassName");//驱动
		dbUrl =  commonParam.getString("jdbc.url");//数据库
		dbUser = commonParam.getString("jdbc.username");//用户名
		dbPwd  = commonParam.getString("jdbc.password");//密码
		
		Connection conn = null;
		try {
			Class.forName(dbClassName_mysql).newInstance();
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			//System.out.println("*** connection database success by  mysql  jdbc " + i +" times");
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			String message = "" +
			"警告: DbConnectionManager.getConnection() " +
			"获得数据库链接失败.\r\n\r\n链接类型:" + dbClassName_mysql + 
			"\r\n链接位置:" + dbUrl+ "\r\n用户/密码"+ dbUser + "/" + dbPwd;
			System.err.println(message);
			logger.info(message);
		}
		return conn;
	}
	
	public ConnDB() {	
	}
	
	/**
	 * 功能：初始化数据库连接 connection 只初始化一次 其他的查询和更新操作都用这一个连接
	 */
	int k_sum = 0;
	public Connection  conn_pool = null;
	String name = "mysql_pool" ; 
	public void init() {
	}
 
/**
 * 功能:执行查询操作
 * 采用数据库连接池处理数据
 */
public ResultSet executeQuery(String sql) {
	try {
		conn = getConnection();
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs = stmt.executeQuery(sql);
	} catch (SQLException ex) {
		System.err.println(ex.getMessage());
	}
	return rs; 
}
/**
 * 功能:执行更新操作
 */
public int executeUpdate(String sql) {
	int result = 0;
	try {
		conn = getConnection();
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		result = stmt.executeUpdate(sql);
	} catch (SQLException ex) {
		result = 0;
	}
	return result;
}

/*
 * 功能:关闭数据库的连接
 */
public void close() {
	try {
		if (rs != null) {
			rs.close(); 
		}
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
}

public void closeDbPool() {
	try {
		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (conn_pool != null) {
			//conn_pool.close();
		}
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
}

	
	public static void main(String[] args) throws SQLException {
		ConnDB  conn =  new ConnDB();
		String sql = "SELECT * FROM tb_user ";
		String sql2 = "SELECT count(1) as count  FROM tb_user ";
		ResultSet rs = conn.executeQuery(sql);
		ResultSet rs2 = conn.executeQuery(sql2);
		try {
			while (rs.next()) {
			       //rs.last(); 游标游向结尾
			       int rowSum = rs.getRow();
			       //rs.first(); 游标游向开始
			       System.out.println("获取row的记录行："   + rs.getString("id")); 
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		try {
			rs.last();
			int rowCount = rs.getRow();
			System.out.println("总计结果：" + rowCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		while (rs2.next()) {
			int aa = rs2.getInt("count");
			System.out.println("count(1)=="+aa); 
		}
		
		conn.close();
	}

}
