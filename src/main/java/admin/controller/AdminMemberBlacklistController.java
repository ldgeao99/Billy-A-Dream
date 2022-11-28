package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import reservation.model.ReservationDetailBean;

@Controller
public class AdminMemberBlacklistController {
	private final String command="blacklist.admin";
	private String getPage="redirect:/member.admin";
	@Autowired
	MemberDao memberDao; 
	@RequestMapping(command)
	public String changeBlacklist(@RequestParam("mno") int mno,
			@RequestParam("check") String check) {
		MemberBean member=new MemberBean();
		member.setMno(mno);
		member.setIsblacklist(check);
		memberDao.changeBlacklist(member);
		
		return getPage;
	}
}
