package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectDao;

@Controller
public class AdminContectDeleteController {
	private final String command="deleteContect.admin";
	private String getPage="redirect:/contect.admin";
	
	
	@Autowired
	ContectDao contectDao;
	
	@RequestMapping(command)
	public String getMain(Model model,
			@RequestParam(value="no") int no,
			@RequestParam(value="is_reply",required = false) int is_reply,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		if(is_reply==0) {
			contectDao.deleteContect(no);
		} else {
			contectDao.deleteReplyContect(no);
		}
		return getPage;
	}
}
