package product.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	
	private int no;
	private int seller_no;
	private String images;
	private String name;
	private int lcategory_no;
	private int scategory_no;
	private String add1_sido;
	private String add2_sigungu;
	private String add3_eubmyeon;
	private String add4_donglee;
	private int original_day_price;
	private int discounted_day_price;
	private int rentday_minimum;
	private String components;
	private String description;
	private String end_day;
	
	private int like_count;
	private int view_count;
	private String create_day;
	private String pulled_day;
	private char is_hidden;
	
	private MultipartFile[] upload;
	
	public ProductBean() {
		super();
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSeller_no() {
		return seller_no;
	}
	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLcategory_no() {
		return lcategory_no;
	}
	public void setLcategory_no(int lcategory_no) {
		this.lcategory_no = lcategory_no;
	}
	public int getScategory_no() {
		return scategory_no;
	}
	public void setScategory_no(int scategory_no) {
		this.scategory_no = scategory_no;
	}
	public String getAdd1_sido() {
		return add1_sido;
	}
	public void setAdd1_sido(String add1_sido) {
		this.add1_sido = add1_sido;
	}
	public String getAdd2_sigungu() {
		return add2_sigungu;
	}
	public void setAdd2_sigungu(String add2_sigungu) {
		this.add2_sigungu = add2_sigungu;
	}
	public String getAdd3_eubmyeon() {
		return add3_eubmyeon;
	}
	public void setAdd3_eubmyeon(String add3_eubmyeon) {
		this.add3_eubmyeon = add3_eubmyeon;
	}
	public String getAdd4_donglee() {
		return add4_donglee;
	}
	public void setAdd4_donglee(String add4_donglee) {
		this.add4_donglee = add4_donglee;
	}
	public int getOriginal_day_price() {
		return original_day_price;
	}
	public void setOriginal_day_price(int original_day_price) {
		this.original_day_price = original_day_price;
	}
	public int getDiscounted_day_price() {
		return discounted_day_price;
	}
	public void setDiscounted_day_price(int discounted_day_price) {
		this.discounted_day_price = discounted_day_price;
	}
	public int getRentday_minimum() {
		return rentday_minimum;
	}
	public void setRentday_minimum(int rentday_minimum) {
		this.rentday_minimum = rentday_minimum;
	}
	public String getComponents() {
		return components;
	}
	public void setComponents(String components) {
		this.components = components;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getCreate_day() {
		return create_day;
	}
	public void setCreate_day(String create_day) {
		this.create_day = create_day;
	}
	public String getPulled_day() {
		return pulled_day;
	}
	public void setPulled_day(String pulled_day) {
		this.pulled_day = pulled_day;
	}
	public char getIs_hidden() {
		return is_hidden;
	}
	public void setIs_hidden(char is_hidden) {
		this.is_hidden = is_hidden;
	}
	public MultipartFile[] getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile[] upload) {
		
		String temp = "";
		
		for(int i = 0; i< upload.length; i++) {
			if(i == 0) {
				temp = upload[i].getOriginalFilename();
			}else {
				temp += "," + upload[i].getOriginalFilename();
			}
		}
		
		this.images = temp;
		this.upload = upload;
	}

	@Override
	public String toString() {
		return  "\n"
				+ "no: " + no + "\n"
				+ "seller_no: " + seller_no + "\n"
				+ "images: " + images + "\n"
				+ "name: " + name + "\n"
				+ "lcategory_no: " + lcategory_no + "\n"
				+ "scategory_no: " + scategory_no + "\n"
				+ "add1_sido: " + add1_sido + "\n"
				+ "add2_sigungu: " + add2_sigungu + "\n"
				+ "add3_eubmyeon: " + add3_eubmyeon + "\n"
				+ "add4_donglee: " + add4_donglee + "\n"
				+ "original_day_price: " + original_day_price + "\n"
				+ "discounted_day_price: " + discounted_day_price + "\n"
				+ "rentday_minimum: " + rentday_minimum + "\n"
				+ "components: " + components + "\n"
				+ "description: " + description + "\n"
				+ "end_day: " + end_day + "\n"
				+ "like_count: " + like_count + "\n"
				+ "view_count: " + view_count + "\n"
				+ "create_day: " + create_day + "\n"
				+ "pulled_day: " + pulled_day + "\n"
				+ "is_hidden: " + is_hidden + "\n"
				+ "\n";
	}
	
	
}
