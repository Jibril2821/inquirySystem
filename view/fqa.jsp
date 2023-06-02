<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="util.*, bean.*" %>

<html>
	<head>
		<title>お問い合わせフォーム</title>
		<link rel ="stylesheet" href ="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<%@include file="/common/userHeader.jsp" %>
		<h2>よくあるご質問</h2>
		<div class="container">
			<h2 class="headline">
				<span>01</span>
				ご入学までの流れ
			</h2>
			<details class="fqa">
				<summary class="fqa">入学までの流れを教えてください。</summary>
				<p>まずは各スクールで無料体験レッスン・コース説明会にご参加ください。
				ご希望を詳しくお聞きしながら、レッスン内容・担当教師・テキスト・時間割などを具体的にご案内いたします。
				ご不安な点をクリアにされてから、ご入学を検討いただけます。</p>
			</details>

			<details class="fqa">
				<summary class="fqa">いつから始められますか？</summary>
				<p>いつからでも始めていただけるようにカリキュラムを整えています。
				早速明日からでも、来月からでも、ご都合に合わせて始めていただけます。</p>
			</details>

			<details class="fqa">
				<summary class="fqa">どのコースが自分に合っているのか、よくわからないです。</summary>
				<p>い一人ひとりの生徒様に適切なレッスンを提供できるように、コース、レベル、教材を豊富にご用意しております。
				目的や目標レベル、ご予算やお時間のご都合に合わせて、コースをご紹介いたしますので、ぜひ、最寄のスクールの無料体験レッスン・コース説明会にご参加ください。</p>
			</details>

			<h2 class="headline">
				<span>02</span>
				教師について
			</h2>

			<details class="fqa">
				<summary class="fqa">先生は選べますか？</summary>
				<p>はい、お選びいただけます。イーオンには外国人教師と日本人教師がおります。
				目的やレベルに合わせてどちらの教師が良いかご提案さしあげますが、最初は外国人教師で始めたけれど、日本人教師に習ってみたいなど、途中で担当教師を変更したいというご相談も承ります。</p>
			</details>

			<h2 class="headline">
				<span>03</span>
				費用について
			</h2>

			<details class="fqa">
				<summary class="fqa">授業料はいくらですか？</summary>
				<p>週1回、1年間のコースの場合、1ヶ月あたり〇〇円（税込）です。
				そのほか目標別に、様々なタイプのコースがございます。
				ご予算に合せてコースをご提案させていただいております。
				代表的な授業料に関しては、各スクールページからご覧いただけます。</p>
			</details>

			<details class="fqa">
				<summary class="fqa">支払い方法にはどのようなものがありますか？</summary>
				<p><b>一括払いの場合：</b><br>
					銀行振り込み・コンビニ振込み・クレジットカード・デビットカード（加盟銀行のキャッシュカード）
					<br><br>
					<b>分割払いの場合：</b><br>
					イーオンスチューデントクレジットをご利用いただくと、月々払いが可能です。＊分割手数料がかかります。</p>
			</details>

			<h2 class="headline">
				<span>04</span>
				その他
			</h2>

			<details class="fqa">
				<summary class="fqa">どのような感染対策をしていますか？</summary>
				<p>生徒様の安心してお通いいただけるよう、各教室では衛生面対策の取り組みを行っております。</p>
			</details>

			<details class="fqa">
				<summary class="fqa">英語は苦手で全く初めてですが、大丈夫ですか？</summary>
				<p>もちろん、大丈夫です。ほとんどの方が英会話は初めてでいらっしゃいます。
				学生のときに学んだ英語も、普段使わないと忘れてしまうものです。
				そのような日本人学習者の方向けに作られたオリジナルテキストを使っていくことで少しずつ自然に思い出していただけますのでご安心下さい。</p>
			</details>

			<form action="<%= request.getContextPath() %>/view/userInputForm.jsp">
				<input class="send" type="submit" value="お問い合わせする">
			</form>
		<%@include file="/common/footer.jsp" %>
		</div>
	</body>
</html>