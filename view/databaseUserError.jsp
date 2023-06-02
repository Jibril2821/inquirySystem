<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

<%
String error = (String)request.getAttribute("error");
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<h2>お問い合わせフォーム</h2>
		<div class="error">
			<h3>エラー</h3>
			<p><%= error %></p>
		</div>
		<div>
			<button onClick="location.href='<%= request.getContextPath() %>/view/userInputForm.jsp'">入力フォームへ</button>
		</div>
	</body>
</html>