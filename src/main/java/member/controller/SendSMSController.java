package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.sendSMS;

@Controller
public class SendSMSController {
	
	private final String command = "sendSMS.mb";
	
	@ResponseBody
	@RequestMapping(value=command , method = RequestMethod.GET)
	public String login(@RequestParam("PhoneNumber") String PhoneNumber, HttpSession session) {
		
		int authNum = sendSMS.sendsms(PhoneNumber);
		System.out.println("부여된 인증번호 :"+authNum);
		
		session.setAttribute("authNum", authNum);
		return "yes";
	}
	
	@ResponseBody
	@RequestMapping(value=command , method = RequestMethod.POST)
	public String authNumCheck(@RequestParam("authNum") int authNum,HttpSession session) {
		
		int setAuthNum = (Integer) session.getAttribute("authNum");
		
		System.out.println("부여된 인증번호 :"+setAuthNum);
		System.out.println("입력한 인증번호 :"+authNum);
		
		if(setAuthNum==authNum) {
			return "yes";
		}
		
		else {
			return "no";
		}
	}
}
