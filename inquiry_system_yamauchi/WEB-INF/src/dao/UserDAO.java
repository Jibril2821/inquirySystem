package dao;

import java.sql.*;
import java.util.*;

import bean.*;

public class UserDAO {

	// データベース接続情報
	private static String RDB_DRIVE = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost/inquiry_formdb";
	private static String USER = "root";
	private static String PASS = "root123";

	private static Connection getConnection() {
		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			return con;
		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}

	public User selectByUserno (int userno) {
		Connection con = null;
		Statement smt = null;
		User user = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM userinfo WHERE userno =" + userno;
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				user = new User();
				user.setUserno(rs.getInt("userno"));
				user.setName(rs.getString("name"));
				user.setReadname(rs.getString("readname"));
				user.setAge(rs.getInt("age"));
				user.setGender(rs.getString("gender"));
				user.setMail(rs.getString("mail"));
				user.setTel(rs.getString("tel"));
				user.setAddcode(rs.getString("addcode"));
				user.setAddress(rs.getString("address"));
			}

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return user;
	}

	public User selectByUser(User searchUser) {
		Connection con = null;
		Statement smt = null;
		User user = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM userinfo WHERE name='" + searchUser.getName() + "' AND readname = '" + searchUser.getReadname() + "' AND age =" + searchUser.getAge() + " AND gender ='" + searchUser.getGender() + "' AND mail ='" + searchUser.getMail() + "' AND tel ='" + searchUser.getTel() + "' AND addcode ='" + searchUser.getAddcode() + "' AND address ='" + searchUser.getAddress() + "'";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				user = new User();
				user.setUserno(rs.getInt("userno"));
				user.setName(rs.getString("name"));
				user.setReadname(rs.getString("readname"));
				user.setAge(rs.getInt("age"));
				user.setGender(rs.getString("gender"));
				user.setMail(rs.getString("mail"));
				user.setTel(rs.getString("tel"));
				user.setAddcode(rs.getString("addcode"));
				user.setAddress(rs.getString("address"));
			}

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return user;
	}

	public void insert(User user) {
		Connection con = null;
		Statement smt = null;

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "INSERT INTO userinfo VALUES(NULL, '" + user.getName() + "','" + user.getReadname() + "'," + user.getAge() + ",'" + user.getGender() + "','" + user.getMail() + "','" + user.getTel() + "','" + user.getAddcode() + "','" + user.getAddress() + "')";
			System.out.println(sql);
			smt.executeUpdate(sql);

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
	}
}
