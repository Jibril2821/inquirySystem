<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*" %>

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

String personalInformation = "神田英会話スクール（以下、当スクール）では、お預かりした個人情報について、以下のとおり適正かつ安全に管理・運用することに努めます。\n\n"
	+ "１．利用目的\n\n"
	+ "当スクールは、収集した個人情報について、以下の目的のために利用いたします。\n"
	+ "①商品発送やサービス実施、およびアフターサービスのため\n"
	+ "②資料請求に対する発送のため\n"
	+ "③相談・お問い合わせへの回答のため\n\n\n"
	+ "２．第三者提供\n\n"
	+ "当スクールは、以下の場合を除いて、個人データを第三者へ提供することはしません。\n"
	+ "①法令に基づく場合\n"
	+ "②人の生命・身体・財産を保護するために必要で、本人から同意を得ることが難しい場合\n"
	+ "③国の機関や地方公共団体、その委託者などによる法令事務の遂行にあたって協力する必要があり、\n"
	+ "かつ本人の同意を得ることで事務遂行に影響が生じる可能性がある場合\n\n\n"
	+ "３．開示請求\n\n"
	+ "貴殿の個人情報について、ご本人には、開示・訂正・削除・利用停止を請求する権利があります。\n"
	+ "手続きにあたっては、ご本人確認のうえ対応させていただきますが、代理人の場合も可能です。\n\n\n\n";
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
			<form action="<%= request.getContextPath() %>/view/userCheckForm.jsp" method="post">
				<h3><font color="red">※入力欄は全て必須です</font><br>よくある質問もご確認ください</h3>

				<ol class="timeline">
					<li class="current">STEP1:お問い合わせ内容入力</li>
					<li>STEP2:入力内容確認</li>
					<li>STEP3:送信完了</li>
				</ol>

				<div>
					<p class="label">■お客様情報</p>
				</div>
				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>氏名</p>
					<input type="text" name="name" value="<%= name %>" required>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>ふりがな</p>
					<input type="text" name="readname" value="<%= readname %>" required>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>年齢</p>
					<input type="text" name="age" value="<%= age %>" required>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>性別</p>
					<input type="radio" name="sex" id="man" value="男" required<%if (sex.equals("男"))out.print(" checked");%>><label for="man" class="sex">男</label>
					<input type="radio" name="sex" id="woman" value="女" required<%if (sex.equals("女"))out.print(" checked");%>><label for="woman" class="sex">女</label>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>メールアドレス</p>
					<input type="text" name="email" value="<%= email %>" required>
				</div>

				<div class="formItem user tel">
					<p class="label"><span class="labelRequired">必須</span>電話番号</p>
					<input type="text" name="tel1st" value="<%= tel1st %>" maxlength="4" required>&nbsp;<b>-</b>&nbsp;
					<input type="text" name="tel2nd" value="<%= tel2nd %>" maxlength="4" required>&nbsp;<b>-</b>&nbsp;
					<input type="text" name="tel3rd" value="<%= tel3rd %>" maxlength="4" required>
				</div>

				<div>
					<p class="label">■住所</p>
				</div>

				<div class="formItem user addcode">
					<p class="label"><span class="labelRequired">必須</span>郵便番号</p>
					<input type="text" name="addcode1st" value="<%= addcode1st %>" maxlength="3" required>&nbsp;<b>-</b>&nbsp;
					<input type="text" name="addcode2nd" value="<%= addcode2nd %>" maxlength="4" required>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>都道府県</p>
					<select name="pref" id="pref" required>
						<option value="" hidden>選択してください</option>
						<option value="北海道">北海道</option>
						<option value="青森県">青森県</option>
						<option value="岩手県">岩手県</option>
						<option value="宮城県">宮城県</option>
						<option value="秋田県">秋田県</option>
						<option value="山形県">山形県</option>
						<option value="福島県">福島県</option>
						<option value="茨城県">茨城県</option>
						<option value="栃木県">栃木県</option>
						<option value="群馬県">群馬県</option>
						<option value="埼玉県">埼玉県</option>
						<option value="千葉県">千葉県</option>
						<option value="東京都">東京都</option>
						<option value="神奈川県">神奈川県</option>
						<option value="新潟県">新潟県</option>
						<option value="富山県">富山県</option>
						<option value="石川県">石川県</option>
						<option value="福井県">福井県</option>
						<option value="山梨県">山梨県</option>
						<option value="長野県">長野県</option>
						<option value="岐阜県">岐阜県</option>
						<option value="静岡県">静岡県</option>
						<option value="愛知県">愛知県</option>
						<option value="三重県">三重県</option>
						<option value="滋賀県">滋賀県</option>
						<option value="京都府">京都府</option>
						<option value="大阪府">大阪府</option>
						<option value="兵庫県">兵庫県</option>
						<option value="奈良県">奈良県</option>
						<option value="和歌山県">和歌山県</option>
						<option value="鳥取県">鳥取県</option>
						<option value="島根県">島根県</option>
						<option value="岡山県">岡山県</option>
						<option value="広島県">広島県</option>
						<option value="山口県">山口県</option>
						<option value="徳島県">徳島県</option>
						<option value="香川県">香川県</option>
						<option value="愛媛県">愛媛県</option>
						<option value="高知県">高知県</option>
						<option value="福岡県">福岡県</option>
						<option value="佐賀県">佐賀県</option>
						<option value="長崎県">長崎県</option>
						<option value="熊本県">熊本県</option>
						<option value="大分県">大分県</option>
						<option value="宮崎県">宮崎県</option>
						<option value="鹿児島県">鹿児島県</option>
						<option value="沖縄県">沖縄県</option>
					</select>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>市区町村</p>
					<input type="text" name="city" value="<%= city %>" required>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>以降の住所</p>
					<input type="text" name="other" value="<%= other %>" required>
				</div>

				<div>
					<p class="label">■お問い合わせ詳細</p>
				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>お問い合わせ項目</p>
					<span class="type">
						<input type="radio" name="contenttype" id="fee" value="料金・お支払いについて" required<%if (contenttype.equals("料金・お支払いについて"))out.print(" checked");%>><label for="fee" class="type">料金・お支払いについて</label><br><br>
						<input type="radio" name="contenttype" id="course" value="講座・コース・教材について" required<%if (contenttype.equals("講座・コース・教材について"))out.print(" checked");%>><label for="course" class="type">講座・コース・教材について</label><br><br>
						<input type="radio" name="contenttype" id="proceed" value="学習の進め方について" required<%if (contenttype.equals("学習の進め方について"))out.print(" checked");%>><label for="proceed" class="type">学習の進め方について</label><br><br>
						<input type="radio" name="contenttype" id="term" value="受講期間について" required<%if (contenttype.equals("受講期間について"))out.print(" checked");%>><label for="term" class="type">受講期間について</label><br><br>
						<input type="radio" name="contenttype" id="support" value="受講終了後のサポートについて" required<%if (contenttype.equals("受講終了後のサポートについて"))out.print(" checked");%>><label for="support" class="type">受講終了後のサポートについて</label><br><br>
						<input type="radio" name="contenttype" id="other" value="その他お問い合わせ" required<%if (contenttype.equals("その他お問い合わせ"))out.print(" checked");%>><label for="other" class="type">その他お問い合わせ</label><br><br>
					</span>

				</div>

				<div class="formItem user">
					<p class="label"><span class="labelRequired">必須</span>お問い合わせ内容</p>
					<textarea class="userinput" name="content" rows="10" cols="50" required><%= content %></textarea>
				</div>
				<div class="personalInformation">
					<div>個人情報の取り扱いについて</div>
					<p><%= personalInformation %></p>
						<fieldset class="consent">
							<label><input type="radio" name="consent" value="disagree" checked required><b>同意しない</b></label>
							<label><input type="radio" name="consent" value="agree" required><font color="red"><b>同意する</b></font></label>
						</fieldset>
				</div>


			<input class="send" type="submit" value="送信内容確認">
			</form>
			<%@include file="/common/footer.jsp" %>
		</div>
		<script>
			window.addEventListener("load", function() {
				document.getElementById("pref").value="<%= pref %>";
			});
		</script>
	</body>
</html>