package com.zhang.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {

	/**
	 * 鑾峰緱鏁版嵁搴撶殑杩炴帴
	 * @return
	 */
	public Connection getConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// 2.鍒涘缓鏁版嵁搴撹繛鎺�
		// url:鏁版嵁搴撹繛鎺ュ崗璁�
		String url = "jdbc:mysql://202.201.38.27:3306/db_jwc?characterEncoding=utf8";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, "root", "root");
			//conn.setAutoCommit(false);// 琛ㄧず鍏抽棴浜嬪姟鑷姩鎻愪氦
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}