package member.controller;

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
public class sendRoomMsgController {

	private final String command = "sendRoomMsg.mb";
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private roomDao rdao;
	
	@Autowired
	private chatDao cdao;
	
	
	
	@ResponseBody
	@RequestMapping(command)
	public String sendRoomMsg(@RequestParam("room_no")int room_no,@RequestParam("msg") String msg, HttpSession session) {
		System.out.println("msg:"+msg);
		String id = (String)session.getAttribute("id");
		MemberBean mb = mdao.getById(id);
		
		roomBean rb = rdao.getByRoom_no(room_no);
		
		chatBean cb = new chatBean();
		
		if(rb.getMno1()==mb.getMno()) { // 
			cb.setSend_mno(rb.getMno1());
			cb.setRead_mno(rb.getMno2());
		}
		else {
			cb.setSend_mno(rb.getMno2());
			cb.setRead_mno(rb.getMno1());
		}
		cb.setRoom_no(room_no);
		cb.setContent(msg);
		cb.setPno(rb.getPno());
		
		cdao.sendMsg(cb);
		
		return "";
	}
	
}
