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

public class ChangePasswordServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			UserDAO userDao = new UserDAO();
			User user = new User();

			String adminid = Converter.getParam(request.getParameter("adminid"));
			String beforePassword = Converter.getParam(request.getParameter("beforePassword"));
			String afterPassword = Converter.getParam(request.getParameter("afterPassword"));
			String re_afterPassword = Converter.getParam(request.getParameter("re_afterPassword"));
			String cmd = Converter.getParam(request.getParameter("cmd"));

			HttpSession session = request.getSession();
			Admin admin = (Admin)session.getAttribute("admin");

			AdminDAO adminDao = new AdminDAO();

			if (cmd.equals("confirm")) {
				if (admin == null) {
					String error ="セッション切れです";
					request.setAttribute("error", error);
					request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
					return;
				}

				if (!admin.getAdminid().equals(adminid)) {
					String error ="ログインしているアカウントと異なるアカウントのパスワードを変更しようとしています";
					request.setAttribute("error", error);
					request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
					return;
				}

				if (!admin.getPassword().equals(beforePassword)) {
					String error ="現在のパスワードが正しくありません";
					request.setAttribute("error", error);
					request.getRequestDispatcher("/view/adminError.jsp").forward(request, response);
					return;
				}

				if (!afterPassword.equals(re_afterPassword)) {
					String error ="新しいパスワードを正しく入力してください";
					request.setAttribute("error", error);
					request.getRequestDispatcher("/view/adminError.jsp").forward(request, response);
					return;
				}

				adminDao.changePassword(adminid, afterPassword);
				request.getRequestDispatcher("/view/changed.jsp").forward(request, response);
			}
		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、パスワード変更出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseUserError.jsp").forward(request, response);
		}
	}
}
