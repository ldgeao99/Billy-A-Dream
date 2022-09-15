package scategory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lcategory.model.LcategoryDao;
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;

@Controller
public class ScategoryInsertController {
	private final String command="insert.scate";
	private String getPage="admin/insertScate";
	private String gotoPage="redirect:/list.scate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	@Autowired
	ScategoryDao scategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getInsert() {
		
		return getPage;
	}
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String gotoInsert(@RequestParam("lcate_no") int lcate_no,
			@RequestParam("name") String name) {
		ScategoryBean scategory=new ScategoryBean();
		scategory.setLcate_no(lcate_no);
		scategory.setName(name);
		scategoryDao.insertScategory(scategory);
		return gotoPage;
	}
}
