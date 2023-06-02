<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

<%
String error = Converter.getParam((String)request.getAttribute("error"));
%>

<html>
	<head>
		<title>お問い合わせシステム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<h2>管理者ログイン</h2>
		<div class="container">
			<form action="<%= request.getContextPath() %>/login" method="post">
				<%
				if (!error.equals("")) {
				%>
				<div class="error">
					<h3><%= error %></h3>
				</div>
				<%
				}
				%>
				<div class="formItem">
					<p class="label">ID</p>
					<input type="text" name="adminid">
				</div>
				<div class="formItem">
					<p class="label">パスワード</p>
					<input type="password" name="password">
				</div>
				<input class="send" type="submit" value="ログイン">
			</form>
		</div>
	</body>
</html>