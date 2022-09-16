package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCouponInsertController {
	private final String command="insertCoupon.admin";
	private String getPage="insertCoupon";
	
	@RequestMapping(command)
	public String getMain() {
		return getPage;
	}
}
