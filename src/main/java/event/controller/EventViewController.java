package event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventViewController {
	
	private final String command="board.evt";
	private String getPage="eventBoard"; 
	
	@RequestMapping(command)
	public String eventBoardView(Model model) {
		
		return getPage;
	}

}
