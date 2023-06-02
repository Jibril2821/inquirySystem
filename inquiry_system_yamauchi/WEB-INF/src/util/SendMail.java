package util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import dao.*;

public class SendMail {

	public void send(String message, String email){

		try {
			Properties props = System.getProperties();

			// SMTPサーバのアドレスを指定（今回はxserverのSMTPサーバを利用）
			props.put("mail.smtp.host", "sv5215.xserver.jp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.debug", "true");

			Session mailSession = Session.getInstance(
				props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						//メールサーバにログインするメールアドレスとパスワードを設定
						return new PasswordAuthentication("test.sender@kanda-it-school-system.com", "kandaSender202208");
					}
				}
			);

			MimeMessage mimeMessage = new MimeMessage(mailSession);

			mimeMessage.setFrom(new InternetAddress("test.sender@kanda-it-school-system.com", "神田IT School", "iso-2022-jp"));

			mimeMessage.setRecipients(Message.RecipientType.TO, email);

			mimeMessage.setSubject("お問い合わせ受付完了のお知らせ", "iso-2022-jp");

			mimeMessage.setText(message, "iso-2022-jp");
			mimeMessage.setHeader("Content-Type", "text/plain; charset=iso-2022-jp");
			mimeMessage.setSentDate(new Date());

			Transport.send(mimeMessage);

			System.out.println("送信に成功しました。");
		} catch (Exception e) {
			System.out.println("送信に失敗しました。\n" + e);
		}
	}
}
