package com.spring.ex;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import product.model.ProductBean;
import product.model.ProductDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProductDao productDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<ProductBean> lists1 = productDao.getRecentProductList();	
		model.addAttribute("recentProductList", lists1);
		
		List<ProductBean> lists2 = productDao.getPopularProductList();	
		model.addAttribute("popularProductList", lists2);
		
		return "home";
	}
}
