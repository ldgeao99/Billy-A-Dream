package member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import coupon.model.CouponBean;
import coupon.model.CouponDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class memberRegisteCouponController {
	
	private final String command = "registecoupon.mb";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private CouponDao cdao;
	
	@ResponseBody
	@RequestMapping(value= command, method = RequestMethod.GET)
	public String coupon(@RequestParam("code")String code,HttpSession session) {
		
		 CouponBean cb=null;
		 cb = cdao.getByCode(code);
		 String id = (String)session.getAttribute("id");
		 
		 MemberBean mb = mdao.getById(id);
		
		 if(cb!=null && mb.getCoupon()!=null) {
			 if(mb.getCoupon().contains(String.valueOf(cb.getNo()))) {
				 return "exist";
			 }
			 else {
				 return "yes";
			 }
			 
		 }
		 else if(cb!=null && mb.getCoupon()==null) {
			 return "yes";
		 }
		return "";
		 
		 
		
	}
	@RequestMapping(value= command, method = RequestMethod.POST)
	public String coupon2(@RequestParam("code")String code,HttpSession session) {
		
		
		
		 CouponBean cb = cdao.getByCode(code);
		 
		 if(cb!=null) {
			 
		 String no =  String.valueOf(cb.getNo());
		 
		 String id = (String)session.getAttribute("id"); 

		 MemberBean mb = mdao.getById(id);
		 
		 if(mb.getCoupon()==null)
			 mb.setCoupon(no);
		 
		 else 
			 mb.setCoupon(mb.getCoupon()+","+no);
		 
		 
		 Map<String, String>map = new HashMap<String, String>();
		 map.put("id", id);
		 map.put("no", mb.getCoupon());
		 
		 
		 mdao.insertCoupon(map);
		 
		 return "redirect:mypage.mb?select=5";
		 }
		 return "redirect:mypage.mb?select=5";
	}
}
