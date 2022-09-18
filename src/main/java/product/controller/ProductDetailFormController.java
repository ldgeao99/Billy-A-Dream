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
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("no") String no,Model model) {
		
		pdao.updateView_count(no); // 접속할때마다 조회수 증가
		
		ProductBean pb = pdao.getByNo(no);
		List<ProductBean> lists = pdao.getByseller_no(String.valueOf(pb.getSeller_no())); 
		// 상세페이지에서 그 상품의 판매자가 파는 상품 다 가져오려고
		for(ProductBean image : lists) {
			image.setImages(image.getImages().split(",")[0]); // 판매자의 다른 상품이미지 보여주려면 다 가져오면 안되니 첫번째꺼만 가져옴.
		}
		
		MemberBean mb = mdao.getByMno(pb.getSeller_no());
		
		String[] images = pb.getImages().split(","); // 한개씩 가져와서 배열로 받기위해
		
		model.addAttribute("mb",mb);
		model.addAttribute("lists",lists);
		model.addAttribute("images",images);
		model.addAttribute("pb",pb);
		return gotoPage;
	}
}
