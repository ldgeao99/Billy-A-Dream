package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import contect.model.ContectBean;
import contect.model.ContectDao;
import util.PagingProduct;

@Controller
public class AdminContectListController {
	private final String command="contect.admin";
	private String getPage="listContect";
	
	
	@Autowired
	ContectDao contectDao;
	
	@RequestMapping(command)
	public String getMain(Model model,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount=contectDao.getTotalCount(map);
		String url=request.getContextPath()+"/"+command;
		PagingProduct pageInfo = new PagingProduct(pageNumber, "10", totalCount, url, whatColumn, keyword);		
		List<ContectBean> lists = contectDao.selectAllContect(map);
		
		model.addAttribute("contectButton", new ContectBean());
		model.addAttribute("contect_lists", lists);
		model.addAttribute("pageInfo", pageInfo);
		return getPage;
	}
}
