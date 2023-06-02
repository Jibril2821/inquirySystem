<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, bean.*" %>

<%
request.setCharacterEncoding("UTF-8");
String contents = Converter.getParam(request.getParameter("contents"));
String replycomment = Converter.getParam(request.getParameter("replycomment"));
String inquiryno = Converter.getParam(request.getParameter("inquiryno"));

if (replycomment.equals("")) {
	request.setAttribute("message", "返信内容を入力してください");
	request.getRequestDispatcher("/detail").forward(request, response);
}
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<div class="container">
			<h2>返信内容確認</h2>

			<div class="formItem">
				<p class="label">お問い合わせ内容</p>
				<p class="label"><%= contents %></p>
			</div>

			<div class="formItem">
				<p class="label">返信内容</p>
				<p class="label"><%= replycomment %></p>
			</div>
			<h2>以上の内容で返信致しますか？</h2>
			<form action="" method="post">
				<input class="send" type="submit" value="修正" formaction="<%= request.getContextPath() %>/detail">
				<input class="send" type="submit" value="返信" formaction="<%= request.getContextPath() %>/reply">
				<input type="hidden" name="inquiryno" value="<%= inquiryno %>">
				<input type="hidden" name="replycomment" value="<%= replycomment %>">
			</form>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>