package member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class memberDeletePnumController {

	private final String command = "deletePnum.mb";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String deletePnum(@RequestParam("no")String no,HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		
		MemberBean mb =  mdao.getById(id);
		
		String[] likePnumlist = mb.getLikePnum().split(","); // 일단 관심목록 가져와서 배열로 만들어주고 배열에 있는걸 삭제할거다.
		List<String> lists = new ArrayList<String>(Arrays.asList(likePnumlist)); // 삭제하는것을 쓰기위해 arraylist 로 변환
		System.out.println("배열:"+lists);
		
		int i = 0;
		for(i =0 ; i<lists.size() ; i++) { // index 찾기
			String pnum = lists.get(i);
			if(pnum.contains(no)) {
				break;
			}
		}
		lists.remove(i);
		
		String updatePlists = "";
		for(int j=0; j<lists.size();j++) { // 배열을 String으로 만들어서 저장
			updatePlists += lists.get(j)+",";
		}
		
		System.out.println("수정된 배열:"+updatePlists);
		
		
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("likePnum", String.valueOf(updatePlists));
		
		mdao.updateLikePnum(map); 
		
		return "redirect:mypage.mb";
	}
}
