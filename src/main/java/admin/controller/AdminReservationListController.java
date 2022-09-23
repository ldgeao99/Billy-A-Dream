package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import product.model.ProductDao;
import reservation.model.ReservationDao;
import reservation.model.ReservationDetailBean;

@Controller
public class AdminReservationListController {
	private final String command="memberReservationList.admin";
	private String getPage="listMemberReservation";
	@Autowired
	MemberDao memberDao; 
	@Autowired
	ReservationDao reservationDao;
	
	@RequestMapping(command)
	public String getList(Model model,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		List<ReservationDetailBean> lists= reservationDao.getAllResrvation(map);
		model.addAttribute("lists", lists);
		return getPage;
	}
}
