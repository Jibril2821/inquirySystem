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

public class DeleteServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			InquiryDAO inquiryDao = new InquiryDAO();

			String inquiryno = request.getParameter("inquiryno");
			inquiryDao.delete(inquiryno);

			ArrayList<InquiryList> inquiryList = inquiryDao.selectAll();

			request.setAttribute("inquiry_list", inquiryList);
			request.getRequestDispatcher("/view/historyList.jsp").forward(request, response);
		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、一覧から該当のお問い合わせを削除出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
		}
	}
}
