<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, bean.*" %>

<%
User user = (User)request.getAttribute("user");
Inquiry inquiry = (Inquiry)request.getAttribute("inquiry");
String replycomment = (String)request.getAttribute("replycomment");
String message = Converter.getParam((String)request.getAttribute("message"));
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<div class="container">
			<h2>お問い合わせ詳細画面</h2>
			<h3>ユーザー情報</h3>

			<div class="formItem">
				<p class="label">氏名</p>
				<p class="label"><%= user.getName() %></p>
			</div>

			<div class="formItem">
				<p class="label">ふりがな</p>
				<p class="label"><%= user.getReadname() %></p>
			</div>

			<div class="formItem">
				<p class="label">年齢</p>
				<p class="label"><%= user.getAge() %></p>
			</div>

			<div class="formItem">
				<p class="label">性別</p>
				<p class="label"><%= user.getGender() %></p>
			</div>

			<div class="formItem">
				<p class="label">メールアドレス</p>
				<p class="label"><%= user.getMail() %></p>
			</div>

			<div class="formItem">
				<p class="label">電話番号</p>
				<p class="label"><%= user.getTel() %></p>
			</div>

			<div class="formItem">
				<p class="label">住所</p>
				<p class="label"><%= user.getAddress() %></p>
			</div>
			<div class="formItem">
			</div>

			<h3>お問い合わせ内容</h3>
			<div class="formItem">
			</div>
			<p><%= inquiry.getContents() %></p>
			<p><%= inquiry.getDate() %></p>
			<br>
			<%
			if (inquiry.getReply().equals("0")) {
			%>
			<h3>返信記入欄</h3>
			<h4><font color="red"><%= message %></font></h4>
			<form action="<%=request.getContextPath() %>/view/replyCheck.jsp" method="post">
				<div class="formItem">
					<textarea class="reply" name="replycomment" rows="15" cols="100"><%= replycomment %></textarea>
				</div>
				<div>
					<input class="send" type="submit" value="返信確認画面へ">
					<input class="send" type="submit" value="戻る" formaction="<%= request.getContextPath() %>/list">
					<input type="hidden" name="contents" value="<%= inquiry.getContents() %>">
					<input type="hidden" name="inquiryno" value="<%= inquiry.getInquiryno() %>">
				</div>
			</form>
			<%
			} else if (inquiry.getReply().equals("1")) {
			%>
			<h3>返信内容</h3>
			<div class="formItem">
			</div>
			<p><%= inquiry.getReplyComment() %></p>
			<div>
				<form>
					<input class="send" type="submit" value="戻る" formaction="<%= request.getContextPath() %>/list">
				</form>
			</div>

			<%
			}
			%>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>