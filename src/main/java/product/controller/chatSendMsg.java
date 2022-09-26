package product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chat.model.chatBean;
import chat.model.chatDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import room.model.roomBean;
import room.model.roomDao;

@Controller
public class chatSendMsg {

	private final String command = "sendmsg.prd";
	
	@Autowired
	private chatDao cdao;
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private roomDao rdao;
	
	@ResponseBody
	@RequestMapping(command)
	public String chatSendMessage(@RequestParam("sendmsg") String sendmsg,@RequestParam("pno") String pno,
							HttpSession session) {
		
		ProductBean pb = pdao.getByNo(pno);
		String id = (String)session.getAttribute("id");
		MemberBean mb =  mdao.getById(id);
		int loginmno = mb.getMno();
		
		// 두 아이디와 상품번호에 해당하는 방이 있는지 확인
		roomBean rb = new roomBean();
		
		rb.setMno1(loginmno);
		rb.setMno2(pb.getSeller_no());
		rb.setPno(Integer.parseInt(pno));
		
		// 두 아이디와 상품번호에 해당하는 방이 있는지 확인
		roomBean rbean = rdao.searchRoom(rb);
		
		chatBean cbean = new chatBean();
		cbean.setRoom_no(rbean.getRoom_no());
		cbean.setSend_mno(loginmno);
		cbean.setRead_mno(pb.getSeller_no());
		cbean.setContent(sendmsg);
		cbean.setPno(Integer.parseInt(pno));
		
		int result = cdao.sendMsg(cbean);
		
		if(result>0) {
			return "y";
		}
		return "n";
	}
}
