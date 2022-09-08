package lcategory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lcategory.model.LcategoryDao;
import scategory.model.ScategoryDao;

@Controller
public class LcategoryDeleteController {
	private final String command="delete.lcate";
	private String getPage="redirect:/list.lcate";
	@Autowired
	LcategoryDao lcategoryDao;
	@Autowired
	ScategoryDao scategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getDelete() {
		
		return getPage;
	}
}
