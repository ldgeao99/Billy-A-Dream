package lcategory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class GetLargeCategory {
	private final String command = "getLargeCategory.lcate";
	
	@Autowired
	LcategoryDao lcategoryDao;
	
	@ResponseBody // 해당 메서드가 반환한 것을 jsp 파일이 아닌 객체 그대로 전달한다. 
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String getLargeCategory() {
		
		String result = "";
		
		//리스트로 모든 정보 받아서 문자열로 만들자. 구분자로 이어붙여, 
		List<LcategoryBean> lists=lcategoryDao.selectLcategoryList();
		
		for(int i = 0; i<lists.size() ;i++) {
			LcategoryBean lcbean = lists.get(i);
			
			if(i == 0) {
				result = lcbean.getName() + "," + lcbean.getNo();
			}else {
				result += "|" + lcbean.getName() + "," + lcbean.getNo();
			}
		}
		
		System.out.println(result);
		
		return result;
	}
}