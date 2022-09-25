package reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import reservation.model.ReservationDao;

@Controller
public class ChangeStatus {

	private final String command = "changeStatus.rsv";
	
	@Autowired
	private ReservationDao rdao;
	
	
	@ResponseBody
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String changeStatus() {
		
		/* to write use and using /change status for accept reservation  */
		 rdao.changeStatus2(); 
		 
		 rdao.changeStatusfor3();
		return "yes";
	}
}
