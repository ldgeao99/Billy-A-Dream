package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	public String detailForm(@RequestParam("no") String no,Model model,@RequestParam(value="write",required = false)String write,HttpServletResponse response) throws IOException {
		
		pdao.updateView_count(no);
		
		//product object will be shown
		ProductBean pb = pdao.getByNo(no);
		
		//seller's products
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
		
		System.out.println("여기옴");
		if(write!=null) { // 후기작성하기 누르면 
			response.setContentType("text/html; charset=UTF-8"); // 내보내는것의 한글처리
			PrintWriter writer = response.getWriter(); // 웹브라우저와 연결다리 담당
			writer.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>");
			writer.println("<script>$(function(){document.getElementById('reviewt-tab').click();})</script>"); 
			writer.println("<script>$(function(){document.getElementById('write').click();})</script>"); 
			writer.println("<script>$(function(){var offset = $('#writediv').offset(); $('html, body').animate({scrollTop: offset.top},400); })</script>"); 
			writer.flush();
		}
       	
		
		return gotoPage;
	}
}
