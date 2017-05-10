package com.zhang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zhang.model.JWXX;
import com.zhang.util.DBHelper;

public class JWXXDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	/**
	 * 获取特定类型教务信息的记录数
	 * 
	 * @return
	 */
	public int getJwxxCount(String type) {
		int num = 0;
		String sql = "select count(*) from tb_jwxx where jwxx_type=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	/**
	 * 获取所有教务信息的记录数
	 * 
	 * @return
	 */
	public int getAllJwxxCount() {
		int num = 0;
		String sql = "select count(*) from tb_jwxx";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	/**
	 * 添加教务信息
	 * 
	 * @return
	 */
	public int addJwxx(JWXX jwxx, String type) {
		int temp = 0;
		String sql = "insert into tb_jwxx(jwxx_title,jwxx_author,jwxx_date,jwxx_content,jwxx_attachment,jwxx_type) values(?,?,?,?,?,?)";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jwxx.getJwxx_title());
			pstmt.setString(2, jwxx.getJwxx_author());
			pstmt.setString(3, jwxx.getJwxx_date());
			pstmt.setString(4, jwxx.getJwxx_content());
			pstmt.setString(5, jwxx.getJwxx_attachment());
			pstmt.setString(6, type);
			temp = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	/**
	 * 根据id获取教务信息
	 * 
	 * @param id
	 * @return
	 */
	public JWXX getJwxxById(int id) {
		JWXX jwxx = new JWXX();
		String sql = "select * from tb_jwxx where jwxx_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				jwxx.setJwxx_id(rs.getInt("jwxx_id"));
				jwxx.setJwxx_author(rs.getString("jwxx_author"));
				jwxx.setJwxx_date(rs.getString("jwxx_date"));
				jwxx.setJwxx_title(rs.getString("jwxx_title"));
				jwxx.setJwxx_content(rs.getString("jwxx_content"));
				jwxx.setJwxx_attachment(rs.getString("jwxx_attachment"));
				jwxx.setJwxx_type(rs.getString("jwxx_type"));
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
		return jwxx;
	}

	/**
	 * 获取所有的教务信息
	 * 
	 * @return
	 */
	public ResultSet getAllJwxx() {
		String sql = "select * from tb_jwxx order by jwxx_date desc";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 根据类型获取所有的教务信息，用于首页显示记录条数
	 * 
	 * @return
	 */
	public ResultSet getAllJwxx(String type, int num) {
		String sql = "select * from tb_jwxx where jwxx_type=? order by jwxx_date desc limit ?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 根据类型获取所有的教务信息
	 * 
	 * @return
	 */
	public ResultSet getAllJwxx(String type) {
		String sql = "select * from tb_jwxx where jwxx_type=? order by jwxx_date desc";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 获取分页显示的教务信息
	 * 
	 * @return
	 */
	public ResultSet getJwxx() {
		String sql = "select * from tb_jwxx order by jwxx_date desc limit 7";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 根据教务信息id删除记录
	 * 
	 * @param id
	 * @return
	 */
	public int deleteJWXXById(int id) {
		int temp = 0;
		String sql = "delete from tb_jwxx where jwxx_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			temp = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	/**
	 * �޸Ľ��񹫸�
	 * 
	 * @param jwgg
	 * @param id
	 * @return
	 */
	public int updateJWXX(JWXX jwxx, int id) {
		int temp = 0;
		String sql = "update tb_jwxx set jwxx_author=?,jwxx_title=?,jwxx_type=?,jwxx_date=?,jwxx_content=?,jwxx_attachment=? where jwxx_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jwxx.getJwxx_author());
			pstmt.setString(2, jwxx.getJwxx_title());
			pstmt.setString(3, jwxx.getJwxx_type());
			pstmt.setString(4, jwxx.getJwxx_date());
			pstmt.setString(5, jwxx.getJwxx_content());
			pstmt.setString(6, jwxx.getJwxx_attachment());
			pstmt.setInt(7, id);
			temp = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	/**
	 * 根据教务id得出该篇文章的点击量
	 * 
	 * @param id
	 * @return
	 */
	public int getHitCount(int id) {
		int hitcount = 0;
		String sql = "select jwxx_hitcount from tb_jwxx where jwxx_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				hitcount = rs.getInt("jwxx_hitcount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hitcount;
	}
	
	/**
	 * 更新id的文章的访问量
	 * @param id
	 */
	public void updateHitCount(int id, int hitcount) {
		String sql = "update tb_jwxx set jwxx_hitcount = ? where jwxx_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hitcount);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
