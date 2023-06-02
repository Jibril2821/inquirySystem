<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, java.util.regex.Pattern" %>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>新規アカウント作成</h2>
		<div class="container">
			<form action="<%= request.getContextPath() %>/addAdmin" method="post">
				<div class="formItem">
					<p class="label">ID</p>
					<input type="text" name="adminid" required>
				</div>

				<div class="formItem">
					<p class="label">名前</p>
					<input type="text" name="name" required>
				</div>

				<div class="formItem">
					<p class="label">パスワード</p>
					<input type="text" name="password" required>
				</div>
				<input class="send" type="submit" value="確認">
				<input type="hidden" name="cmd" value="confirm">
			</form>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>