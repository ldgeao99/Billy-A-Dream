package product.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import wishlist.model.WishlistBean;
import wishlist.model.WishlistDao;

@Controller
public class ProductDeleteController {
	
	private final String command = "deleteAndReturnView.prd";
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping(value=command)
	public String deleteProduct(@RequestParam("no") String pno,
								@RequestParam(value="pageNumber", required = false) String pageNumber,
								@RequestParam(value="pageSize", required = false) String pageSize,
								@RequestParam(value="whatColumn", required = false) String whatColumn) {
		
		/* 1. delete file from server resource */
		ProductBean pb = pdao.getByNo(pno);
		
		String[] imgNames = pb.getImages().split(",");
		
		String path = servletContext.getRealPath("/resources");
		System.out.println("path: " + path);
		
		// try로 감싸주자.
		for(String name : imgNames) {
			System.out.println(imgNames + " ");
			File file = new File(path + "/" + name);
			file.delete();
		}
		
		/* 2. delete record from DB(also wishlist will be deleted by cascade automatically) */
		int cnt = pdao.deleteProduct(pno);
		
		if(whatColumn.equals("new") || whatColumn.equals("hot")) {
			return "redirect:/newOrPopularClicked.prd?pageNumber=" + pageNumber +"&pageSize=" + pageSize +"&whatColumn=" + whatColumn;
		}else if(whatColumn.equals("main")) {
			return "redirect:/";
		}
		
		
		
		return "";
	}
}
