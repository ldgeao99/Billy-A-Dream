package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import coupon.model.CouponBean;
import coupon.model.CouponDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;

@Controller
public class ProductBuyFormController {
	
	private final String command = "buy.prd";
	private String gotoPage="productBuyForm";
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private ReservationDao rdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private CouponDao cdao;
	
	
	@RequestMapping(value= command, method = RequestMethod.GET)
	public String buy(@RequestParam("no")String no, Model model,
			HttpServletRequest session) {
		
		ProductBean pb = pdao.getByNo(no);
		pb.setImages(pb.getImages().split(",")[0]);
		String id=session.getParameter("id");
		System.out.println(id);
		MemberBean mb=mdao.getById(id);
		System.out.println(mb.getCoupon());
		List<CouponBean> lists = null;
		if(mb.getCoupon()!=null) {
			String[] couponLists = mb.getCoupon().split(",");
			lists = cdao.getAllByNo(couponLists);
			System.out.println(100);
		}
		//System.out.println(lists.size());
		List<ReservationBean> rlist = rdao.getAllReservationOnlyDates(no);
		
		model.addAttribute("pb",pb);
		model.addAttribute("rlist",rlist);
		model.addAttribute("couponList",lists);
		
		
		return gotoPage;
	}
}
