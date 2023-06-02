<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

<html>
	<head>
		<title>お問い合わせシステム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>アカウント設定</h2>
		<div class="container">
			<form action="<%= request.getContextPath() %>/view/changePassword.jsp" method="post">
				<input class="send" type="submit" value="パスワード変更">
			</form>

			<form action="<%= request.getContextPath() %>/manageAdminList" method="post">
				<input class="send" type="submit" value="管理者アカウント管理">
			</form>
		</div>
	</body>
</html>