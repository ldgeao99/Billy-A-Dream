package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value= command, method = RequestMethod.GET)
	public String buy(@RequestParam("no")String no, Model model) {
		
		ProductBean pb = pdao.getByNo(no);
		pb.setImages(pb.getImages().split(",")[0]);
		
		
		List<ReservationBean> rlist = rdao.getAllReservationOnlyDates(no);
		
		model.addAttribute("pb",pb);
		model.addAttribute("rlist",rlist);
		
		return gotoPage;
	}
}
