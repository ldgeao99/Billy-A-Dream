package contect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectDao;

@Controller
public class ContectDeleteController {
	
	private final String command="delete.ctc";
	private String getPage="redirect:/board.ctc"; 
	
	@Autowired
	ContectDao contectDao;
	
	@RequestMapping(command)
	public String contectView(Model model,
			@RequestParam("no") int no) {
		if(no%2==1) {
			no=no+1;
		}
		contectDao.deleteContect(no);
		
		return getPage;
	}

}
