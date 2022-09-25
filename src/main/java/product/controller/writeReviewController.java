package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class writeReviewController {
	
	private final String command = "writeReview.prd";
	
	@RequestMapping(command)
	public String writeReview(@RequestParam("pno")String pno) {
		
		String write = "1";
		
		return "redirect:productdetail.prd?no="+pno+"&write="+write;
	}

}
