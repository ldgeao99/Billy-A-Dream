package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import reservation.model.ReservationDao;

@Controller
public class ProductAcceptController {
	
	private final String command = "acceptProduct.prd";
	
	@Autowired
	private ReservationDao rdao;
	
	@ResponseBody
	@RequestMapping(command)
	public String ProductAccept(@RequestParam("rno")String rno) {
		System.out.println("rno:"+rno);
		
		rdao.updateAccept(rno);
		
		return "yes";
	}
}
