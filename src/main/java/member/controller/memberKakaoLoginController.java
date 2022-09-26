package member.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberIpBean;
import member.model.MemberIpDao;

@Controller
public class memberKakaoLoginController {

	
	private final String command = "kakaologin.mb";
	private String gotoPage = "KakaoRegister";
	private final String command2 = "kakaoSucessLogin.mb";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private MemberIpDao midao;
	
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String kakaologin(@RequestParam("name")String name,@RequestParam("email")String email,
							Model model) {
		
		model.addAttribute("name",name);
		model.addAttribute("email",email);
		return gotoPage;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value=command2,method = RequestMethod.POST)
	public String kakaologinPost(@RequestParam("email")String id,HttpSession session,
			Model model) throws UnknownHostException {
		
		System.out.println("여기옴");
		
		MemberBean mb = mdao.getById(id); 
		
		String ip = Inet4Address.getLocalHost().getHostAddress();
		
		boolean flag = false;
		
		if (mb != null) { 
			
			if(mb.getIsblacklist().equals("0")){
							
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
			else 
				return "black";
		}
		
		return "ye";
	}
	
}
