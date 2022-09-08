package scategory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lcategory.model.LcategoryDao;
import scategory.model.ScategoryBean;

@Controller
public class ScategoryInsertController {
	private final String command="insert.scate";
	private String getPage="insertScate";
	private String gotoPage="redirect:/list.scate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getInsert() {
		
		return getPage;
	}
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String gotoInsert(@ModelAttribute("scategory") ScategoryBean scategory) {
		
		return gotoPage;
	}
}
