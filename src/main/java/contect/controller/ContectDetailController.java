package contect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectBean;
import contect.model.ContectDao;

@Controller
public class ContectDetailController {
	
	private final String command="detail.ctc";
	private String getPage="contectDetail"; 
	
	@Autowired
	ContectDao contectDao;
	
	@RequestMapping(command)
	public String contectView(Model model,
			@RequestParam("no") int no) {
		if(no%2==1) {
			no=no+1;
		}
		ContectBean contect = contectDao.selectContectDetail(no);
		model.addAttribute("contect", contect);
		if(contect.getIs_replied()==1) {
			ContectBean reply_contect = contectDao.selectContectDetail(no-1);
			model.addAttribute("reply_contect",reply_contect);			
		}
		return getPage;
	}

}
