package contect.model;

public class ContectBean {
	private int no;
	private int mno;
	private String id;
	private String reg_date;
	private int category_num;
	private String title;
	private String content;
	private int is_reply;
	private int is_replied;
	private int readcount;
	private String[] category
		= {"회원 정보",
			"결제 관련",
			"거래 관련",
			"상품 문의",
			"기타"};
	public String[] getCategory() {
		return category;
	}
	public void setCategory(String[] category) {
		this.category = category;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(String category_num) {
		this.category_num = Integer.parseInt(category_num);
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIs_reply() {
		return is_reply;
	}
	public void setIs_reply(int is_reply) {
		this.is_reply = is_reply;
	}
	public int getIs_replied() {
		return is_replied;
	}
	public void setIs_replied(int is_replied) {
		this.is_replied = is_replied;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
