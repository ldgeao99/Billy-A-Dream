package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectBean;
import contect.model.ContectDao;

@Controller
public class AdminContectReplyController {
	private final String command="replyContect.admin";
	private String getPage="redirect:/contect.admin";  
	
	
	@Autowired
	ContectDao contectDao;
	
	@RequestMapping(command)
	public String getMain(Model model,
			ContectBean contect,
			@RequestParam(value="re_cate",required = false) String re_cate) {
		if(!re_cate.equals("")) {
			if(!re_cate.equals(contect.getCategory_num())) {
				System.out.println("");
				contect.setCategory_num(re_cate);
				
			} 
		}
			if(contect.getNo()%2==0) {
				contectDao.insertReplyContect(contect);
			} else if(contect.getNo()%2==1) {
				contectDao.updateContect(contect);
			}
		
		return getPage;
	}
}
