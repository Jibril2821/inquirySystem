<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

<html>
	<head>
		<title>お問い合わせシステム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>パスワード変更</h2>
		<div class="container">
			<form action="<%= request.getContextPath() %>/changePassword" method="post">
				<div class="formItem">
					<p class="label">ID</p>
					<input type="text" name="adminid" value="<%= admin.getAdminid() %>" readonly>
				</div>

				<div class="formItem">
					<p class="label">変更前パスワード</p>
					<input type="text" name="beforePassword" required>
				</div>

				<div class="formItem">
					<p class="label">変更後パスワード</p>
					<input type="text" name="afterPassword" required>
				</div>

				<div class="formItem">
					<p class="label">変更後パスワード</p>
					<input type="text" name="re_afterPassword" required>
				</div>

				<input class="send" type="submit" value="変更する">
				<input type="hidden" name="cmd" value="confirm">
			</form>
		</div>
	</body>
</html>