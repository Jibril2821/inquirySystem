<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, bean.*" %>

<%
User user = (User)request.getAttribute("user");
Inquiry inquiry = (Inquiry)request.getAttribute("inquiry");
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/userHeader.jsp" %>
		<h2>お問い合わせフォーム</h2>
		<ol class="timeline">
			<li class="prev">STEP1:お問い合わせ内容入力</li>
			<li class="prev">STEP2:入力内容確認</li>
			<li class="current">STEP3:送信完了</li>
		</ol>
		<div class="sent">
			<h3>送信完了</h3>
			<p>以下の内容でお問い合わせを受け付けました。</p>
			<p>受信完了メールが送信されますのでご確認ください。</p>
		</div>
		<div class="container">
			<div>
				<p class="label">■お客様情報</p>
			</div>

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

			<div>
				<p class="label">■お問い合わせ詳細</p>
			</div>

			<div class="formItem">
				<p class="label">お問い合わせ項目</p>
				<p class="label"><%= inquiry.getInquiryname() %></p>
			</div>

			<div class="formItem">
				<p class="label">お問い合わせ内容</p>
				<p class="label"><%= inquiry.getContents() %></p>
			</div>
			<h3>お問い合わせありがとうございました。</h3>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>