package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import coupon.model.CouponBean;
import coupon.model.CouponDao;

@Controller
public class AdminCouponListController {
	private final String command="coupon.admin";
	private String getPage="listCoupon";
	
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(command)
	public String getMain(Model model,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		List<CouponBean> lists=couponDao.selectCouponList(map);
		model.addAttribute("lists", lists);
		return getPage;
	}
}
