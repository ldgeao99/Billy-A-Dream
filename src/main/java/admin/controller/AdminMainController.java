package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;

@Controller
public class AdminMainController {
	private final String command="main.admin";
	private String getPage="index";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String getMain(Model model) {
		int members=  50;
		model.addAttribute("members", members);
		return getPage;
	}
	
}
