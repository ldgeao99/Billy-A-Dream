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
public class ProductDelete {
	
	private final String command = "delete.prd";
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	ServletContext servletContext; 
	
	@ResponseBody
	@RequestMapping(value=command, produces="text/plain;charset=UTF-8")
	public String deleteProduct(@RequestParam("no") String pno) {
		
		/* 1. delete file from server resource */
		ProductBean pb = pdao.getByNo(pno);
		
		String[] imgNames = pb.getImages().split(",");
		
		String path = servletContext.getRealPath("/resources");
		System.out.println("path: " + path);
		
		for(String name : imgNames) {
			System.out.println(imgNames + "");
			File file = new File(path + "/" + name);
			file.delete();
		}
		
		/* 2. delete record from DB(also wishlist will be deleted by cascade automatically) */
		int cnt = pdao.deleteProduct(pno);
		
		if(cnt > 0) {
			return "deleted";
		}else {
			return "failed";
		}
	}
}
