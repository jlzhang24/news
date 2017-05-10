package com.zhang.dao;

import java.sql.Connection;
import java.sql.SQLException;

import java.sql.*;
import com.zhang.util.DBHelper;

public class UserDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**
	 * 判断用户是否存在
	 * @param username
	 * @param password
	 * @return
	 */
	public int userIsExist(String username, String password) {
		int flag = 0;
		conn = new DBHelper().getConnection();
		String sql = "select user_password from tb_user where user_name=? and user_password=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
