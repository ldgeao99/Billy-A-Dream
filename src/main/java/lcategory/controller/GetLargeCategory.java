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
	
	@ResponseBody // �ش� �޼��尡 ��ȯ�� ���� jsp ������ �ƴ� ��ü �״�� �����Ѵ�. 
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String getLargeCategory() {
		
		String result = "";
		
		//����Ʈ�� ��� ���� �޾Ƽ� ���ڿ��� ������. �����ڷ� �̾�ٿ�, 
		List<LcategoryBean> lists=lcategoryDao.selectLcategoryList();
		
		for(int i = 0; i<lists.size() ;i++) {
			LcategoryBean lcbean = lists.get(i);
			
			if(i == 0) {
				result = lcbean.getName() + "," + lcbean.getNo();
			}else {
				result += "|" + lcbean.getName() + "," + lcbean.getNo();
			}
		}
		
		//System.out.println(result);
		
		return result;
	}
}