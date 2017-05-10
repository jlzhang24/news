package com.zhang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zhang.model.JWXX;
import com.zhang.model.TYPE;
import com.zhang.util.DBHelper;

public class TYPEDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**
	 * 添加类型
	 * @param type
	 */
	public int insertType(TYPE type)
	{
		int	temp = 0;
		String sql = "insert into tb_type(type_bh,type_name) values (?,?)";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type.getType_bh());
			pstmt.setString(2, type.getType_name());
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
	 * 获取所有类型的记录数
	 * @return
	 */
	public int getAllTypeCount() {
		int num = 0;
		String sql = "select count(*) from tb_type";
		conn = new DBHelper().getConnection();
		try
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				num = rs.getInt(1);
			}
		}catch(SQLException ex)
		{
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
	 * 根据id获取类型信息
	 * @param id
	 * @return
	 */
	public TYPE getTypeById(int id)
	{
		TYPE type = new TYPE();
		ResultSet rs = null;
		String sql = "select * from tb_type where type_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				type.setType_id(rs.getInt("type_id"));
				type.setType_bh(rs.getString("type_bh"));
				type.setType_name(rs.getString("type_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return type;
	}
	
	
	/**
	 * 修改类型信息
	 * @param type
	 * @param id
	 * @return
	 */
	public int updateTYPE(TYPE type, int id)
	{
		int temp = 0;
		String sql = "update tb_type set type_bh=?,type_name=? where type_id=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type.getType_bh());
			pstmt.setString(2, type.getType_name());
			pstmt.setInt(3, id);
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
	 * 根据类型信息id删除记录
	 * @param id
	 * @return
	 */
	public int deleteTYPEById(int id)
	{
		int temp = 0;
		String sql = "delete from tb_type where type_id=?";
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
	 * 根据id获取类型的名称
	 * @param id
	 * @return
	 */
	public String getTypeName(String id) {
		String name = null;
		String sql = "select type_name from tb_type where type_bh=?";
		conn = new DBHelper().getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString("type_name");
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
		return name;
	}
}
