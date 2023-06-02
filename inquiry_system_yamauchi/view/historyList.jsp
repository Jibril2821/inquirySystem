<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.*, util.*, java.util.*" %>

<%
ArrayList<InquiryList> inquiryList = (ArrayList<InquiryList>)request.getAttribute("inquiry_list");
%>

<html>
	<head>
		<title>お問い合わせシステム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/adminHeader.jsp" %>
		<h2>お問い合わせ履歴</h2>
		<%@include file="/common/search.jsp" %>
		<table class="list">
			<tr>
				<th class="admin" width="50">NO.</th>
				<th class="admin" width="300">名前</th>
				<th class="admin" width="300">種類</th>
				<th class="admin" width="500">お問い合わせ日時</th>
				<th class="admin" width="750">お問い合わせ内容</th>
				<th class="admin" width="300"></th>
			</tr>
			<%
			if (inquiryList != null) {
				for (InquiryList inquiry : inquiryList) {
			%>
			<tr>
				<td class="admin inquiryno"><a href="<%= request.getContextPath() %>/detail?inquiryno=<%= inquiry.getInquiryno() %>"><%= inquiry.getInquiryno() %></a></td>
				<td class="admin"><%= inquiry.getName() %></td>
				<td class="admin" style="background-color: <%= Converter.getColorForInquiryList(inquiry.getInquiryname()) %>"><%= Converter.convertInquiryname(inquiry.getInquiryname()) %></td>
				<td class="admin"><%= inquiry.getDate() %></td>
				<td class="admin"><%= inquiry.getContents() %></td>
				<td class="admin controll" bgcolor="
					<%if (inquiry.getReply().equals("0")) { %>
					red
					<% } else if (inquiry.getReply().equals("1")) { %>
					#cccccc
					<% } %>">
					<%
					if (inquiry.getReply().equals("0")) {
					%>
					<a class="reply" href="<%= request.getContextPath() %>/detail?inquiryno=<%= inquiry.getInquiryno() %>">返信</a>
					<%
					} else if(inquiry.getReply().equals("1")) {
					%>
					返信済み
					<%
					}
					%>
				</td>
			</tr>
			<%
				}
			}
			%>
		</table>
		<%@include file="/common/footer.jsp" %>
	</body>
</html>