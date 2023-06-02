<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, bean.*" %>

<%
User user = (User)request.getAttribute("user");
Inquiry inquiry = (Inquiry)request.getAttribute("inquiry");
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/userHeader.jsp" %>
		<h2>パスワード変更</h2>
		<div class="sent">
			<h3>変更しました</h3>
		</div>

		<form action="<%= request.getContextPath() %>/list" method="post">
			<input class="send" type="submit" value="戻る">
		</form>

	</body>
</html>