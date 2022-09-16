package member.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberIpDao;

@Controller
public class memberInsertIpController {

	private final String command = "Insertip.mb";
	private String getPage = "IpRegister";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private MemberIpDao midao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String ip(@RequestParam("id")String id,Model model) {
		
		MemberBean mb = mdao.getById(id);
		model.addAttribute("id",id);
		model.addAttribute("name",mb.getName());
		return getPage;
	}
	
	
	@RequestMapping( value = command , method = RequestMethod.POST)
	public String ipInsert(@RequestParam("id")String id,Model model, HttpSession session) throws UnknownHostException {
		
		Map<String, String> map = new HashMap<String, String>();
		MemberBean mb = mdao.getById(id);
		
		String ip = Inet4Address.getLocalHost().getHostAddress();
		
		map.put("mno", String.valueOf(mb.getMno()));
		map.put("ip", ip);
		
		midao.InsertIp(map);
		
		session.setAttribute("id", id);
		
		return "redirect:home";
	}
}
