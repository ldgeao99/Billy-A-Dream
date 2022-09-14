package member.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class memberRegisterController {
	
	private final String command = "register.mb";
	private String getPage = "register";
	private String gotoPage = "redirect:home";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)//로그인창으로 오기
	public String register() {
		
		return getPage;
	}
	
	@RequestMapping(value = command , method = RequestMethod.POST)//로그인창으로 오기
	public String register(MemberBean mb) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(mb.getPw());// 가져온 pw 암호화
		
		System.out.println("securePassword :"+securePassword);
		mb.setPw(securePassword);
		mdao.InsertMember(mb);
		return gotoPage;
	}
}
