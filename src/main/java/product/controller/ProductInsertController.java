package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductInsertController {
	
	private final String command = "insert.prd";
	private String getPage ="productInsertForm";
	private String gotoPage ="redirect:/";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String showInsertForm() {
		System.out.println("ProductInsertController GET");
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doInsert(ProductBean pbean, HttpSession session) { 
		System.out.println("ProductInsertController POST");
		
		String id = (String)session.getAttribute("id");
		MemberBean mb = memberDao.getById(id);
		pbean.setSeller_no(mb.getMno());
		
		MultipartFile[] upload = pbean.getUpload();
		
		if(upload == null) {
			System.out.println("");
		}
		else {
			String tempImages = ""; 
			
			for(MultipartFile multi :upload) {
				System.out.println(multi.getOriginalFilename());
				System.out.println("multi.getOriginalFilename():" + multi.getOriginalFilename()); 
				
				String uploadPath = servletContext.getRealPath("/resources");
				System.out.println("uploadPath: " + uploadPath);
				
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdir(); //폴더 생성합니다.
					System.out.println(uploadPath);
				}
				
				UUID uuid = UUID.randomUUID();

				File file = new File(uploadPath + "/" + uuid.toString()+"_" + multi.getOriginalFilename()); 
				
				if(tempImages == "") {
					tempImages = uuid.toString()+"_" + multi.getOriginalFilename();
				}else {
					tempImages +=  "," + uuid.toString()+"_" + multi.getOriginalFilename();
				}
				
				try {
					multi.transferTo(file);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}
			
			pbean.setImages(tempImages);
		}
		
		System.out.println(pbean);
		
		int cnt = -1;
		cnt = productDao.insertProduct(pbean);
		
		if(cnt > 0 ) {
			System.out.println("");
		}else {
			System.out.println("");
		}
		
		return gotoPage;
	}
}
