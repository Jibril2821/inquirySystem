package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import dao.*;
import util.Converter;
import util.SendMail;

public class LoginServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			String adminid = Converter.getParam(request.getParameter("adminid"));
			String password = Converter.getParam(request.getParameter("password"));

			if (adminid.equals("") || password.equals("")) {
				String error ="ID・パスワードを入力してください";
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/login.jsp").forward(request, response);
				return;
			}

			AdminDAO adminDao = new AdminDAO();
			Admin admin = adminDao.select(adminid, password);

			if (admin == null) {
				String error ="ID・パスワードが間違っています";
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/login.jsp").forward(request, response);
				return;
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);

				Cookie adminidCookie = new Cookie("adminid", adminid);
				Cookie passwordCookie = new Cookie("password", password);
				adminidCookie.setMaxAge(60 * 60 * 24 * 5);
				passwordCookie.setMaxAge(60 * 60 * 24 * 5);
				response.addCookie(adminidCookie);
				response.addCookie(passwordCookie);

				request.getRequestDispatcher("/list").forward(request, response);
			}

		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、ログイン出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
		}
	}
}
