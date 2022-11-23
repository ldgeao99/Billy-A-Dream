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
			
			// 한묶음 묶어서 url 보내기
			MemberBean mb=  mdao.getById(id); // 아이디에 해당하는 레코드 가져오기
			
			ReservationBean rb = new ReservationBean();  // 이렇게해서 session 처리
			
			rb.setProduct_no(no);
			rb.setBuyer_no(mb.getMno());
			rb.setStart_date(start_date);
			rb.setEnd_date(end_date);
			rb.setAmount(price);
			
			session.setAttribute("rb", rb);
			
			try {
			
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); // 갈 서버
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();//요청하는 클라이언트랑 요청을 받는 카카오페이서버를 연결해주는 연결다리;
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 4c0bb93a3847e475f914d28db4a3aabf");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true); // connection에는 doin dooutput 있는데 연결을 통해 서버한테 전해줄 것이 있는가 없는가 있으면 true
			String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+pname+"&quantity=1&total_amount="+price+"&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8080/realnew/sucessBuy.prd&fail_url=http://localhost:8080/realnew/buy.prd?no="+no+"&cancel_url=http://localhost:8080/realnew/buy.prd?no="+no;
			OutputStream out = conn.getOutputStream(); //서버에 전달해야함 뭔가를 줄 수 있음.
			DataOutputStream  dataout = new DataOutputStream(out);// 데이터 주는애
			dataout.writeBytes(parameter); // 문자를 넣어주면 bytes로 바꿔서 해줌. // 가지고있다.
			dataout.close();//  flush 하고 닫고  가지고있던걸 보낸다.
			
			int result = conn.getResponseCode();// 통신하는 부분

			InputStream  in;// 받은애
			if(result == 200) { // http코드에서 정상적인 코드는 200 , 그외는 에러임
				in = conn.getInputStream();//받기만함
			}
			else {
				in = conn.getErrorStream(); // 에러를 받는다.
			}
			
			InputStreamReader reader = new InputStreamReader(in);// 읽는애
			
			
			BufferedReader br = new BufferedReader(reader);// 형변환함
			return br.readLine(); // 문자열로 형변환해서 옴
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "no"; //{\result\":\"NO\"}
	}
}
