package wishlist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import wishlist.model.WishlistDao;

@Controller
public class GetLikeCount {
	private final String command = "getLikeCount.wish";
	
	@Autowired
	WishlistDao wdao;
	
	@ResponseBody // 해당 메서드가 반환한 것을 jsp 파일이 아닌 객체 그대로 전달한다. 
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String getUserAddress(@RequestParam("no") String pno) {
		int count = wdao.getCountWishMembers(pno);
		return String.valueOf(count);
	}
}