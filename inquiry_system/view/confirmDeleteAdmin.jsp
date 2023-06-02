<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, java.util.regex.Pattern" %>

<%
Admin deleteAdmin = (Admin)request.getAttribute("deleteAdmin");
%>
<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>アカウントの削除(確認)</h2>
		<div class="container">
			<form action="<%= request.getContextPath() %>/deleteAdmin" method="post">
				<div class="formItem">
					<p class="label">ID</p>
					<%= deleteAdmin.getAdminid() %><input type="hidden" name="adminid" value="<%= deleteAdmin.getAdminid() %>">
				</div>

				<div class="formItem">
					<p class="label">名前</p>
					<%= deleteAdmin.getName() %>
				</div>
				<h3><font color="red">削除しますか？</font></h3>
				<input class="send" type="submit" value="削除する">
				<input type="hidden" name="cmd" value="decide">
			</form>
			<form action="<%= request.getContextPath() %>/manageAdminList">
				<input class="send" type="submit" value="戻る">
			</form>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>