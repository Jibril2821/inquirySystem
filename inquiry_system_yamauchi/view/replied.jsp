<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, bean.*" %>

<%
String replyComment = (String)request.getAttribute("reply_comment");
Inquiry inquiry = (Inquiry)request.getAttribute("inquiry");
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<div class="container">
			<div class="sent">
				<h3>返信完了</h3>
				<p>以下の内容でお問い合わせの返信を行いました。</p>
			</div>

			<div class="formItem">
				<p class="label">お問い合わせ項目</p>
				<p class="label"><%= inquiry.getInquiryname() %></p>
			</div>

			<div class="formItem">
				<p class="label">お問い合わせ内容</p>
				<p class="label"><%= inquiry.getContents() %></p>
			</div>

			<div class="formItem">
				<p class="label">返信内容</p>
				<p class="label"><%= replyComment %></p>
			</div>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>