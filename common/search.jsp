<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

<%
String contenttype = Converter.getParam((String)request.getAttribute("contenttype"));
String reply = Converter.getParam((String)request.getAttribute("reply"));
String name = Converter.getParam((String)request.getAttribute("name"));
%>

<div class="search_bar">
	<form action="<%= request.getContextPath() %>/historyList" method="post">
		<label>
			名前：
			<input type="text" class="name" name="name" value="<%= name %>">
		</label>

		<label class="selectbox">
			&ensp;種類：
			<select name="contenttype" id="contenttype">
				<option value="">選択なし</option>
				<option value="料金・お支払いについて">料金</option>
				<option value="講座・コース・教材について">講座</option>
				<option value="学習の進め方について">学習</option>
				<option value="受講期間について">受講期間</option>
				<option value="受講終了後のサポートについて">サポート</option>
				<option value="その他お問い合わせ">その他</option>
			</select>
		</label>

		<label class="selectbox">
			&ensp;返信/未返信：
			<select name="reply" id="reply">
				<option value="">選択なし</option>
				<option value="0">未返信</option>
				<option value="1">返信済み</option>
			</select>
		</label>
		<input type="hidden" name="cmd" value="search">
		<input class="send search" type="submit" value="&#xf002;">
	</form>
	<form>
		<input class="send search" type="submit" value="&#xf0e2">
	</form>
</div>

<script>
	window.addEventListener("load", function() {
		document.getElementById("contenttype").value="<%= contenttype %>";
		document.getElementById("reply").value="<%= reply %>";
	})
</script>
