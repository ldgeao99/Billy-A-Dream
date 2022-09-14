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
	
	
	
	//===========// 아이디 중복체크================================
	@ResponseBody 
	@RequestMapping("idcheck.mb")
	public String idcheck(@RequestParam("id") String id) {
		
		int cnt = mdao.idCheck(id);
		
		if(cnt>0)
			return "no";
		
		return "yes";
	}
	
	
	//=======// 아이디 찾기===================================
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
	
	
	//==========// 비밀번호 찾기==============================================
	@ResponseBody 
	@RequestMapping("findpw.mb")
	public String FindPW(@RequestParam("id") String id,@RequestParam("hp") String hp) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("hp", hp);
		
		int result = mdao.FindPW(map);
		String temporaryPw = getRandomPassword.tempPassword(8);// 랜덤부여한 비밀번호
		
		String securePassword = encoder.encode(temporaryPw);// 랜덤부여해서 암호화 설정
		
		if(result>0) {
			
			map.put("id", id);
			map.put("securePassword", securePassword);
			
			MemberBean mb = mdao.getById(id);// 아이디에 해당하는 이메일 가져와서 메일 보내기
			
			int cnt = mdao.resetPW(map);
			System.out.println("비밀번호 초기화 결과 :"+cnt);
			
			sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream] 임시비밀번호 발송", "[Billy A Dream] 임시 비밀번호는 ' "+temporaryPw+" ' 입니다.");
			return "yes";
		}
		else {
			return "null";
		}
	}
	//==========// 회원탈퇴 및 비밀번호 확인==============================================
	@ResponseBody 
	@RequestMapping("quitPw.mb")
	public String quitPw(@RequestParam("id") String id,@RequestParam("pw") String pw,HttpSession session) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberBean mb = mdao.getById(id);
		
		if(encoder.matches(pw, mb.getPw())){
			mdao.deleteMember(id);// 회원탈퇴
			session.invalidate(); // 세션된거 다 삭제
			return "yes";
		}
		return "null";
	}

}