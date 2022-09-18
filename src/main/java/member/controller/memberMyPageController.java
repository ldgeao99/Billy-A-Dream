package member.controller;

import java.util.List;

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
	
	@RequestMapping(command)
	public String login(@RequestParam("id")String id,Model model) {
		
		MemberBean mb = mdao.getById(id);
		
		List<CouponBean> lists = null; // 쿠폰내역
		if(mb.getCoupon()!=null) {
			String[] couponLists = mb.getCoupon().split(",");
			lists = cdao.getAllByNo(couponLists);
		}
		
		//관심목록
		List<ProductBean> plists = null;
		if(mb.getLikePnum()!=null) {
			String[] productLists = mb.getLikePnum().split(",");
			plists = pdao.getAllByNo(productLists);
			for(ProductBean image : plists) {
				image.setImages(image.getImages().split(",")[0]); // 판매자의 다른 상품이미지 보여주려면 다 가져오면 안되니 첫번째꺼만 가져옴.
			}
		}
		
		
		model.addAttribute("couponLists",lists);
		model.addAttribute("plists",plists);
		model.addAttribute("mb",mb);
		return gotoPage;
	}
}
