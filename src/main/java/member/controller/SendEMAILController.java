package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.sendEMAIL;
import member.model.sendSMS;

@Controller
public class SendEMAILController {

	private final String command = "sendEMAIL.mb";

	@ResponseBody
	@RequestMapping(value =command, method = RequestMethod.GET)
	public String email(@RequestParam("email") String email, HttpSession session) throws Exception {

		int EmailAuthNum = sendSMS.randomRange(10000, 99999);// 6�ڸ� ������ȣ �ο�
		String subject = "[Biily A Dream] email certification number";
		String msg = "[Billy A Dream] email certification number [" + EmailAuthNum + "]";

		sendEMAIL.sendMail(email, subject, msg);

		System.out.println("email certification number :" + EmailAuthNum);
		session.setAttribute("EmailAuthNum", EmailAuthNum);

		return "yes";
	}

	

	@ResponseBody
	@RequestMapping(value =command, method = RequestMethod.POST)
	public String authNumCheck(@RequestParam("EmailauthNum") int EmailauthNum, HttpSession session) {

		int getEmailAuthNum = (Integer) session.getAttribute("EmailAuthNum");

		System.out.println("부여된 인증번호:" + getEmailAuthNum);
		System.out.println("입력된 인증번호 :" + EmailauthNum);

		if (getEmailAuthNum == EmailauthNum) {
			return "yes";
		}

		else {
			return "no";
		}
	}
}
