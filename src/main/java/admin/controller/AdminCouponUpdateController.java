package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import coupon.model.CouponBean;
import coupon.model.CouponDao;

@Controller
public class AdminCouponUpdateController {
	private final String command="updateCoupon.admin";
	private String getPage="updateCoupon";
	private String gotoPage="redirect:/coupon.admin";
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String getUpdate(@RequestParam("no") int no,
			Model model) {
		System.out.println(1);
		CouponBean coupon = couponDao.selectCoupon(no);
		model.addAttribute("coupon", coupon);
		System.out.println(2);
		return getPage;
	}
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String gotoUpdate(@ModelAttribute("coupon") CouponBean coupon) {
		
		return gotoPage;
	}
}
