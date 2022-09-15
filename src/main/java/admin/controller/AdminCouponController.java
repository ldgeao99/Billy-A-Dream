package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCouponController {
	private final String command="coupon.admin";
	private String getPage="coupon";
	
	@RequestMapping(command)
	public String getMain() {
		return getPage;
	}
}
