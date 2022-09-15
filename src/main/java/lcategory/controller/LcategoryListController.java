package lcategory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;

@Controller
public class LcategoryListController {
	private final String command="list.lcate";
	private String getPage="admin/listLcate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getInsert(Model model) {
		List<LcategoryBean> lists=lcategoryDao.selectLcategoryList();
		model.addAttribute("lists", lists);
		int maxOrder_num=lcategoryDao.selectMaxOrder();
		model.addAttribute("maxOrder_num", maxOrder_num);
		return getPage;
	}
}
