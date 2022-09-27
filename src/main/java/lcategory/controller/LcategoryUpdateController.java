package lcategory.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;

@Controller
public class LcategoryUpdateController {
	private final String command="update.lcate";
	private final String command2="updateOrder_num.lcate";
	private String getPage="admin/updateLcate";
	private String gotoPage="redirect:/update.lcate";

	@Autowired
	LcategoryDao lcategoryDao;

	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getUpdate(Model model) {
		List<LcategoryBean> lists=lcategoryDao.selectLcategoryList();
		model.addAttribute("lists", lists);

		int maxOrder_num=lcategoryDao.selectMaxOrder();
		model.addAttribute("maxOrder_num", maxOrder_num);
		return getPage;
	}
	@RequestMapping(value = command2,method = RequestMethod.GET)
	public String getUpdate(Model model,
			@RequestParam(value = "val",required = false) int val,
			@RequestParam(value = "no",required = false) int no,
			@RequestParam(value = "order_num",required = false) int order_num) {
		LcategoryBean lcate=new LcategoryBean();
		lcate.setNo(no);
		lcate.setOrder_num(order_num);
		lcategoryDao.updateOrder_num(lcate,val);

		return gotoPage;
	}
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String gotoUpdate(LcategoryBean lcategory) {
		//System.out.println(1);
		lcategoryDao.updateLcategory(lcategory);
		//System.out.println(2);
		return gotoPage;
	}
}
