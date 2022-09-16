package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductInsertController {
	
	private final String command = "insert.prd";
	private String getPage ="productInsertForm";
	private String gotoPage ="redirect:/home";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext; // 프로젝트 1개당 하나가 자동으로 만들어줌. 그래서 그냥 Autowired만 해줘도 주입됨.
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String showInsertForm() {
		System.out.println("ProductInsertController에 GET 요청 들어옴");
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doInsert(ProductBean pbean) { // 커맨드 객체 형태로 받음
		System.out.println("ProductInsertController에 POST 요청 들어옴");
		
		MultipartFile[] upload = pbean.getUpload();
		
		if(upload == null) {
			System.out.println("넘어온 데이터가 없습니다.");
		}
		else {
			for(MultipartFile multi :upload) {
				System.out.println(multi.getOriginalFilename());
				
				//1. 파일 업로드
				//System.out.println("multi.getName():" + multi.getName()); // upload : <input> 태그의 name 속성
				System.out.println("multi.getOriginalFilename():" + multi.getOriginalFilename()); // 내가 선택한 화일의 파일명
				//System.out.println("pbean.getImage():" + pbean.getImage()); // 이것 또한 내가 선택한 화일명, 이걸 이용해도 상관없음
				
				
				String uploadPath = servletContext.getRealPath("/resources");
				System.out.println("uploadPath: " + uploadPath);
				
				//resources 라는 폴더가 존재하지 않는다명 생성.
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdir(); //폴더 생성합니다.
					System.out.println(uploadPath + " 경로의 resources 폴더가 생성되었습니다.");
				}
				
				File file = new File(uploadPath + "/" + multi.getOriginalFilename()); // multi.getOriginalFilename() 대신 pbean.getImage() 를 사용해도 됨.
				try {
					multi.transferTo(file); // 원하는 위치에 파일을 올리고 싶을 때 사용함. 이 문장 실행과 동시에 업로드 됨.
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} 

			}
		}
		
		System.out.println(pbean);
		
		int cnt = -1;
		cnt = productDao.insertProduct(pbean);
		
		if(cnt > 0 ) {
			System.out.println("상품 삽입성공");
		}else {
			System.out.println("상품 삽입실패");
		}
		
		return gotoPage;
	}
}