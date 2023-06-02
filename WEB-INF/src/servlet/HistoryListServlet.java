package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;
import dao.*;
import util.Converter;

public class HistoryListServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			String cmd = Converter.getParam(request.getParameter("cmd"));
			String contenttype = Converter.getParam(request.getParameter("contenttype"));
			String reply = Converter.getParam(request.getParameter("reply"));
			String name = Converter.getParam(request.getParameter("name"));

			InquiryDAO inquiryDao = new InquiryDAO();
			ArrayList<InquiryList> inquiryList = new ArrayList<InquiryList>();

			if (cmd.equals("search")) {
				inquiryList = inquiryDao.search(name, contenttype, reply);
			} else {
				inquiryList = inquiryDao.selectAll();
			}

			request.setAttribute("contenttype", contenttype);
			request.setAttribute("reply", reply);
			request.setAttribute("inquiry_list", inquiryList);
			request.setAttribute("name", name);
			request.getRequestDispatcher("/view/historyList.jsp").forward(request, response);
		} catch (IllegalStateException e) {
			String error ="";
			error = "DB接続エラーの為、履歴を表示出来ませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}
