package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import product.model.ProductBean;
import product.model.ProductDao;
import util.DateParse;

@Controller
public class ProductUpController {
	
	private final String command = "upProduct.prd";
	
	@Autowired
	private ProductDao pdao;
	
	
	@ResponseBody
	@RequestMapping(command)
	public String ProductUp(@RequestParam("no")String no) {
		
		ProductBean pb = pdao.getByNo(no);
		
		if(DateParse.getTodayPlus(0).equals(DateParse.day((pb.getPulled_day())))) {
			return "no";
		}
		else {
			pdao.updatePulledDay(no);
			return "yes";
		}
		
	}
}
