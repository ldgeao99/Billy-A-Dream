package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import coupon.model.CouponBean;
import coupon.model.CouponDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
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
	
	@RequestMapping(command)
	public String login( Model model,HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		MemberBean mb = mdao.getById(id);
		
		//구매자의 구매내역
		List<ReservationBean> buyrb =  rdao.getAllByBuyer_no(String.valueOf( mb.getMno()));//아이디에 해당하는 예약내역 가져옴
		
		//판매자의 물품 승인 및 철회 내역
		List<ReservationBean> sellrb = rdao.getAllByMno(mb.getMno()); 
		
		
		List<CouponBean> lists = null; // 쿠폰 가져오기
		if(mb.getCoupon()!=null) {
			String[] couponLists = mb.getCoupon().split(",");
			lists = cdao.getAllByNo(couponLists);
		}
		
		
		
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
		
		
		
		model.addAttribute("buyrb",buyrb);
		model.addAttribute("sellrb",sellrb);
		model.addAttribute("couponLists",lists);
		model.addAttribute("plists",plists);
		model.addAttribute("mb",mb);
		return gotoPage;
	}
}
