package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.getRandomPassword;
import member.model.sendEMAIL;

@Controller 
public class checkController {
	
	
	@Autowired
	private MemberDao mdao;
	
	
	
	@ResponseBody 
	@RequestMapping("idcheck.mb")
	public String idcheck(@RequestParam("id") String id) {
		
		int cnt = mdao.idCheck(id);
		
		if(cnt>0)
			return "no";
		
		return "yes";
	}
	
	
	@ResponseBody 
	@RequestMapping("findid.mb")
	public String FindID(@RequestParam("name") String name,@RequestParam("hp") String hp) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("hp", hp);
		
		String id = mdao.FindId(map); 
		if( id != null) {
			return id;
		}
		
		return "null";
	}
	
	
	@ResponseBody 
	@RequestMapping("findpw.mb")
	public String FindPW(@RequestParam("id") String id,@RequestParam("hp") String hp) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("hp", hp);
		
		int result = mdao.FindPW(map);
		String temporaryPw = getRandomPassword.tempPassword(8);
		System.out.println("�엫�떆鍮꾨�踰덊샇 :"+temporaryPw);
		String securePassword = encoder.encode(temporaryPw);
		
		if(result>0) {
			
			map.put("id", id);
			map.put("securePassword", securePassword);
			
			MemberBean mb = mdao.getById(id);
			
			int cnt = mdao.resetPW(map);
			System.out.println(""+cnt);
			
			sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream]", "[Billy A Dream]  ' "+temporaryPw+" ' .");
			return "yes";
		}
		else {
			return "null";
		} 
	}
	@ResponseBody 
	@RequestMapping("quitPw.mb")
	public String quitPw(@RequestParam("id") String id,@RequestParam("pw") String pw,HttpSession session) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberBean mb = mdao.getById(id);
		
		if(encoder.matches(pw, mb.getPw())){
			mdao.deleteMember(id);
			session.invalidate(); 
			return "yes";
		}
		return "null";
	}
	@ResponseBody 
	@RequestMapping("ipHpCheck.mb")
	public String ipHpCheck(@RequestParam("id") String id,@RequestParam("hp") String hp,HttpSession session) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("hp", hp);
		
		int cnt = mdao.ipHpCheck(map);
		
		if(cnt>0) {
			return "";
		}
		
		return "null";
	}

}
