package product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import reservation.model.ReservationBean;
import reservation.model.ReservationDao;

@Controller
public class ProductSucessBuyController {

	
	
	@Autowired
	private ReservationDao rdao;
	
	
	@RequestMapping(value="sucessBuy.prd",method = RequestMethod.GET) //寃곗�� �깃났��硫� �댁そ�쇰�����
	public String BeforeBuy(HttpSession session) {

		return "productBeforeBuy";
	}
	
	
	@RequestMapping(value="after.prd",method = RequestMethod.GET) // jsp媛��ㅺ� �쇰��ㅼ������ productSucessBuy濡� 媛� ����李� �リ린����
	public String sucessBuy(HttpSession session,Model model) {
		
		
		ReservationBean rb =(ReservationBean)session.getAttribute("rb");
		
		System.out.println("pno:"+rb.getProduct_no());
		System.out.println("mno:"+rb.getBuyer_no());
		System.out.println("sdata:"+rb.getStart_date());
		System.out.println("edate:"+rb.getEnd_date());
		
		rdao.InsertReservation(rb);
		
		return "productSucessBuy";
	}
}

//return "productSucessBuy";
