package product.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String detailForm(@RequestParam("whatColumn") String whatColumn, 
								@RequestParam("keyword") String keyword,
								@RequestParam(value = "add2Name", required = false) String add2Name,
								@RequestParam(value = "pageNumber", required = false) String pageNumber,
								HttpServletRequest request,
								Model model, HttpSession session) throws UnsupportedEncodingException{
		
		if(whatColumn.equals("mylocation")) {
			System.out.println("ProductSearchTextController");
			System.out.println("keyword: " + keyword);
			keyword = URLEncoder.encode(keyword, "UTF-8"); // when I send korean parameter with redirect, have to use
			
			if(add2Name == null) {
				String id = (String)session.getAttribute("id");
				MemberBean mb = mdao.getById(id);
				add2Name = mb.getAdd2_sigungu();
				add2Name= URLEncoder.encode(add2Name, "UTF-8");
			}
			
			return "redirect:/search_by_mylocation.prd?whatColumn=" + whatColumn + "&keyword=" + keyword + "&add2Name=" + add2Name + "&pageNumber=" + pageNumber; //"productSearchResultByMyAddress";
		}

		//for searching without seperating upper or lower case
		keyword = keyword.toUpperCase();
		
		//making map with whatColumn and keyword
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn); // genre or grade or actor
		
		if(whatColumn.equals("name") || whatColumn.equals("all")) { // product name search
			map.put("keyword", "%"+ keyword + "%"); // 미리 %를 붙여서 넘겨줘야 함.
		}else {
			map.put("keyword", keyword); // 미리 %를 붙여서 넘겨줘야 함.
		}
		
		//getting getTotalCount of searchResult for paging
		int totalCount = pdao.getTotalSearchCount(map);
		System.out.println("totalCount of the result list by search: " + totalCount);
		
		
		//gettig request url to make the link of paging number
		String url = request.getContextPath() + "/" + command; // url = "/ex/list.tv" 페이지 번호에 이런걸 넣어줘야 해서.
				
		//making bottom paging element
		PagingProduct pageInfo = new PagingProduct(pageNumber, null, totalCount, url, whatColumn, keyword); // null 대신에 3을 넘기면 한 페이지에 3개씩 보여짐
		
		//getting result only need to show in this page
		List<ProductBean> resultProductList = pdao.getProductListBySearch(map, pageInfo);
		System.out.println("size of the list will be shown in this page: " + resultProductList.size());		
		
		model.addAttribute("resultProductList", resultProductList);
		model.addAttribute("pageInfo", pageInfo);
		
		return getPage;
	}
}
