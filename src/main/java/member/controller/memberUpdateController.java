package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class memberUpdateController {

	private final String command = "updateMember.mb";
	private String gotoPage = "redirect:mypage.mb?select=6";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value = command , method = RequestMethod.POST)
	public String updateMember(MemberBean mb,Model model) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(mb.getPw());
		mb.setPw(securePassword);
		
		mdao.updateMember(mb);
		
		model.addAttribute("mb",mb);
		
		return gotoPage;
	}
}
