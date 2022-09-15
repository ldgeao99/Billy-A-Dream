package lcategory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;

@Controller
public class LcategoryInsertController {
	private final String command="insert.lcate";
	private String getPage="admin/insertLcate";
	private String gotoPage="redirect:/list.lcate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getInsert() {
		
		return getPage;
	}
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String gotoInsert(@ModelAttribute("lcategory") LcategoryBean lcategory) {
		lcategoryDao.insertLcategory(lcategory);
		return gotoPage;
	}
}
