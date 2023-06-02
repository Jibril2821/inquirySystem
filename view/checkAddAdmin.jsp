<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, java.util.regex.Pattern" %>

<%
Admin newAdmin = (Admin)request.getAttribute("newAdmin");
%>
<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>新規アカウント作成(確認)</h2>
		<div class="container">
			<form action="<%= request.getContextPath() %>/addAdmin" method="post">
				<div class="formItem">
					<p class="label">ID</p>
					<%= newAdmin.getAdminid() %><input type="hidden" name="adminid" value="<%= newAdmin.getAdminid() %>">
				</div>

				<div class="formItem">
					<p class="label">名前</p>
					<%= newAdmin.getName() %>
					<input type="hidden" name="name" value="<%= newAdmin.getName() %>">
				</div>

				<div class="formItem">
					<p class="label">パスワード</p>
					<%= newAdmin.getPassword() %>
					<input type="hidden" name="password" value="<%= newAdmin.getPassword() %>">
				</div>
				<input class="send" type="submit" value="作成">
				<input type="hidden" name="cmd" value="decide">
			</form>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>