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

<<<<<<< HEAD
		int EmailAuthNum = sendSMS.randomRange(10000, 99999);// 6ÀÚ¸® ÀÎÁõ¹øÈ£ ºÎ¿©
		String subject = "[Biily A Dream] ÀÌ¸ÞÀÏ ÀÎÁõ¹øÈ£";
		String msg = "[Billy A Dream] ÀÌ¸ÞÀÏ ÀÎÁõ ¹øÈ£´Â [" + EmailAuthNum + "] ÀÔ´Ï´Ù.";

		sendEMAIL.sendMail(email, subject, msg);

		System.out.println("ºÎ¿©ÇÑ ÀÌ¸ÞÀÏÀÎÁõ¹øÈ£ :" + EmailAuthNum);
		session.setAttribute("EmailAuthNum", EmailAuthNum);

		return "yes";
	}

	@ResponseBody
	@RequestMapping(value =command, method = RequestMethod.POST)
	public String authNumCheck(@RequestParam("EmailauthNum") int EmailauthNum, HttpSession session) {

		int getEmailAuthNum = (Integer) session.getAttribute("EmailAuthNum");

		System.out.println("ºÎ¿©µÈ ÀÎÁõ¹øÈ£ :" + getEmailAuthNum);
		System.out.println("ÀÔ·ÂÇÑ ÀÎÁõ¹øÈ£ :" + EmailauthNum);
=======
		int EmailAuthNum = sendSMS.randomRange(10000, 99999);// 6ï¿½Ú¸ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£ ï¿½Î¿ï¿½
		String subject = "[Biily A Dream] ï¿½Ì¸ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£";
		String msg = "[Billy A Dream] ï¿½Ì¸ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£ï¿½ï¿½ [" + EmailAuthNum + "] ï¿½Ô´Ï´ï¿½.";

		sendEMAIL.sendMail(email, subject, msg);

		System.out.println("ï¿½Î¿ï¿½ï¿½ï¿½ ï¿½Ì¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£ :" + EmailAuthNum);
		session.setAttribute("EmailAuthNum", EmailAuthNum);

		return "yes";
	}

	@ResponseBody
	@RequestMapping(value =command, method = RequestMethod.POST)
	public String authNumCheck(@RequestParam("EmailauthNum") int EmailauthNum, HttpSession session) {

		int getEmailAuthNum = (Integer) session.getAttribute("EmailAuthNum");

		System.out.println("ï¿½Î¿ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£ :" + getEmailAuthNum);
		System.out.println("ï¿½Ô·ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£ :" + EmailauthNum);
>>>>>>> branch 'master' of https://github.com/PostFace/Billy-A-Dream.git

		if (getEmailAuthNum == EmailauthNum) {
			return "yes";
		}

		else {
			return "no";
		}
	}
}
