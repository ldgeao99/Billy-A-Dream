package event.model;

<<<<<<< HEAD
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class EventBean {
	private int num;
	
	@Length(min = 5,max = 100,message = "ì œëª©ì„ ìµœì†Œ 5ìžë¦¬ ìµœëŒ€ 100ìžë¦¬ ìž…ë‹ˆë‹¤.")
    private String title;
	
	
   private String writer;
    

   private String  eventdate;
    
   	@NotNull
    private String eventImage;
    
    @Length(min = 5,max = 1000,message = "ìƒí’ˆì— ëŒ€í•œ ì„¤ëª…ì€ ìµœì†Œ 5ìžë¦¬ ìµœëŒ€ 1000ìžë¦¬ ìž…ë‹ˆë‹¤.")
    private String write;
    
    private int readcount;
    
    private MultipartFile upload; // a.jpg X
	
	public MultipartFile getUpload() {
		return upload;
	}
	
	
	public EventBean() {
		super();
	}
	public EventBean(int num, String title, String writer, String eventdate, String eventImage, String write,
			int readcount, MultipartFile upload) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.eventdate = eventdate;
		this.eventImage = eventImage;
		this.write = write;
		this.readcount = readcount;
		this.upload = upload;
	}


	public EventBean(String title, String writer, String eventdate, String eventImage, String write,
			MultipartFile upload) {
		super();
		this.title = title;
		this.writer = writer;
		this.eventdate = eventdate;
		this.eventImage = eventImage;
		this.write = write;
		this.upload = upload;
	}




=======
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class EventBean {
	private int num;
	
	@Length(min = 5,max = 100,message = "Á¦¸ñÀ» ÃÖ¼Ò 5ÀÚ¸® ÃÖ´ë 100ÀÚ¸® ÀÔ´Ï´Ù.")
    private String title;
	
	

	private String writer;

	@NotEmpty(message = "³¯Â¥¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä.")
	private String eventdate;

	@NotEmpty(message = "ÀÌº¥Æ® »çÁøÀ» ¾È³Ö¾ú½À´Ï´Ù.")
	private String eventImage;

	@Length(min = 5, max = 1000, message = "»óÇ°¿¡ ´ëÇÑ ¼³¸íÀº ÃÖ¼Ò 5ÀÚ¸® ÃÖ´ë 1000ÀÚ¸® ÀÔ´Ï´Ù.")
	private String write;

	private int readcount;
    

	
    private MultipartFile upload; // a.jpg X
	
	public MultipartFile getUpload() {
		return upload;
	}
	
>>>>>>> branch 'master' of https://github.com/PostFace/Billy-A-Dream.git
	public void setUpload(MultipartFile upload) { // upload=a.jpg X
		System.out.println("setUpload(MultipartFile upload)");
		this.upload = upload;
		System.out.println("setUpload upload:" + upload);
		System.out.println("upload.getName():"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		this.eventImage = upload.getOriginalFilename();
	}

	
	
	

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEventdate() {
		return eventdate;
	}

	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
    
  
   
    
    

}
