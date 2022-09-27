package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectBean;
import contect.model.ContectDao;
import coupon.model.CouponBean;
import coupon.model.CouponDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import util.DateParse;
import wishlist.model.WishlistBean;
import wishlist.model.WishlistDao;

@Controller
public class memberMyPageController {
	
	private final String command = "mypage.mb";
	private String gotoPage = "mypage";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private CouponDao cdao;
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private WishlistDao wdao;
	
	@Autowired
	private ReservationDao rdao;
	
	@Autowired
	private ContectDao contectDao;
	
	@RequestMapping(command)
	public String login( Model model,HttpSession session,HttpServletResponse response,@RequestParam(value="select",required = false)String select) throws IOException {
		
		String id = (String)session.getAttribute("id");
		MemberBean mb = mdao.getById(id);
		 
		List<ReservationBean> buyrb =  rdao.getAllByBuyer_no(String.valueOf( mb.getMno()));
		
		List<ReservationBean> sellrb = rdao.getAllByMno(mb.getMno()); 
		System.out.println("sellrb:"+sellrb);
		List<CouponBean> lists = null;
		if(mb.getCoupon()!=null) {
			String[] couponLists = mb.getCoupon().split(",");
			lists = cdao.getAllByNo(couponLists);
		}
		
		
		/* get plists(=wishlist items) */
		List<WishlistBean> wishList = wdao.getWishListByMno(String.valueOf(mb.getMno())); // some product numbers
		List<ProductBean> plists = null;
		
		if(wishList.size() != 0) {
			String[] pnoLists = new String[wishList.size()];
			
			for(int i = 0; i<wishList.size(); i++) {
				int product_no = wishList.get(i).getProduct_no();
				pnoLists[i] = String.valueOf(product_no); 
			}
			
			plists = pdao.getAllByNo(pnoLists);
				
			for(ProductBean image : plists) {
				image.setImages(image.getImages().split(",")[0]);
			}
		}
		
		/* get selling_plist */
		List<ProductBean> selling_plists = pdao.getByseller_no(String.valueOf(mb.getMno()));
		
		for(ProductBean pb : selling_plists) { // to show only first picture
			pb.setImages(pb.getImages().split(",")[0]);
		}
		
		/* get contect_list*/
		List<ContectBean> contect_lists= contectDao.selectMyContect(mb.getMno());
		/* contect_list.reg_date dateparse*/
		for(ContectBean c : contect_lists) {
			c.setReg_date(DateParse.strToDate(DateParse.day(c.getReg_date())));
		}
		
		
		/* set model */
		model.addAttribute("contectlist",contect_lists);
		model.addAttribute("buyrb",buyrb);
		model.addAttribute("sellrb",sellrb);
		model.addAttribute("couponLists",lists);
		model.addAttribute("plists",plists);					// = wishlist items
		model.addAttribute("selling_plists",selling_plists);	
		model.addAttribute("mb",mb);

		model.addAttribute("contect_lists",contect_lists); 

		
		
		response.setContentType("text/html; charset=UTF-8"); // 내보내는것의 한글처리
		PrintWriter writer = response.getWriter(); // 웹브라우저와 연결다리 담당
		
		System.out.println("select:"+select);
		writer.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>");
		if(select==null) {
		 
		}
		else if(select.equals("2")) {
			writer.println("<script>$(function(){document.getElementById('order').click();})</script>"); 
		}
		else if(select.equals("3")) {
			writer.println("<script>$(function(){document.getElementById('wish').click();})</script>"); 
		}
		else if(select.equals("4")) {
			writer.println("<script>$(function(){document.getElementById('sell').click();})</script>"); 
		}
		else if(select.equals("5")) {
			writer.println("<script>$(function(){document.getElementById('coupon').click();})</script>"); 
		}
		else if(select.equals("6")) {
			writer.println("<script>$(function(){document.getElementById('updateMem').click();})</script>"); 
		}
       	
		writer.flush(); 
		
		

		return gotoPage;
	}
}
