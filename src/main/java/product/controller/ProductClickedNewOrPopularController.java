package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lcategory.model.LcategoryBean;
import lcategory.model.LcategoryDao;
import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import scategory.model.ScategoryBean;
import scategory.model.ScategoryDao;
import util.PagingProduct;

@Controller
public class ProductClickedNewOrPopularController {

	private final String command = "newOrPopularClicked.prd";
	private String getPage = "productNewOrPopularClicked";
	
	@Autowired
	private ProductDao pdao;
	
	@Autowired
	private LcategoryDao lcategoryDao;
	
	@Autowired
	private ScategoryDao scategoryDao;
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("whatColumn") String whatColumn,
								@RequestParam(value = "keyword", required = false) String keyword, 
								@RequestParam(value = "pageNumber", required = false) String pageNumber,
								@RequestParam(value = "pageSize", required = false) String pageSize,
								HttpServletRequest request,
								Model model){
		
		System.out.println("ProductClickedNewOrPopularController");
		System.out.println("whatColumn: " + whatColumn);
		System.out.println();
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("whatColumn", whatColumn); 
		map.put("keyword", keyword); 
		
		int totalCount = pdao.getTotalSearchCount(map);
		String url = request.getContextPath() + "/" + command; 
		PagingProduct pageInfo = new PagingProduct(pageNumber, pageSize, totalCount, url, whatColumn, keyword); 
		
		System.out.println("pageSize: " + pageSize);
		
		if(pageSize == null) {
			pageSize = "8";
		}
		
		System.out.println("---------------------------------------");
		if(whatColumn.equals("new")) {
			List<ProductBean> recentProductList = pdao.getRecentProductList(map, pageInfo);
			model.addAttribute("prdList", recentProductList);
			System.out.println("whatColumn: " + whatColumn);
			System.out.println("size : " + recentProductList.size());
		}else if(whatColumn.equals("hot")){
			List<ProductBean> popularProductList = pdao.getPopularProductList(map, pageInfo);
			model.addAttribute("prdList", popularProductList);
			System.out.println("whatColumn: " + whatColumn);
			System.out.println("size : " + popularProductList.size());
		}
		System.out.println("---------------------------------------");
		
		/* for lcategory list & scategory list */
		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
		Map<String,List<ScategoryBean>> lists=new HashMap<String,List<ScategoryBean>>();
		for(LcategoryBean lcate : list) {
			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
			
			lists.put(lcate.getName(),scate);
		}
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list); 	// lcategory list
		model.addAttribute("lists", lists);	// scategory list
		model.addAttribute("pageSize", pageSize);
		
		return getPage;
	}
}
