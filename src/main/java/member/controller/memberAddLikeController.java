package member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class memberAddLikeController {

	private final String command = "addlike.mb";
	
	@Autowired
	private MemberDao mdao;
	
	@ResponseBody
	@RequestMapping(command)
	public String addlike(@RequestParam("id")String id,@RequestParam("no")String no) {
		
		Map<String, String> map = new HashMap<String, String>();
		MemberBean mb =  mdao.getById(id);
		
		String returnmsg = "";
		
		if(mb.getLikePnum()==null) { // null 이면
			mb.setLikePnum( no);
			returnmsg = "yes";
		}
		else if(mb.getLikePnum().contains(no)){ // 이미 추가되어있으면
			return "no";
		}
		else { // null 도 아니고 포함도 안되어있으면
			mb.setLikePnum(mb.getLikePnum()+","+no);
			returnmsg = "yes";
		}
		map.put("id", id);
		map.put("likePnum", mb.getLikePnum());
		
		mdao.updateLikePnum(map); 
		 
		System.out.println("업데이트하고 추가된 찜목록 :"+mb.getLikePnum());
		return returnmsg;
	}
}
