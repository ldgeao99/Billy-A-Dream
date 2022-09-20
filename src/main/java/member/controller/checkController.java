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
	
	
	
	//===========// ���̵� �ߺ�üũ================================
	@ResponseBody 
	@RequestMapping("idcheck.mb")
	public String idcheck(@RequestParam("id") String id) {
		
		int cnt = mdao.idCheck(id);
		
		if(cnt>0)
			return "no";
		
		return "yes";
	}
	
	
	//=======// ���̵� ã��===================================
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
	
	
	//==========// ��й�ȣ ã��==============================================
	@ResponseBody 
	@RequestMapping("findpw.mb")
	public String FindPW(@RequestParam("id") String id,@RequestParam("hp") String hp) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("hp", hp);
		
		int result = mdao.FindPW(map);
		String temporaryPw = getRandomPassword.tempPassword(8);// �����ο��� ��й�ȣ
		System.out.println("임시비밀번호 :"+temporaryPw);
		String securePassword = encoder.encode(temporaryPw);// �����ο��ؼ� ��ȣȭ ����
		
		if(result>0) {
			
			map.put("id", id);
			map.put("securePassword", securePassword);
			
			MemberBean mb = mdao.getById(id);// ���̵� �ش��ϴ� �̸��� �����ͼ� ���� ������
			
			int cnt = mdao.resetPW(map);
			System.out.println("��й�ȣ �ʱ�ȭ ��� :"+cnt);
			
			sendEMAIL.sendMail(mb.getEmail(), "[Billy A Dream] �ӽú�й�ȣ �߼�", "[Billy A Dream] �ӽ� ��й�ȣ�� ' "+temporaryPw+" ' �Դϴ�.");
			return "yes";
		}
		else {
			return "null";
		}
	}
	//==========// ȸ��Ż�� �� ��й�ȣ Ȯ��==============================================
	@ResponseBody 
	@RequestMapping("quitPw.mb")
	public String quitPw(@RequestParam("id") String id,@RequestParam("pw") String pw,HttpSession session) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberBean mb = mdao.getById(id);
		
		if(encoder.matches(pw, mb.getPw())){
			mdao.deleteMember(id);// ȸ��Ż��
			session.invalidate(); // ���ǵȰ� �� ����
			return "yes";
		}
		return "null";
	}
	//==========// ȸ��Ż�� �� ��й�ȣ Ȯ��==============================================
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