package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import room.model.roomBean;
import room.model.roomDao;

@Controller
public class allChattingController {
	
	private final String command = "allchatting.mb";
	private String gotoPage = "allchatting"; 
	 
	@Autowired
	private roomDao rdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private ProductDao pdao;
	
	
	@RequestMapping(value=command , method = RequestMethod.GET) 
	public String allChatting(HttpSession session,Model model) {
		String id =(String)session.getAttribute("id");
		MemberBean mb = mdao.getById(id);
		model.addAttribute("name",mb.getName());
		return gotoPage; 
	}
	
	@ResponseBody
	@RequestMapping(value=command , method = RequestMethod.POST,produces = "application/text;charset=utf8")
	public String allGetRoomList(HttpSession session) {
		System.out.println("요청받음");
		String id = (String)session.getAttribute("id");
		MemberBean loginmb = mdao.getById(id);
		List<roomBean>rb = rdao.searchRoomById(loginmb.getMno());
		
		int i=0;
		String listJson = "";
		for(roomBean r :rb) {
			
			MemberBean mb = mdao.getByMno(r.getMno1());
			MemberBean mb2 = mdao.getByMno(r.getMno2()); // 두번째가 판매자임
			ProductBean pb = pdao.getByNo(String.valueOf(r.getPno())); // 상품번호에 따른 productbean 이미지 가져오기위해
			
			String userid;
			String name; 
			if(id.equals(mb.getId())) {
				name = mb2.getName();
				userid=mb2.getId();
			}
			else {
				name = mb.getName();
				userid=mb.getId();
			}
			// 이미지가 여러개이기 때문에 첫번째꺼만 넘겨줘야함.
			String[] images = pb.getImages().split(",");
			pb.setImages(images[0]);
			
			listJson+=+r.getNo()+","+r.getRoom_no()+","+name+","+pb.getImages()+","+userid;
			if(rb.size()-1!=i) {
				listJson+= "|";
			}
			i++;
		}
		System.out.println(listJson);
		return listJson; 
	}
}
