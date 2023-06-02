package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;
import dao.*;
import util.Converter;

public class DetailServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {

			String inquiryno = request.getParameter("inquiryno");
			String replycomment = Converter.getParam(request.getParameter("replycomment"));

			InquiryDAO inquiryDao = new InquiryDAO();
			Inquiry inquiry = new Inquiry();
			UserDAO userDao = new UserDAO();
			User user = new User();

			inquiry = inquiryDao.selectByInquiryno(Integer.parseInt(inquiryno));
			user = userDao.selectByUserno(inquiry.getUserno());

			request.setAttribute("inquiry", inquiry);
			request.setAttribute("user", user);
			request.setAttribute("replycomment", replycomment);

			request.getRequestDispatcher("/view/detail.jsp").forward(request, response);
		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、お問い合わせ詳細を表示出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}
