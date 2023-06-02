<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

<%
request.setCharacterEncoding("utf-8");
String error = (String)request.getAttribute("error");
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
%>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/userHeader.jsp" %>
		<div class="error">
			<h3>エラー</h3>
			<p><%= error %></p>
		</div>
		<form action="<%= request.getContextPath() %>/view/userInputForm.jsp" method="post">
			<input type="hidden" name="name" value="<%= name %>">
			<input type="hidden" name="readname" value="<%= readname %>">

			<input type="hidden" name="age" value="<%= age %>">

			<input type="hidden" name="sex" value="<%= sex %>">
			<input type="hidden" name="email" value="<%= email %>">

			<input type="hidden" name="tel1st" value="<%= tel1st %>">
			<input type="hidden" name="tel2nd" value="<%= tel2nd %>">
			<input type="hidden" name="tel3rd" value="<%= tel3rd %>">
			<input type="hidden" name="addcode1st" value="<%= addcode1st %>">
			<input type="hidden" name="addcode2nd" value="<%= addcode2nd %>">
			<input type="hidden" name="pref" value="<%= pref %>">
			<input type="hidden" name="city" value="<%= city %>">
			<input type="hidden" name="other" value="<%= other %>">
			<input type="hidden" name="contenttype" value="<%= contenttype %>">
			<input type="hidden" name="content" value="<%= content %>">
			<input class="send" type="submit" value="入力フォームへ">
		</form>
	</body>
</html>