package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lcategory.model.LcategoryDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import scategory.model.ScategoryDao;

@Controller
public class ProductDetailFormController {

	
	private final String command = "productdetail.prd";
	private String gotoPage = "productDetailForm";
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private MemberDao mdao; // org.springframework.beans.factory.NoSuchBeanDefinitionException: No matching bean of type [member.model.MemberDao] found for dependency
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("no") String no,Model model) {
		
		pdao.updateView_count(no);
		
		ProductBean pb = pdao.getByNo(no);
		List<ProductBean> lists = pdao.getByseller_no(String.valueOf(pb.getSeller_no())); 

		for(ProductBean image : lists) {
			image.setImages(image.getImages().split(",")[0]);
		}
		
		MemberBean mb = mdao.getByMno(pb.getSeller_no());
		
		String[] images = pb.getImages().split(",");
		
		model.addAttribute("mb",mb);
		model.addAttribute("lists",lists);
		model.addAttribute("images",images);
		model.addAttribute("pb",pb);
		return gotoPage;
	}
}
