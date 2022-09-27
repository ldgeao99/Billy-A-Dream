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


		int EmailAuthNum = sendSMS.randomRange(10000, 99999);
		String subject = "[Biily A Dream] 占싱몌옙占쏙옙 占쏙옙占쏙옙占쏙옙호";
		String msg = "[Billy A Dream] 占싱몌옙占쏙옙 占쏙옙占쏙옙 占쏙옙호占쏙옙 [" + EmailAuthNum + "] 占쌉니댐옙.";

		//sendEMAIL.sendMail(email, subject, msg);

		System.out.println("占싸울옙占쏙옙 占싱몌옙占쏙옙占쏙옙占쏙옙占쏙옙호 :" + EmailAuthNum);

		session.setAttribute("EmailAuthNum", EmailAuthNum);

		return "yes";
	}

	@ResponseBody
	@RequestMapping(value =command, method = RequestMethod.POST)
	public String authNumCheck(@RequestParam("EmailauthNum") int EmailauthNum, HttpSession session) {

		int getEmailAuthNum = (Integer) session.getAttribute("EmailAuthNum");

		System.out.println("遺��щ�� �몄�踰���:" + getEmailAuthNum);
		System.out.println("���λ�� �몄�踰��� :" + EmailauthNum);

		if (getEmailAuthNum == EmailauthNum) {
			return "yes";
		}

		else {
			return "no";
		}
	}
}
