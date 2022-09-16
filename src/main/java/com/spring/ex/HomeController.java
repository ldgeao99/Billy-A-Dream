package com.spring.ex;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	LcategoryDao lcategoryDao;
	@Autowired
	ScategoryDao scategoryDao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
		Map<String,List<ScategoryBean>> lists=new HashMap<String,List<ScategoryBean>>();
		for(LcategoryBean lcate : list) {
			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
			
			
			lists.put(lcate.getName(),scate);
		}
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeRequest(Model model) {
		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
		Map<String,List<ScategoryBean>> lists=new HashMap<String,List<ScategoryBean>>();
		for(LcategoryBean lcate : list) {
			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
			
			
			lists.put(lcate.getName(),scate);
		}
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "home";
	}
	
}
