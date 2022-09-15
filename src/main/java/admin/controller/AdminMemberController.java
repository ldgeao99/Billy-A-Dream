package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class AdminMemberController {
	private final String command="member.admin";
	private String getPage="memberList";
	@Autowired
	MemberDao memberDao; 
	@RequestMapping(command)
	public String getList(Model model,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword) {
		Map<String, String> map=new HashMap<String, String>();//�˻��� ������� map
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		List<MemberBean> lists= memberDao.selectMemberList(map);
		model.addAttribute("lists", lists);
		return getPage;
	}
}
