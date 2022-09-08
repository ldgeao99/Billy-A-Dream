package scategory.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;

@Controller
public class ScategoryListController {
	private final String command="list.scate";
	private String getPage="listScate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	@Autowired
	ScategoryDao scategoryDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getList(Model model) {
		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
		List<List<ScategoryBean>> lists=new ArrayList<List<ScategoryBean>>();
		for(LcategoryBean lcate : list) {
			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
			for(ScategoryBean sc : scate)
				sc.setLcate_name(lcate.getName());
			
			lists.add(scate);
		}
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return getPage;
	}
}
