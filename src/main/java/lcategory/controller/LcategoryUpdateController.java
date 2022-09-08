package lcategory.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lcategory.model.LcategoryDao;

@Controller
public class LcategoryUpdateController {
	private final String command="update.lcate";
	private String getPage="listLcate";
	private String gotoPage="redirect:/list.lcate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getUpdate(@RequestParam("order_num") int order_num) {
		lcategoryDao.updateOrder_num(order_num);
		return gotoPage;
	}
}
