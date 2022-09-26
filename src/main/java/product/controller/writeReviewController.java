package product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class writeReviewController {
	
	private final String command = "writeReview.prd";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private ReviewDao rdao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String writeReviewGet(@RequestParam("pno")String pno) {
		
		
		return "redirect:productdetail.prd?no="+pno+"&write=1";
	}
	
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String writeReviewPost(ReviewBean rb,HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		MemberBean mb = mdao.getById(id);
		
		rb.setMno(mb.getMno());
		
		rdao.WriteReview(rb);//writeReview
		
		
		return "redirect:productdetail.prd?no="+rb.getPno()+"&write=2";
	}

}
