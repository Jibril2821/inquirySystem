package dao;

import java.sql.*;
import java.util.*;

import bean.*;

public class InquiryDAO {

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

	public ArrayList<InquiryList> selectAll() {
		Connection con = null;
		Statement smt = null;
		ArrayList<InquiryList> inquiryList = new ArrayList<InquiryList>();

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT i.inquiryno, u.name, i.inquiryname, i.date, i.contents, i.reply, i.deleted FROM inquiryinfo i INNER JOIN userinfo u ON i.userno = u.userno ORDER BY i.inquiryno DESC";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				InquiryList inquiry = new InquiryList();
				inquiry.setInquiryno(rs.getInt("inquiryno"));
				inquiry.setName(rs.getString("name"));
				inquiry.setInquiryname(rs.getString("inquiryname"));
				inquiry.setDate(rs.getString("date"));
				inquiry.setContents(rs.getString("contents"));
				inquiry.setReply(rs.getString("reply"));
				inquiry.setDeleted(rs.getString("deleted"));
				inquiryList.add(inquiry);
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
		return inquiryList;
	}

	public ArrayList<InquiryList> search(String name, String inquiryname, String reply) {
		Connection con = null;
		Statement smt = null;
		ArrayList<InquiryList> inquiryList = new ArrayList<InquiryList>();

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT i.inquiryno, u.name, i.inquiryname, i.date, i.contents, i.reply, i.deleted FROM inquiryinfo i INNER JOIN userinfo u ON i.userno = u.userno WHERE name LIKE '%" + name + "%' AND inquiryname LIKE '%" + inquiryname + "%' AND reply LIKE '%" + reply + "%' ORDER BY i.inquiryno DESC";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				InquiryList inquiry = new InquiryList();
				inquiry.setInquiryno(rs.getInt("inquiryno"));
				inquiry.setName(rs.getString("name"));
				inquiry.setInquiryname(rs.getString("inquiryname"));
				inquiry.setDate(rs.getString("date"));
				inquiry.setContents(rs.getString("contents"));
				inquiry.setReply(rs.getString("reply"));
				inquiry.setDeleted(rs.getString("deleted"));
				inquiryList.add(inquiry);
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
		return inquiryList;
	}

	public Inquiry selectByInquiryno(int inquiryno) {
		Connection con = null;
		Statement smt = null;
		Inquiry inquiry = null;

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM inquiryinfo WHERE inquiryno =" + inquiryno;
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				inquiry = new Inquiry();
				inquiry.setInquiryno(rs.getInt("inquiryno"));
				inquiry.setInquiryname(rs.getString("inquiryname"));
				inquiry.setContents(rs.getString("contents"));
				inquiry.setDate(rs.getString("date"));
				inquiry.setReply(rs.getString("reply"));
				inquiry.setReplyComment(rs.getString("replyComment"));
				inquiry.setUserno(rs.getInt("userno"));
				inquiry.setDeleted(rs.getString("deleted"));
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
		return inquiry;
	}

	public Inquiry selectByInquiry (Inquiry inquiry) {
		Connection con = null;
		Statement smt = null;
		Inquiry selectInquiry = new Inquiry();

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM inquiryinfo WHERE inquiryname ='" + inquiry.getInquiryname() + "' AND contents ='" + inquiry.getContents() + "'";
			System.out.println(sql);
			ResultSet rs = smt.executeQuery(sql);

			if (rs.next()) {
				selectInquiry.setInquiryno(rs.getInt("inquiryno"));
				selectInquiry.setInquiryname(rs.getString("inquiryname"));
				selectInquiry.setContents(rs.getString("contents"));
				selectInquiry.setDate(rs.getString("date"));
				selectInquiry.setReply(rs.getString("reply"));
				selectInquiry.setUserno(rs.getInt("userno"));
				selectInquiry.setDeleted(rs.getString("deleted"));
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
		return selectInquiry;
	}

	public void insert(Inquiry inquiry) {
		Connection con = null;
		Statement smt = null;

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "INSERT INTO inquiryinfo VALUES(NULL, '" + inquiry.getInquiryname() + "','" + inquiry.getContents() + "', CURDATE(), '0', '', " + inquiry.getUserno() + ", '0')";
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

	public void reply(String inquiryno, String replyComment) {
		Connection con = null;
		Statement smt = null;

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "UPDATE inquiryinfo SET reply='1', replyComment ='" + replyComment + "' WHERE inquiryno =" + inquiryno;
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

	public void deleteFromList(String inquiryno) {
		Connection con = null;
		Statement smt = null;

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "UPDATE inquiryinfo SET deleted = '1' WHERE inquiryno =" + inquiryno;
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

	public void delete(String inquiryno) {
		Connection con = null;
		Statement smt = null;

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "DELETE FROM inquiryinfo WHERE inquiryno = " + inquiryno;
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
