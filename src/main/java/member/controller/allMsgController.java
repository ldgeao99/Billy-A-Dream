package member.controller;

import java.util.Date;
import java.util.List;

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
import room.model.roomDao;
import util.DateParse;

@Controller
public class allMsgController {
	private final String command = "getallmsg.mb";
	
	
	@Autowired
	private chatDao cdao;
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private roomDao rdao;
	
	@Autowired
	private MemberDao mdao;
	
	
	@ResponseBody
	@RequestMapping(value=command,produces = "application/text;charset=utf8")
	public String allMsg(@RequestParam("no")int room_no,HttpSession session) {
		
		List<chatBean>lists = cdao.getByRoom_no(room_no);
		
		int i=0;
		String info="";
		for(chatBean c :lists) { //상품이름 , 메세지 , 시간 상품이미지
			ProductBean pb = pdao.getByNo(String.valueOf(c.getPno()));
			
			String[] images = pb.getImages().split(",");
			pb.setImages(images[0]); // 이미지 하나만 가져오기위해
			MemberBean mb = mdao.getByMno(c.getSend_mno()); // 보낸사람
			MemberBean mb2 = mdao.getByMno(c.getRead_mno());
			
			String time = DateParse.time(c.getTime());
			// 두번째mno가 판매자임
			info += pb.getName()+","+c.getContent()+","+time+","+pb.getImages()+","+mb.getId()+","+mb.getName()+","+mb2.getName()+","+room_no+","+pb.getNo();
			 
			if(lists.size()-1!=i) {
				info+= "|";
			}
			i++;
		}
		
		return info;
	}
}
