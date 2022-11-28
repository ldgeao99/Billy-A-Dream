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
		for(chatBean c :lists) { 
			ProductBean pb = pdao.getByNo(String.valueOf(c.getPno()));
			
			String[] images = pb.getImages().split(",");
			pb.setImages(images[0]); 
			MemberBean mb = mdao.getByMno(c.getSend_mno()); 
			MemberBean mb2 = mdao.getByMno(c.getRead_mno());
			
			String time = DateParse.time(c.getTime());
			info += pb.getName()+","+c.getContent()+","+time+","+pb.getImages()+","+mb.getId()+","+mb.getName()+","+mb2.getName()+","+room_no+","+pb.getNo();
			 
			if(lists.size()-1!=i) {
				info+= "|";
			}
			i++;
		}
		//System.out.println(info);
		return info;
	}
}
