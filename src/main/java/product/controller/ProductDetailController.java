package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import review.model.ReviewBean;
import review.model.ReviewDao;
import scategory.model.ScategoryDao;
import util.DateParse;
import util.PagingProduct;
import util.PagingReview;

@Controller
public class ProductDetailController {

	
	private final String command = "productdetail.prd";
	private String gotoPage = "productDetail";
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private MemberDao mdao; 
	
	@Autowired
	private LcategoryDao ldao;
	
	@Autowired
	private ScategoryDao sdao;
	
	@Autowired
	private ReviewDao rdao;
	
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("no") String no,Model model,@RequestParam(value="write",required = false)String write,
							HttpServletResponse response,HttpServletRequest request,
							@RequestParam(value="pageNumber",required = false)String pageNumber,
							HttpSession session) throws IOException {
		
		
		pdao.updateView_count(no);
		
		//product object will be shown
		ProductBean pb = pdao.getByNo(no);
		
		String id = (String)session.getAttribute("id");
		MemberBean loginmb = null; 
		if(id != null) {
			 loginmb = mdao.getById(id);
		}else {
			loginmb = mdao.getByMno(pb.getSeller_no());
		}
		
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
		
		
		//productgetReview
		int totalCount = rdao.getTotalCount(no);
				
		String url = request.getContextPath()+"/"+command+"?no="+no+"&write=2";

		PagingReview pageInfo = new PagingReview(pageNumber,"4",totalCount,url,null);
			
		int TotalStar=0;
		int ReviewAverage=0;
		List<ReviewBean>reviewlists = rdao.getReviewList(pageInfo,no);
		
		//dateParse && Average
		if(reviewlists.size()>0) {
			
		for(ReviewBean r : reviewlists) {
			r.setWriteday(DateParse.strToDate(DateParse.day(r.getWriteday()))); // change time
			
			TotalStar+= r.getRating();
			
			MemberBean wmb = mdao.getByMno(r.getMno());
			r.setWriterName(wmb.getName());
		}
		ReviewAverage = Math.round(TotalStar/reviewlists.size());
		}
		
		
		
		model.addAttribute("ReviewAverage",ReviewAverage);
		model.addAttribute("reviewlists",reviewlists);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("totalCount",totalCount);
		
		pb.setId((mb.getId()));
		model.addAttribute("loginmb",loginmb);
		model.addAttribute("mb",mb);
		model.addAttribute("lists",lists);
		model.addAttribute("images",images);
		model.addAttribute("pb",pb);
		model.addAttribute("EqualLists",EqualLists);
		
		System.out.println("�ш린��");
		if(write!=null) {
			
		if(write.equals("1")) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter(); 
			writer.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>");
			writer.println("<script>$(function(){document.getElementById('reviewt-tab').click();})</script>"); 
			writer.println("<script>$(function(){document.getElementById('write').click();})</script>"); 
			writer.flush();
		}
		else if(write.equals("2")) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter(); 
			writer.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>");
			writer.println("<script>$(function(){document.getElementById('reviewt-tab').click();})</script>"); 
			writer.flush();
		}
		}
       	
		
		return gotoPage;
	}
}
