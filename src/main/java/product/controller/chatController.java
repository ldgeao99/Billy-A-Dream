package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import chat.model.chatBean;
import chat.model.chatDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import room.model.roomBean;
import room.model.roomDao;

@Controller
public class chatController {

	private final String command = "chat.prd";
	private String gotoPage = "chatting";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private chatDao cdao;
	
	@Autowired
	private roomDao rdao;
	
	@Autowired
	private ProductDao pdao;
	
	@RequestMapping(command)
	public String chat(@RequestParam("no")String pno,HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		MemberBean mb = mdao.getById(id);
		int loginmno = mb.getMno();
		ProductBean pb = pdao.getByNo(pno);
		
		// 두 아이디와 상품번호에 해당하는 방이 있는지 확인
		roomBean rb = new roomBean();
				
		rb.setMno1(loginmno);
		rb.setMno2(pb.getSeller_no());
		rb.setPno(Integer.parseInt(pno));
				
		roomBean rbean = rdao.searchRoom(rb);
		if(rbean==null) {
			Integer maxRoom_no = rdao.getMaxRoom(); // 방번호 최대값 가져오기
			System.out.println("maxroom:"+maxRoom_no);
			if(maxRoom_no!=null) { // 방이 몇개 있을때
				rb.setRoom_no((maxRoom_no+1));
			}
			else { // 방이 아예 없을때
				rb.setRoom_no(1);
			}
			rdao.createRoom(rb); // 방을 하나 만든다.
			rbean = rdao.searchRoom(rb);//그 방을 가져온다.
		}
		// 그 방의 번호를 가지고 메세지들을 넣는다.
		 
		///
		List<chatBean> lists = cdao.getByRoom_no(rbean.getRoom_no());
		 System.out.println("lists사이즈:"+lists.size());
		model.addAttribute("mno",loginmno);
		model.addAttribute("pno",pno);
		model.addAttribute("id",id);
		model.addAttribute("lists",lists);
		return gotoPage;
	}
	
}
