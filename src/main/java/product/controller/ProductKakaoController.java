package product.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import reservation.model.ReservationBean;

@Controller
public class ProductKakaoController {
	
	private final String command = "kakaobuy.prd";
	
	
	
	@Autowired
	private MemberDao mdao;
	
	@ResponseBody
	@RequestMapping(value=command)
	public String kakaobuy(@RequestParam("no")int no ,@RequestParam("pname")String pname, @RequestParam("price")int price,
							@RequestParam("start_date")	String start_date,	@RequestParam("end_date")	String end_date,@RequestParam("id") String id,
							HttpSession session) {
			
			MemberBean mb=  mdao.getById(id); 
			
			ReservationBean rb = new ReservationBean();  
			
			rb.setProduct_no(no);
			rb.setBuyer_no(mb.getMno());
			rb.setStart_date(start_date);
			rb.setEnd_date(end_date);
			rb.setAmount(price);
			
			session.setAttribute("rb", rb);
			
			try {
			
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 4c0bb93a3847e475f914d28db4a3aabf");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true); 
			String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+pname+"&quantity=1&total_amount="+price+"&vat_amount=200&tax_free_amount=0&approval_url=http://15.165.105.57:8080/sucessBuy.prd&fail_url=http://15.165.105.57:8080/buy.prd?no="+no+"&cancel_url=http://15.165.105.57:8080/buy.prd?no="+no;
			OutputStream out = conn.getOutputStream(); 
			DataOutputStream  dataout = new DataOutputStream(out);
			dataout.writeBytes(parameter);
			dataout.close();
			
			int result = conn.getResponseCode();

			InputStream  in;
			if(result == 200) { 
				in = conn.getInputStream();
			}
			else {
				in = conn.getErrorStream(); 
			}
			
			InputStreamReader reader = new InputStreamReader(in);
			
			
			BufferedReader br = new BufferedReader(reader);
			return br.readLine(); 
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "no"; //{\result\":\"NO\"}
	}
}
