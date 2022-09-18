package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;

@Controller
public class memberKakaoLoginController {

	
	private final String command = "kakaologin.mb";
	private String gotoPage = "redirect:/";
	
	
	@Autowired
	private MemberDao memberdao;
	
	
	@RequestMapping(command)
	public String kakaologin() {
		return "";
	}
	
}
