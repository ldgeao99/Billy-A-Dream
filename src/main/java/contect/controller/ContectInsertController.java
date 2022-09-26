package contect.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import contect.model.ContectBean;
import contect.model.ContectDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class ContectInsertController {

	private final String command="insert.ctc";
	private String getPage="contectInsert"; 
	private String gotoPage="redirect:/board.ctc"; 
	
	@Autowired
	ContectDao contectDao;
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String getInsert(Model model) {
		model.addAttribute("contect", new ContectBean());
		return getPage;
	}
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String gotoInsert(Model model,
			@ModelAttribute("contect") @Valid ContectBean contect,
			BindingResult result) {
		System.out.println("contect.getCategory_num()1"+contect.getCategory_num());
		if(result.hasErrors()) {
			return getPage;
		}
		MemberBean mb= memberDao.getById(contect.getId());
		contect.setMno(mb.getMno());
		contectDao.insertNewContect(contect);
		return gotoPage;
	}
}
