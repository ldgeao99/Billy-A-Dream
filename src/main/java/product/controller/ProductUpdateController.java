package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductUpdateController {
	
	private final String command = "update.prd";
	private String getPage ="productUpdateForm";
	private String gotoPage ="redirect:/";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext; // 프로젝트 1개당 하나가 자동으로 만들어줌. 그래서 그냥 Autowired만 해줘도 주입됨.
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String showUpdateForm(@RequestParam("no") String pno, Model model) {
		System.out.println("ProductUpdateController");
		ProductBean pb = productDao.getByNo(pno);
		model.addAttribute("pb", pb);
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doUpdate(ProductBean pbean) {
		
		System.out.println(pbean);
		
		ProductBean pbFromForm = pbean;
		ProductBean pbFromDB = productDao.getByNo(String.valueOf(pbFromForm.getNo()));
		
		//1. make array by split images from pbeanFromForm
		//2. make array by split images from pbeanFromDB
		String[] imgNamesFromForm = pbFromForm.getImages().split(",");
		String[] imgNamesFromDB = pbFromDB.getImages().split(",");
		
		for(String s : imgNamesFromForm) {
			System.out.println(s);
		}
		System.out.println();
		
		for(String s : imgNamesFromDB) {
			System.out.println(s);
		}
		System.out.println();
		
		String path = servletContext.getRealPath("/resources");
		System.out.println("path: " + path);
		System.out.println();
		
		//3. disappeared files delete on server resource
		for(int i = 0; i<imgNamesFromDB.length; i++) {
			if(Arrays.asList(imgNamesFromForm).contains(imgNamesFromDB[i]) == false) {
				System.out.println("!!" + imgNamesFromDB[i] + " file have to be deleted on server resource!!");
				File file = new File(path + "/" + imgNamesFromDB[i]);
				file.delete();
			}
		}
		System.out.println();
		
		//4. appeared new files upload on server resource
		MultipartFile[] upload = pbFromForm.getUpload();
		String tempImages = null;
		//resources 라는 폴더가 존재하지 않는다명 생성.
		File folder = new File(path);
		if (!folder.exists()) {
			folder.mkdir(); //폴더 생성합니다.
			System.out.println(path + " 경로의 resources 폴더가 생성되었습니다.");
		}
		for(int i = 0; i<imgNamesFromForm.length; i++) {
			if(Arrays.asList(imgNamesFromDB).contains(imgNamesFromForm[i]) == false) {
				System.out.println("!!" + imgNamesFromForm[i] + "file have to be uploaded on server resource!!"); 
				UUID uuid = UUID.randomUUID();
				File file = new File(path + "/" + uuid.toString()+"_" + upload[i].getOriginalFilename()); // multi.getOriginalFilename() 대신 pbean.getImage() 를 사용해도 됨.
				
				if(tempImages == null) {
					tempImages = uuid.toString()+"_" + upload[i].getOriginalFilename();
				}else {
					tempImages +=  "," + uuid.toString()+"_" + upload[i].getOriginalFilename();
				}
				
				try {
					upload[i].transferTo(file); // 원하는 위치에 파일을 올리고 싶을 때 사용함. 이 문장 실행과 동시에 업로드 됨.
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				if(tempImages == null) {
					tempImages = imgNamesFromForm[i];
				}else {
					tempImages += "," + imgNamesFromForm[i];
				}	
			}
		}
		System.out.println("tempImages: " + tempImages);
		pbFromForm.setImages(tempImages);
		
		//6. execute update
		int cnt = productDao.updateProduct(pbFromForm);
		if(cnt > 0 ) {
			System.out.println("상품 수정성공");
		}else {
			System.out.println("상품 수정실패");
		}
		
		return gotoPage;
	}
}