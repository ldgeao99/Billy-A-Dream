package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductSucessBuyController {

	private final String command = "sucessBuy.prd";
	
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String sucessBuy(@RequestParam("no")String no , @RequestParam("pg_token") String pg_token ,HttpServletRequest request,HttpSession session,Model model) {

		model.addAttribute("BuyUrl", request.getHeader("Referer"));
		model.addAttribute("no",no);
		model.addAttribute("pg_token",pg_token);
		
		return "productSucessBuy";
	}
}

//return "productSucessBuy";
