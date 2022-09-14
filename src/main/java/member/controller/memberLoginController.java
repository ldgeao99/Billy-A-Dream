package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class memberLoginController {
	
	
	private final String command = "login.mb";
	private String getPage = "login";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)//로그인창으로 오기
	public String login() {
		
		return getPage;
	}
	
	@ResponseBody
	@RequestMapping(value = command , method = RequestMethod.POST)
	public String login(@RequestParam("id")String id,@RequestParam("pw")String pw,HttpSession session) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		System.out.println("id :"+id);
		System.out.println("pw :"+pw);
		
		String getpw = mdao.getPwById(id); 
		
		
		if (getpw != null) {

			if (encoder.matches(pw, getpw)) { //복호화

				if (id.equals("admin")) {
					session.setAttribute("id", id);
					return "admin";
				}
				session.setAttribute("id", id);
				return "yes";
			}
		}
		/*
		if(request.getAttribute("destination").equals(null)) {
			return (String)request.getAttribute("destination");
		}
		*/
		
		return "ye"; // 
	}
}
