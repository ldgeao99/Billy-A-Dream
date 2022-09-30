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
	
	
	
	//===========// 占쏙옙占싱듸옙 占쌩븝옙체크================================
	@ResponseBody 
	@RequestMapping("idcheck.mb")
	public String idcheck(@RequestParam("id") String id) {
		
		int cnt = mdao.idCheck(id);
		
		if(cnt>0)
			return "no";
		
		return "yes";
	}
	
	
	//=======// 占쏙옙占싱듸옙 찾占쏙옙===================================
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
	
	
	//==========// 占쏙옙橘占싫� 찾占쏙옙==============================================
	@ResponseBody 
	@RequestMapping("findpw.mb")
	public String FindPW(@RequestParam("id") String id,@RequestParam("hp") String hp) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("hp", hp);
		
		int result = mdao.FindPW(map);
		String temporaryPw = getRandomPassword.tempPassword(8);// 占쏙옙占쏙옙占싸울옙占쏙옙 占쏙옙橘占싫�
		System.out.println("�엫�떆鍮꾨�踰덊샇 :"+temporaryPw);
		String securePassword = encoder.encode(temporaryPw);// 占쏙옙占쏙옙占싸울옙占쌔쇽옙 占쏙옙호화 占쏙옙占쏙옙
		
		if(result>0) {
			
			map.put("id", id);
			map.put("securePassword", securePassword);
			
			MemberBean mb = mdao.getById(id);// 占쏙옙占싱듸옙 占쌔댐옙占싹댐옙 占싱몌옙占쏙옙 占쏙옙占쏙옙占싶쇽옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			
			int cnt = mdao.resetPW(map);
			System.out.println("임시비밀번호 발송 :"+cnt);
			
			sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream] 임시비밀번호 발송", "[Billy A Dream] 임시비밀번호는 ' "+temporaryPw+" ' 입니다.");
			return "yes";
		}
		else {
			return "null";
		} 
	}
	//==========// 회占쏙옙탈占쏙옙 占쏙옙 占쏙옙橘占싫� 확占쏙옙==============================================
	@ResponseBody 
	@RequestMapping("quitPw.mb")
	public String quitPw(@RequestParam("id") String id,@RequestParam("pw") String pw,HttpSession session) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberBean mb = mdao.getById(id);
		
		if(encoder.matches(pw, mb.getPw())){
			mdao.deleteMember(id);// 회占쏙옙탈占쏙옙
			session.invalidate(); // 占쏙옙占실된곤옙 占쏙옙 占쏙옙占쏙옙
			return "yes";
		}
		return "null";
	}
	//==========// 회占쏙옙탈占쏙옙 占쏙옙 占쏙옙橘占싫� 확占쏙옙==============================================
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