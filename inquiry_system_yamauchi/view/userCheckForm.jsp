<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, java.util.regex.Pattern" %>

<%
request.setCharacterEncoding("utf-8");
String name = Converter.getParam(request.getParameter("name"));
String readname = Converter.getParam(request.getParameter("readname"));
String age = Converter.getParam(request.getParameter("age"));
String sex = Converter.getParam(request.getParameter("sex"));
String email = Converter.getParam(request.getParameter("email"));
String tel1st = Converter.getParam(request.getParameter("tel1st"));
String tel2nd = Converter.getParam(request.getParameter("tel2nd"));
String tel3rd = Converter.getParam(request.getParameter("tel3rd"));
String addcode1st = Converter.getParam(request.getParameter("addcode1st"));
String addcode2nd = Converter.getParam(request.getParameter("addcode2nd"));
String pref = Converter.getParam(request.getParameter("pref"));
String city = Converter.getParam(request.getParameter("city"));
String other = Converter.getParam(request.getParameter("other"));
String contenttype = Converter.getParam(request.getParameter("contenttype"));
String content = Converter.getParam(request.getParameter("content"));
String consent = Converter.getParam(request.getParameter("consent"));

try {
	int intAge = Integer.parseInt(age);
	if (intAge <= 0) {
		throw new NumberFormatException();
	}
} catch (NumberFormatException e) {
	String error = "年齢の数値が不正です";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
	return;
}

try {
	Integer.parseInt(tel1st);
	Integer.parseInt(tel2nd);
	Integer.parseInt(tel3rd);
} catch (NumberFormatException e) {
	String error = "電話番号の数値が不正です";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
	return;
}

try {
	Integer.parseInt(addcode1st);
	Integer.parseInt(addcode2nd);
} catch (NumberFormatException e) {
	String error = "郵便番号の数値が不正です";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
	return;
}

String patternEmail = "^([a-zA-Z0-9])+([a-zA-Z0-9\\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\\._-]+)+$";
Pattern pEmail = Pattern.compile(patternEmail);
if (!pEmail.matcher(email).find()) {
	String error = "メールアドレスがが不正です";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
	return;
}

String patternHiragana = "^[\u3040-\u309F]+$";
Pattern pHiragana = Pattern.compile(patternHiragana);
if (!pHiragana.matcher(readname).matches()) {
	String error ="「ふりがな」が「ひらがな」ではありません";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
	return;
}

if (consent.equals("disagree")) {
	String error ="個人情報の取り扱いについて同意してください";
	request.setAttribute("error", error);
	request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
	return;
}
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/userHeader.jsp" %>
		<h2>お問い合わせフォーム</h2>
		<div class="container">
			<ol class="timeline">
				<li class="prev">STEP1:お問い合わせ内容入力</li>
				<li class="current">STEP2:入力内容確認</li>
				<li>STEP3:送信完了</li>
			</ol>
			<form method="post">
				<h3>送信内容確認</h3>
				<div>
					<p class="label">■お客様情報</p>
				</div>

				<div class="formItem">
					<p class="label">氏名</p>
					<p class="label"><%= name %></p><input type="hidden" name="name" value="<%= name %>" required>
				</div>

				<div class="formItem">
					<p class="label">ふりがな</p>
					<p class="label"><%= readname %></p><input type="hidden" name="readname" value="<%= readname %>" required>
				</div>

				<div class="formItem">
					<p class="label">年齢</p>
					<p class="label"><%= age %></p><input type="hidden" name="age" value="<%= age %>" required>
				</div>

				<div class="formItem">
					<p class="label">性別</p>
					<p class="label"><%= sex %></p><input type="hidden" name="sex" value="<%= sex %>" required>
				</div>

				<div class="formItem">
					<p class="label">メールアドレス</p>
					<p class="label"><%= email %></p><input type="hidden" name="email" value="<%= email %>" required>
				</div>

				<div class="formItem">
					<p class="label">電話番号</p>
					<p class="label"><%= tel1st %>&nbsp;-&nbsp;<%= tel2nd %>&nbsp;-&nbsp;<%= tel3rd %></p>
					<input type="hidden" name="tel1st" value="<%= tel1st %>">
					<input type="hidden" name="tel2nd" value="<%= tel2nd %>">
					<input type="hidden" name="tel3rd" value="<%= tel3rd %>">
				</div>

				<div>
					<p class="label">■住所</p>
				</div>

				<div class="formItem">
					<p class="label">郵便番号</p>
					<p class="label"><%= addcode1st %>&nbsp;-&nbsp;<%= addcode2nd %></p>
					<input type="hidden" name="addcode1st" value="<%= addcode1st %>">
					<input type="hidden" name="addcode2nd" value="<%= addcode2nd %>">
				</div>

				<div class="formItem">
					<p class="label">都道府県</p>
					<p class="label"><%= pref %></p><input type="hidden" name="pref" value="<%= pref %>" required>
				</div>

				<div class="formItem">
					<p class="label">市区町村</p>
					<p class="label"><%= city %></p><input type="hidden" name="city" value="<%= city %>" required>
				</div>

				<div class="formItem">
					<p class="label">以降の住所</p>
					<p class="label"><%= other %></p><input type="hidden" name="other" value="<%= other %>" required>
				</div>

				<div>
					<p class="label">■お問い合わせ詳細</p>
				</div>

				<div class="formItem">
					<p class="label">お問い合わせ項目</p>
					<p class="label"><%= contenttype %></p><input type="hidden" name="contenttype" value="<%= contenttype %>" required>
				</div>

				<div class="formItem">
					<p class="label">お問い合わせ内容</p>
					<p class="label"><%= content %></p><input type="hidden" name="content" value="<%= content %>" required>
				</div>

				<div>
					<input class="send" type="submit" value="送信" formaction="<%= request.getContextPath() %>/userSend">
					<input class="send" type="submit" value="戻る" formaction="<%= request.getContextPath() %>/view/userInputForm.jsp">
				</div>
			</form>
			<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>