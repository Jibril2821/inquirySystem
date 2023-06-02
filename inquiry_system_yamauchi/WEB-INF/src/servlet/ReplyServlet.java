package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import dao.*;
import util.*;

public class ReplyServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {

			String inquiryno = request.getParameter("inquiryno");
			String replyComment = request.getParameter("replycomment");
			InquiryDAO inquiryDao = new InquiryDAO();

			inquiryDao.reply(inquiryno, replyComment);

			UserDAO userDao = new UserDAO();
			HttpSession session = request.getSession();
			Admin admin = (Admin)session.getAttribute("admin");
			if (admin == null) {
				String error ="セッション切れです";
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}

			Inquiry inquiry = inquiryDao.selectByInquiryno(Integer.parseInt(inquiryno));
			User user = userDao.selectByUserno(inquiry.getUserno());
			SendMail sendMail = new SendMail();
			String message = user.getName() + "様\nお問い合わせありがとうございます。\n"
					+ "株式会社fusion one お客様サポート担当の" + admin.getName() + "と申します。\n"
					+ "「" + inquiry.getInquiryname() + "」に関するご質問に関してご返答させていただきます。\n"
					+ "お問い合わせ内容：\n" + inquiry.getContents() + "\n\n"
					+ replyComment + "\n\n"
					+ "ご不明点がございましたら再度お問い合わせフォームよりご質問頂きますようよろしくお願いします。";

			sendMail.send(message, user.getMail());

			request.setAttribute("reply_comment", replyComment);
			request.setAttribute("inquiry", inquiry);

			request.getRequestDispatcher("/view/replied.jsp").forward(request, response);

		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、返信できませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
		}
	}
}
