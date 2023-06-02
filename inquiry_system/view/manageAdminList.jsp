<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.*, util.*, java.util.*" %>

<%
ArrayList<Admin> adminList = (ArrayList<Admin>)request.getAttribute("admin_list");
%>

<html>
	<head>
		<title>お問い合わせシステム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>管理者アカウント一覧</h2>
		<button class="send" onClick="location.href='<%= request.getContextPath() %>/view/addAdmin.jsp'">新規アカウント作成</button>
		<table class="list">
			<tr>
				<th class="admin" width="100">ID</th>
				<th class="admin" width="150">名前</th>
				<th class="admin" width="100"></th>
			</tr>
			<%
			if (adminList != null) {
				for (Admin selectAdmin : adminList) {
			%>
			<tr>
				<td class="admin"><%= selectAdmin.getAdminid() %></td>
				<td class="admin"><%= selectAdmin.getName() %></td>
				<td class="admin" bgcolor="yellow"><a class="delete controll" href="<%= request.getContextPath() %>/deleteAdmin?adminid=<%= selectAdmin.getAdminid() %>&cmd=confirm">削除</a></td>
			</tr>
			<%
				}
			}
			%>
		</table>
		<%@include file="/common/footer.jsp" %>
	</body>
</html>