package com.eagleeyes.jdbc.db;

import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Test;

public class TestConnDB {

	@Test
	public void ConnDBtest() throws SQLException {
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
