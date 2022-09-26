package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;

@Controller
public class AdminReservationWithdrawController {
	private final String command="withdrawReservation.admin";
	private String getPage="redirect:/memberReservationList.admin";
	@Autowired
	MemberDao memberDao; 
	@Autowired
	ReservationDao reservationDao;
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String getWithdraw(
			@RequestParam(value="no",required = false) int no,
			@RequestParam(value="notice",required = false) String notice) {

		reservationDao.withdrawReservation(no);



		return getPage;
	}
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String getRollback(
			@RequestParam(value="no",required = false) int no,
			@RequestParam(value="notice") String notice) {
		ReservationBean rs=new ReservationBean();
		rs.setNo(no);
		rs.setNotice(notice);
		reservationDao.rollbackWithdrawReservation(rs);


		return getPage;
	}
}
