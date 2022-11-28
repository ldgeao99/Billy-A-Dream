package member.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberIpBean;
import member.model.MemberIpDao;

@Controller
public class memberLoginController {
	
	
	private final String command = "login.mb";
	private String getPage = "login";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private MemberIpDao midao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)
	public String login() {
		
		return getPage;
	}
	
	@ResponseBody
	@RequestMapping(value = command , method = RequestMethod.POST)
	public String login(@RequestParam("id")String id,@RequestParam("pw")String pw,HttpSession session) throws UnknownHostException {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		
		MemberBean mb = mdao.getById(id); 
		
		String ip = Inet4Address.getLocalHost().getHostAddress();
		
		boolean flag = false;
		
		if (mb != null) { 
			String getpw = mb.getPw();

			if (getpw != null) {
				

				if (encoder.matches(pw, getpw)) {
					System.out.println("isblackList:"+mb.getIsblacklist());
					if(mb.getIsblacklist().equals("0")) {
						
						if (id.equals("admin")) {
							session.setAttribute("id", id);
							return "admin";
						} else {
							
							List<MemberIpBean> lists = midao.getAllByMno(mb.getMno()); 
							
							for (MemberIpBean mib : lists) {
								if (ip.equals(mib.getIp())) { 
									session.setAttribute("id", id);
									flag = true;
									return "yes";
								}
							}
							if (!flag) { 
								return "Insertip";
							}
						}
						
					}
					else {
						return "black";
					}
				}
			}
		}
		/*
		if(request.getAttribute("destination").equals(null)) {
			return (String)request.getAttribute("destination");
		}
		*/
		
		return "ye"; 
	}
}
