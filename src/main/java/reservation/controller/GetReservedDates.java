package reservation.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import wishlist.model.WishlistDao;

@Controller
public class GetReservedDates {
	private final String command = "getReservedDates.rsv";
	
	@Autowired
	ReservationDao rdao;
	
	@ResponseBody // 해당 메서드가 반환한 것을 jsp 파일이 아닌 객체 그대로 전달한다. 
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String getReservedDates(@RequestParam("no") String pno) {
		
		String result = null;
		
		List<ReservationBean> lists = rdao.getAllReservationOnlyDates(pno);
		
		for(int i = 0; i<lists.size(); i++) {
			ReservationBean rb = lists.get(i);
			
			if(i == 0) {
				result = rb.getStart_date() + "," + rb.getEnd_date();
			}else {
				result += "|" + rb.getStart_date() + "," + rb.getEnd_date();
			}
		}
	
		return result;
	}
}