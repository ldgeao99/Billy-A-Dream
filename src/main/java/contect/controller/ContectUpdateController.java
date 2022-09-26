package contect.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectBean;
import contect.model.ContectDao;
import member.model.MemberDao;

@Controller
public class ContectUpdateController {

	private final String command="update.ctc";
	private String getPage="contectUpdate"; 
	private String gotoPage="redirect:/board.ctc"; 
	
	@Autowired
	ContectDao contectDao;
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String getInsert(Model model,
			@RequestParam("no") int no) {
		ContectBean contect=contectDao.selectContectDetail(no);
		model.addAttribute("contect", contect);
		return getPage;
	}
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String gotoInsert(Model model,
			@ModelAttribute("contect") @Valid ContectBean contect,
			BindingResult result) {
		if(result.hasErrors()) {
			return getPage;
		}
		contectDao.updateContect(contect);
		return gotoPage;
	}
}
