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
	
	@RequestMapping(value = command , method = RequestMethod.GET)//로그인창으로 오기
	public String login() {
		
		return getPage;
	}
	
	@ResponseBody
	@RequestMapping(value = command , method = RequestMethod.POST)
	public String login(@RequestParam("id")String id,@RequestParam("pw")String pw,HttpSession session) throws UnknownHostException {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		
		MemberBean mb = mdao.getById(id); 
		
		String ip = Inet4Address.getLocalHost().getHostAddress();// 지금 접속한 아이피 가져오기
		
		boolean flag = false;
		
		if (mb != null) { // 해당 아이디가 있는지
			String getpw = mb.getPw();

			if (getpw != null) { // 해당 비밀번호가 있으면
				

				if (encoder.matches(pw, getpw)) { // 복호화해서 맞는지 확인

					if (id.equals("admin")) { // 그 아이디가 admin 이면 admin으로 감
						session.setAttribute("id", id);
						return "admin";
					} else {
						
						List<MemberIpBean> lists = midao.getAllByMno(mb.getMno()); // mno 에 해당하는 ip테이블 레코드 다 가져오기
						
						for (MemberIpBean mib : lists) {
							if (ip.equals(mib.getIp())) { // 해당 아이디에 등록된 아이피가 지금 접속한 아이피랑 같은지 확인
								session.setAttribute("id", id);
								flag = true;
								return "yes";
							}
						}
						if (!flag) { // 해당아이피는 등록되지 않음. 등록하는 페이지로 넘어가게 만듬. 근데 response
							return "Insertip";
						}
					}
					// 해당 아이디의 mno 에 해당하는 memberip 테이블에서 ip들을 가져와서 체크
				}
			}
		}
		/*
		if(request.getAttribute("destination").equals(null)) {
			return (String)request.getAttribute("destination");
		}
		*/
		
		return "ye"; // 해당하는 비밀번호가 없으면 그냥 아무거나 리턴
	}
}
