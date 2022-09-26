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
public class ProductSearchTextController {

	
	private final String command = "search.prd";
	private String getPage = "productSearchResult";
	
	@Autowired
	private ProductDao pdao;
	
//	@Autowired
//	private MemberDao mdao; // org.springframework.beans.factory.NoSuchBeanDefinitionException: No matching bean of type [member.model.MemberDao] found for dependency
//	
	@Autowired
	private LcategoryDao lcategoryDao;
	
	@Autowired
	private ScategoryDao scategoryDao;
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("whatColumn") String whatColumn, 
								@RequestParam("keyword") String keyword,
								@RequestParam(value = "pageNumber", required = false) String pageNumber,
								HttpServletRequest request,
								Model model){
		
		System.out.println("ProductSearchController 에서 넘겨받은 2개의 값");
		System.out.println("whatColumn:" + whatColumn);
		System.out.println("keyword: " + keyword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn); // genre or grade or actor
		map.put("keyword", "%"+ keyword + "%"); // 미리 %를 붙여서 넘겨줘야 함.
		
		// 검색 조건에 맞는 레코드의 개수가 몇개인지 가져옴
		int totalCount = pdao.getTotalSearchCount(map);
		String url = request.getContextPath() + "/" + command; // url = "/ex/list.tv" 페이지 번호에 이런걸 넣어줘야 해서.
		PagingProduct pageInfo = new PagingProduct(pageNumber, null, totalCount, url, whatColumn, keyword); // null 대신에 3을 넘기면 한 페이지에 3개씩 보여짐
		
		List<ProductBean> resultProductList = pdao.getProductListBySearch(map, pageInfo);
		
		
		/* for lcategory list & scategory list */
		List<LcategoryBean> list = lcategoryDao.selectLcategoryList();
		Map<String,List<ScategoryBean>> lists=new HashMap<String,List<ScategoryBean>>();
		for(LcategoryBean lcate : list) {
			List<ScategoryBean> scate= scategoryDao.selectScategoryList(lcate.getNo());
			
			lists.put(lcate.getName(),scate);
		}
		
		model.addAttribute("resultProductList", resultProductList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list); 	// lcategory list
		model.addAttribute("lists", lists);	// scategory list
		
		return getPage;
	}
}
