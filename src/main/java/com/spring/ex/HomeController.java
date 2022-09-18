package com.spring.ex;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @Autowired private ProductDao pdao;
	 * 
	 * @Autowired private MemberDao mdao;
	 */
	
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		/*
		 * String id = (String)session.getAttribute("id");
		 * 
		 * if(id!=null) { MemberBean mb = mdao.getById(id);
		 * 
		 * String[] likePnumList = mb.getLikePnum().split(",");
		 * 
		 * List<ProductBean> lists = pdao.getAllByno(likePnumList); }
		 */
		
		
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeRequest() {
		
		return "home";
	}
	
}
