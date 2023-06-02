package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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

public class ListServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			InquiryDAO inquiryDao = new InquiryDAO();
			ArrayList<InquiryList> inquiryList = inquiryDao.selectAll();

			request.setAttribute("inquiry_list", inquiryList);
			request.getRequestDispatcher("/view/list.jsp").forward(request, response);
		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、お問い合わせ一覧を表示出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
		}
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}
