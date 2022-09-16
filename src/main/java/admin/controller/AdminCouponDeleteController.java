package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import coupon.model.CouponDao;

@Controller
public class AdminCouponDeleteController {
	private final String command="deleteCoupon.admin";
	private String getPage="redirect:/coupon.admin";
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(command)
	public String deleteCoupon(@RequestParam("no") int no) {
		couponDao.deleteCoupon(no);
		return getPage;
	}
}
