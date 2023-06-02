package dao;

import java.sql.*;
import java.util.*;

import bean.*;

public class AdminDAO {

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

	public ArrayList<Admin> selectAll() {
		Connection con = null;
		Statement smt = null;
		ArrayList<Admin> adminList = new ArrayList<Admin>();
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM admininfo";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				Admin admin = new Admin();
				admin.setAdminid(rs.getString("adminid"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));
				adminList.add(admin);
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
		return adminList;
	}

	public Admin select(String adminid, String password) {
		Connection con = null;
		Statement smt = null;
		Admin admin = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM admininfo WHERE adminid='" + adminid + "' AND password = '" + password + "'";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				admin = new Admin();
				admin.setAdminid(rs.getString("adminid"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));
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
		return admin;
	}

	public Admin selectById(String adminid) {
		Connection con = null;
		Statement smt = null;
		Admin admin = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM admininfo WHERE adminid='" + adminid + "'";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				admin = new Admin();
				admin.setAdminid(rs.getString("adminid"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));
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
		return admin;
	}

	public boolean isContain(String adminid) {
		Connection con = null;
		Statement smt = null;
		Admin admin = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM admininfo WHERE adminid='" + adminid + "'";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				admin = new Admin();
				admin.setAdminid(rs.getString("adminid"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));
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

		if (admin == null) {
			return false;
		} else {
			return true;
		}
	}

	public void changePassword(String adminid, String password) {
		Connection con = null;
		Statement smt = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "UPDATE admininfo SET password = '" + password + "' WHERE adminid = '" + adminid + "'";
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

	public void add(String adminid, String name, String password) {
		Connection con = null;
		Statement smt = null;
		Admin admin = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "INSERT INTO admininfo VALUES('" + adminid + "','" + password + "','" + name + "')";
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

	public void delete(String adminid) {
		Connection con = null;
		Statement smt = null;
		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "DELETE FROM admininfo WHERE adminid = '" + adminid + "'";
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
