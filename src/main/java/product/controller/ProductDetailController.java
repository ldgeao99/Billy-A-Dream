package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class ProductDetailController {

	
	private final String command = "productdetail.prd";
	private String gotoPage = "productDetail";
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private MemberDao mdao; // org.springframework.beans.factory.NoSuchBeanDefinitionException: No matching bean of type [member.model.MemberDao] found for dependency
	
	@Autowired
	private LcategoryDao ldao;
	
	@Autowired
	private ScategoryDao sdao;
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("no") String no,Model model) {
		
		pdao.updateView_count(no);
		
		//product object will be shown
		ProductBean pb = pdao.getByNo(no);
		
<<<<<<< HEAD
=======
		//seller's products
>>>>>>> branch 'master' of https://github.com/PostFace/Billy-A-Dream.git
		List<ProductBean> lists = pdao.getByseller_no(String.valueOf(pb.getSeller_no())); 
		
		String Lcate = ldao.selectLcategoryName(pb.getLcategory_no());
		String Scate = sdao.selectScategoryName(pb.getScategory_no());
		
		pb.setLcategoryName(Lcate);
		pb.setScategoryName(Scate);
		
		Map<String, String>map = new HashMap<String, String>();
		map.put("lcategory_no",String.valueOf(pb.getLcategory_no()));
		map.put("scategory_no",String.valueOf(pb.getScategory_no()));
		
		List<ProductBean> EqualLists = pdao.getEqualCate(map);
		
		for(ProductBean image : EqualLists) {
			image.setImages(image.getImages().split(",")[0]);
		}
		for(ProductBean image : lists) {
			image.setImages(image.getImages().split(",")[0]);
		}
		
		MemberBean mb = mdao.getByMno(pb.getSeller_no());
		
		String[] images = pb.getImages().split(",");
		
		model.addAttribute("mb",mb);
		model.addAttribute("lists",lists);
		model.addAttribute("images",images);
		model.addAttribute("pb",pb);
		model.addAttribute("EqualLists",EqualLists);
		
		return gotoPage;
	}
}
