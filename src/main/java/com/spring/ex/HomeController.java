package com.spring.ex;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;
import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;
import util.PagingProduct;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@Autowired
	ScategoryDao scategoryDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

			
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("whatColumn", ""); // genre or grade or actor
		map1.put("keyword", ""); // �̸� %�� �ٿ��� �Ѱ���� ��.
		PagingProduct pageInfo1 = new PagingProduct("1", null, 8, "", "main_new", "");
		
		
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("whatColumn", ""); // genre or grade or actor
		map2.put("keyword", ""); // �̸� %�� �ٿ��� �Ѱ���� ��.
		PagingProduct pageInfo2 = new PagingProduct("1", null, 8, "", "main_hot", "");
		
		
		List<ProductBean> lists1 = productDao.getRecentProductList(map1, pageInfo1);	
		model.addAttribute("recentProductList", lists1);
		
		List<ProductBean> lists2 = productDao.getPopularProductList(map2, pageInfo2);	
		model.addAttribute("popularProductList", lists2);
		
//		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
//		Map<String,List<ScategoryBean>> lists = new HashMap<String,List<ScategoryBean>>();
//		for(LcategoryBean lcate : list) {
//			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
//			
//			lists.put(lcate.getName(),scate);
//		}
//		model.addAttribute("list", list);
//		model.addAttribute("lists", lists);
		 
		return "home";
	}
}
