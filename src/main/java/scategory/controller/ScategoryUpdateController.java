package scategory.controller;

import java.util.ArrayList;
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
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;

@Controller
public class ScategoryUpdateController {
	private final String command="update.scate";
	private final String command2="updateOrder_num.scate";
	private final String command3="updateLcate_no.scate";
	private String getPage="admin/updateScate";
	private String gotoPage="redirect:/update.scate";

	@Autowired
	LcategoryDao lcategoryDao;
	@Autowired
	ScategoryDao scategoryDao;

	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getUpdate(Model model) {
		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
		List<List<ScategoryBean>> lists=new ArrayList<List<ScategoryBean>>();
		for(LcategoryBean lcate : list) {
			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
			for(ScategoryBean sc : scate) {
				sc.setLcate_name(lcate.getName());
				sc.setMaxOrder_num(scategoryDao.selectMaxOrder(sc));
			}

			lists.add(scate);
		}
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return getPage;
	}
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String gotoUpdate(@ModelAttribute("scategory") ScategoryBean scategory) {
		scategoryDao.updateScategory(scategory);
		return gotoPage;
	}
	@RequestMapping(value = command2,method = RequestMethod.GET)
	public String getUpdate(Model model,
			@RequestParam(value = "no",required = false) int no,
			@RequestParam(value = "val",required = false) int val,
			@RequestParam(value = "order_num",required = false) int order_num,
			@RequestParam(value = "lcate_no",required = false) int lcate_no) {
		System.out.println(1);
		ScategoryBean scate=new ScategoryBean();
		System.out.println("no"+no);
		System.out.println("lcate no"+lcate_no);
		scate.setNo(no);
		scate.setOrder_num(order_num);
		scate.setLcate_no(lcate_no);
		System.out.println(2);
		scategoryDao.updateOrder_num(scate,val);
		System.out.println(3);

		return gotoPage;
	}
	@RequestMapping(value = command3,method = RequestMethod.POST)
	public String lcateUpdate(Model model,
			@RequestParam(value = "no",required = false) int no,
			@RequestParam(value = "lcate_no",required = false) int lcate_no) {
		System.out.println(1);
		ScategoryBean scate=new ScategoryBean();
	
		scate.setNo(no);
		
		scate.setLcate_no(lcate_no);
		System.out.println(2);
		scategoryDao.changeLcategory(scate);
		System.out.println(3);
		
		return gotoPage;
	}

}
