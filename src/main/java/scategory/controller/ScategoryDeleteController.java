package scategory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lcategory.model.LcategoryDao;
import scategory.model.ScategoryDao;

@Controller
public class ScategoryDeleteController {
	private final String command="delete.scate";
	private String gotoPage="redirect:/list.scate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	@Autowired
	ScategoryDao scategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getDelete(@RequestParam("no") int no) {
		scategoryDao.deleteScategory(no);
		return gotoPage;
	}
	
}
