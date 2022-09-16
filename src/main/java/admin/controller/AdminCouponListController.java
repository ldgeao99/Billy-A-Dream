package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import coupon.model.CouponBean;
import coupon.model.CouponDao;

@Controller
public class AdminCouponListController {
	private final String command="coupon.admin";
	private String getPage="coupon";
	
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(command)
	public String getMain(Model model) {
		List<CouponBean> lists=couponDao.selectCouponList();
		model.addAttribute("lists", lists);
		return getPage;
	}
}
