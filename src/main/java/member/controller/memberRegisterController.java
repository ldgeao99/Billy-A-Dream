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
	private String gotoPage = "redirect:/";
	
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
		String securePassword = encoder.encode(mb.getPw());// 가져온 pw 암호화
		Map<String,String>map = new HashMap<String,String>();// ip 등록에 필요한 mno, ip
		
		
		
		// 회원가입작업
		mb.setPw(securePassword);
		mdao.InsertMember(mb); 
		
		
		//ip 등록작업
		mb = mdao.getById(mb.getId());// mno 를 primary key 등록해서 mno를 기준으로 함
		String ip = Inet4Address.getLocalHost().getHostAddress();// 아이피 가져오기
		
		map.put("ip", ip);
		map.put("mno", String.valueOf(mb.getMno()));
		
		
		midao.InsertIp(map); // 아이피 등록
		
		String msg = "[Biily A Dream]   "+mb.getName()+"님의 회원가입을 축하드립니다. 앞으로 저희와 함께 Billy A Dream을 이끌어갈 주인공이 되셨습니다. 감사합니다.";
		
		sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream] 회원가입 축하드립니다.", msg);
		
		return gotoPage;
	}
}
