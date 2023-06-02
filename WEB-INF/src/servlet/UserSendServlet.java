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
import util.SendMail;

public class UserSendServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			UserDAO userDao = new UserDAO();
			User user = new User();
			InquiryDAO inquiryDao = new InquiryDAO();
			Inquiry inquiry = new Inquiry();

			String name = request.getParameter("name");
			String readname = request.getParameter("readname");
			String age = request.getParameter("age");
			String sex = request.getParameter("sex");
			String email = request.getParameter("email");
			String tel1st = request.getParameter("tel1st");
			String tel2nd = request.getParameter("tel2nd");
			String tel3rd = request.getParameter("tel3rd");
			String addcode1st = request.getParameter("addcode1st");
			String addcode2nd = request.getParameter("addcode2nd");
			String pref = request.getParameter("pref");
			String city = request.getParameter("city");
			String other = request.getParameter("other");
			String contenttype = request.getParameter("contenttype");
			String content = request.getParameter("content");

			user.setName(name);
			user.setReadname(readname);
			user.setAge(Integer.parseInt(age));
			user.setGender(sex);
			user.setMail(email);
			user.setTel(tel1st + "-" + tel2nd + "-" + tel3rd);
			user.setAddcode(addcode1st + "-" + addcode2nd);
			user.setAddress(pref + city + other);

			int userno = 0;
			if (userDao.selectByUser(user) == null) {
				userDao.insert(user);
				userno = userDao.selectByUser(user).getUserno();
			} else {
				userno = userDao.selectByUser(user).getUserno();
			}

			inquiry.setInquiryname(contenttype);
			inquiry.setContents(content);
			inquiry.setUserno(userno);
			inquiryDao.insert(inquiry);

			int inquiryno = inquiryDao.selectByInquiry(inquiry).getInquiryno();

			SendMail sendMail = new SendMail();
			String message = user.getName() + "様\nお問い合わせありがとうございます。\n"
					+ "下記の内容で問い合わせを受け付けました。\n"
					+ "\n-----------------------------------------------------------------"
					+ "\nお問い合わせ番号：" + inquiryno + "番"
					+ "\n\nお問い合わせ項目：" + inquiry.getInquiryname()
					+ "\n\nお問い合わせ内容：" + inquiry.getContents()
					+ "\n-----------------------------------------------------------------"
					+ "\n\n後日担当者からご連絡いたしますので少々お待ちください。"
					+ "\n\n※このメールは送信専用です。"
					+ "\n\n神田英会話スクール\n代表 〇〇";

			sendMail.send(message, user.getMail());

			request.setAttribute("user", user);
			request.setAttribute("inquiry", inquiry);

			request.getRequestDispatcher("/view/userSendForm.jsp").forward(request, response);

		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、お問い合わせを送信出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseUserError.jsp").forward(request, response);
		}
	}
}
