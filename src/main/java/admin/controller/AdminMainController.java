package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {
	private final String command="main.admin";
	private String getPage="index";
	
	@RequestMapping(command)
	public String getMain() {
		return getPage;
	}
	
}
