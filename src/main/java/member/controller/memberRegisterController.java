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
		String securePassword = encoder.encode(mb.getPw());// ������ pw ��ȣȭ
		Map<String,String>map = new HashMap<String,String>();// ip ��Ͽ� �ʿ��� mno, ip
		
		
		
		// ȸ�������۾�
		mb.setPw(securePassword);
		mdao.InsertMember(mb); 
		
		
		//ip ����۾�
		mb = mdao.getById(mb.getId());// mno �� primary key ����ؼ� mno�� �������� ��
		String ip = Inet4Address.getLocalHost().getHostAddress();// ������ ��������
		
		map.put("ip", ip);
		map.put("mno", String.valueOf(mb.getMno()));
		
		
		midao.InsertIp(map); // ������ ���
		
		String msg = "[Biily A Dream]   "+mb.getName()+"���� ȸ�������� ���ϵ帳�ϴ�. ������ ����� �Բ� Billy A Dream�� �̲�� ���ΰ��� �Ǽ̽��ϴ�. �����մϴ�.";
		
		sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream] ȸ������ ���ϵ帳�ϴ�.", msg);
		
		return gotoPage;
	}
}
