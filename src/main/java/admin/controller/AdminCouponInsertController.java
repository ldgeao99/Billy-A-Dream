package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import coupon.model.CouponBean;
import coupon.model.CouponDao;
import util.DateParse;

@Controller
public class AdminCouponInsertController {
	private final String command="insertCoupon.admin";
	private String getPage="insertCoupon";
	private String gotoPage="redirect:/coupon.admin";
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String getInsert() {
		return getPage;
	}
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String gotoInsert(@ModelAttribute("coupon") CouponBean coupon) {
		couponDao.insertCoupon(coupon);
		int dif = DateParse.dateDif(coupon.getStartdate(),coupon.getEnddate());
		for(int i=0;i<dif;i++) {
			
		}
		return gotoPage;
	}
}
