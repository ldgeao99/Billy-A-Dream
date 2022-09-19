package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductBuyFormController {
	
	private final String command = "buy.prd";
	private String gotoPage="productBuyForm";
	
	@Autowired
	private ProductDao pdao;
	
	@RequestMapping(value= command, method = RequestMethod.GET)
	public String buy(@RequestParam("no")String no, Model model) {
		
		ProductBean pb = pdao.getByNo(no);
		
		pb.setImages(pb.getImages().split(",")[0]); // 판매자의 다른 상품이미지 보여주려면 다 가져오면 안되니 첫번째꺼만 가져옴.
		
		
		model.addAttribute("pb",pb);
		return gotoPage;
	}
}
