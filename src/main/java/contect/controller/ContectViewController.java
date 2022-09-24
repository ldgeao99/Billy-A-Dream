package contect.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContectViewController {
	
	private final String command="board.ctc";
	private String getPage="contectBoard"; 
	
	@RequestMapping(command)
	public String contectView(Model model) {
		
		return getPage;
	}

}
