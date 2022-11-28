package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class GetUserAddress {
	private final String command = "getUserAddress.mb";
	
	@Autowired
	MemberDao mdao;
	
	@ResponseBody
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String getUserAddress(@RequestParam("id") String id) {
		
		System.out.println("GetUserAddress: " + id);
		
		
		MemberBean mbean = mdao.getMemberAddress(id);
		
		String sido = mbean.getAdd1_sido();
		String sigungu = mbean.getAdd2_sigungu();
		String eubmyeon = mbean.getAdd3_eubmyeon();
		String donglee = mbean.getAdd4_donglee();
		
		String result = "";
		
		result += sido;
		result += " " + sigungu;
		result += " " + eubmyeon;
		result += " " + donglee;
		
		return result;
	}
}
