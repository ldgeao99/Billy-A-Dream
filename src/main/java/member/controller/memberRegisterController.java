package member.controller;



import java.net.Inet4Address;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberIpBean;
import member.model.MemberIpDao;
import member.model.sendEMAIL;

@Controller
public class memberRegisterController {
	
	private final String command = "register.mb";
	private String getPage = "register";
	private String gotoPage = "redirect:login.mb";
	
	@Autowired
	private MemberDao mdao;
	@Autowired
	private MemberIpDao midao;
	
	@RequestMapping(value = command , method = RequestMethod.GET)
	public String register() {
		
		return getPage;
	}
	
	@RequestMapping(value = command , method = RequestMethod.POST)
	public String register(MemberBean mb) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(mb.getPw());// 占쏙옙占쏙옙占쏙옙 pw 占쏙옙호화
		Map<String,String>map = new HashMap<String,String>();// ip 占쏙옙臼占� 占십울옙占쏙옙 mno, ip
		
		
		
		// 회占쏙옙占쏙옙占쏙옙占쌜억옙
		mb.setPw(securePassword);
		mdao.InsertMember(mb); 
		
		
		//ip 占쏙옙占쏙옙訪占�
		mb = mdao.getById(mb.getId());// mno 占쏙옙 primary key 占쏙옙占쏙옙漫占� mno占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙
		String ip = Inet4Address.getLocalHost().getHostAddress();// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
		
		map.put("ip", ip);
		map.put("mno", String.valueOf(mb.getMno()));
		
		
		midao.InsertIp(map); // 占쏙옙占쏙옙占쏙옙 占쏙옙占�
		
		String msg = "[Biily A Dream]   "+mb.getName()+"占쏙옙占쏙옙 회占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占싹드립占싹댐옙. 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쌉뀐옙 Billy A Dream占쏙옙 占싱뀐옙占쏘갈 占쏙옙占싸곤옙占쏙옙 占실셨쏙옙占싹댐옙. 占쏙옙占쏙옙占쌌니댐옙.";
		
		//sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream] 회占쏙옙占쏙옙占쏙옙 占쏙옙占싹드립占싹댐옙.", msg);
		
		return gotoPage;
	}
}
