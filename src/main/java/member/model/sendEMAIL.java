package member.model;

import org.apache.commons.mail.HtmlEmail;

public class sendEMAIL {
	public static void sendMail(String email, String subject, String msg) throws Exception {

		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; 
		String hostSMTPid = "1234"; 
		String hostSMTPpwd = "1234"; 

		String fromEmail = "1234";
		String fromName = "Billy A Dream";

		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);  
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);  

			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
