package reservation.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.HandlerBase;

import member.model.MemberBean;
import member.model.MemberDao;
import reservation.model.ReservationDao;

@Controller
public class CheckReservationPnoController {

	private final String command = "CheckReservaionPno.rsv";
	
	@Autowired
	private ReservationDao rdao;
	
	@Autowired
	private MemberDao mdao;
	
	
	@ResponseBody
	@RequestMapping(command)
	public String CheckReservationPno(@RequestParam("pno")String pno,HttpSession session) {
		
		String id =(String)session.getAttribute("id");
		
		MemberBean mb = mdao.getById(id);
		
		Map<String, String>map = new HashMap<String, String>();
		map.put("buyer_no", String.valueOf(mb.getMno()));
		map.put("product_no", pno);
		
		int count = rdao.CheckReviewAuth(map);
		
		if(count>0) {
			return "yes";
		}
		
		return "no";
	}
}
