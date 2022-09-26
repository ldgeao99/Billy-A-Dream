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


		int EmailAuthNum = sendSMS.randomRange(10000, 99999);// 6¿⁄∏Æ ¿Œ¡ıπ¯»£ ∫Œø©
		String subject = "[Biily A Dream] ¿Ã∏ﬁ¿œ ¿Œ¡ıπ¯»£";
		String msg = "[Billy A Dream] ¿Ã∏ﬁ¿œ ¿Œ¡ı π¯»£¥¬ [" + EmailAuthNum + "] ¿‘¥œ¥Ÿ.";

		sendEMAIL.sendMail(email, subject, msg);

		System.out.println("∫Œø©«— ¿Ã∏ﬁ¿œ¿Œ¡ıπ¯»£ :" + EmailAuthNum);

		session.setAttribute("EmailAuthNum", EmailAuthNum);

		return "yes";
	}

	@ResponseBody
	@RequestMapping(value =command, method = RequestMethod.POST)
	public String authNumCheck(@RequestParam("EmailauthNum") int EmailauthNum, HttpSession session) {

		int getEmailAuthNum = (Integer) session.getAttribute("EmailAuthNum");

<<<<<<< HEAD
		System.out.println("Î∂ÄÏó¨Îêú Ïù∏Ï¶ùÎ≤àÌò∏:" + getEmailAuthNum);
		System.out.println("ÏûÖÎ†•Îêú Ïù∏Ï¶ùÎ≤àÌò∏ :" + EmailauthNum);
=======

		System.out.println("∫Œø©µ» ¿Œ¡ıπ¯»£ :" + getEmailAuthNum);
		System.out.println("¿‘∑¬«— ¿Œ¡ıπ¯»£ :" + EmailauthNum);

>>>>>>> branch 'master' of https://github.com/PostFace/Billy-A-Dream.git

		if (getEmailAuthNum == EmailauthNum) {
			return "yes";
		}

		else {
			return "no";
		}
	}
}
