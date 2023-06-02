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

public class AddAdminServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			String adminid = Converter.getParam(request.getParameter("adminid"));
			String name = Converter.getParam(request.getParameter("name"));
			String password = Converter.getParam(request.getParameter("password"));
			String cmd = Converter.getParam(request.getParameter("cmd"));

			AdminDAO adminDao = new AdminDAO();

			if (cmd.equals("confirm")) {
				if (adminDao.isContain(adminid)) {
					String error="既に存在するIDです";
					request.setAttribute("error", error);
					request.getRequestDispatcher("/view/addAdminError.jsp").forward(request, response);
				}
				Admin admin = new Admin();
				admin.setAdminid(adminid);
				admin.setName(name);
				admin.setPassword(password);

				request.setAttribute("newAdmin", admin);
				request.getRequestDispatcher("/view/checkAddAdmin.jsp").forward(request, response);
			} else if (cmd.equals("decide")) {
				adminDao.add(adminid, name, password);
				request.getRequestDispatcher("/manageAdminList").forward(request, response);
			}
		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、パスワード変更出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseUserError.jsp").forward(request, response);
		}
	}
}
