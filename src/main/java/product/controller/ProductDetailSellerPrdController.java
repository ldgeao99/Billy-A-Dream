package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;
import util.PagingProduct;

@Controller
public class ProductDetailSellerPrdController {
	
	private final String command = "detailsellerPrd.prd";
	private String getPage = "productDetailSellerPrd";
	
	@Autowired
	private ProductDao pdao;
	
	@RequestMapping(command)
	public String showSellerPrd(@RequestParam("no") String pno, 
								@RequestParam(value = "pageNumber", required = false) String pageNumber,
								HttpServletRequest request, Model model) {
		
		//상품번호로 판매자 id 얻고  얻은 판매자 id로 그사람의 판매 물품 다 가져오기 이건
		// product object will be shown
		ProductBean pb = pdao.getByNo(pno);

		
		
		// 총 레코드의 개수가 몇개인지 가져옴
		int totalCount = pdao.getTotalSellerPrdCount(pb.getSeller_no());
		String url = request.getContextPath() + "/" + command; // url = "/ex/list.tv" 페이지 번호에 이런걸 넣어줘야 해서.
		PagingProduct pageInfo = new PagingProduct(pageNumber, null, totalCount, url, pno); // null 대신에 3을 넘기면 한 페이지에 3개씩 보여짐
		
		// seller's products
		List<ProductBean> lists = pdao.getTotalSellerPrd(pb.getSeller_no(), pageInfo);
		
		for(ProductBean image : lists) {
			image.setImages(image.getImages().split(",")[0]);
		}
		
		model.addAttribute("lists",lists);
		model.addAttribute("pageInfo", pageInfo);
		
		return getPage;
	}
}
