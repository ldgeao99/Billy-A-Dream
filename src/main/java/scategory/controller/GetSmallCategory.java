package scategory.controller;

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
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;

@Controller
public class GetSmallCategory {
	private final String command = "getSmallCategory.scate";
	
	@Autowired
	ScategoryDao scategoryDao;
	
	@ResponseBody
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String getMatchSmallCategory(@RequestParam("lcategoryNo") int lcategoryNo) {
		
		System.out.println("GetSmallCategory: "+lcategoryNo);
		
		String result = "";
		
		List<ScategoryBean> lists = scategoryDao.selectScategoryList(lcategoryNo);

		for(int i = 0; i<lists.size() ;i++) {
			ScategoryBean scbean = lists.get(i);
			
			if(i == 0) {
				result = scbean.getName() + "," + scbean.getNo();
			}else {
				result += "|" + scbean.getName() + "," + scbean.getNo();
			}
		}
		
		return result;
	}
}
