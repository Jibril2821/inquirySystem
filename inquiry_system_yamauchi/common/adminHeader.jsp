<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.*" %>
<%
Admin admin = (Admin)session.getAttribute("admin");
if (admin == null) {
	String error ="セッション切れです";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/databaseAdminError.jsp").forward(request, response);
	return;
}
%>

<ul class="menu admin">
	<li><div><a href="<%= request.getContextPath() %>/list"><i class="fa-solid fa-house" style="color: #5bc8ac;"></i><br>新着</a></div>
	<li><div><a href="<%= request.getContextPath() %>/historyList"><i class="fa-solid fa-clock" style="color: #5bc8ac;"></i><br>履歴</a></div>
	<li><div><a href="<%= request.getContextPath() %>/view/accountSetting.jsp"><i class="fa-solid fa-gear" style="color: #5bc8ac;"></i><br>設定</a>
	<li><div><p><b>【ユーザー】<br><%= admin.getName() %></b></p></div>
	<li><div><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket" style="color: #5bc8ac;"></i><br>ログアウト</a></div>
</ul>
<h1>お問い合わせシステム</h1>

