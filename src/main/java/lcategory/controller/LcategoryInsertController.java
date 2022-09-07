package lcategory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lcategory.model.LcategoryDao;

@Controller
public class LcategoryInsertController {
	private final String command="insert.lcate";
	private String getPage="insertLcate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@RequestMapping(value = command)
	public String getInsert() {
		
		return getPage;
	}
}
