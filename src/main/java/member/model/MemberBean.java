package member.model;


public class MemberBean {
	private int mno;
	private String id;
	private String pw;
	private String name;
	private String add1_sido;
	private String add2_sigungu;
	private String add3_eubmyeon;
	private String add4_donglee;
	private String email;
	private String hp; // �ڵ�����ȣ
	private String isblacklist; // ������Ʈ
	private int rating;
	private String coupon;
	private String likePnum;
	
	
	
	public String getLikePnum() {
		return likePnum;
	}
	public void setLikePnum(String likePnum) {
		this.likePnum = likePnum;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getIsblacklist() {
		return isblacklist;
	}
	public void setIsblacklist(String isblacklist) {
		this.isblacklist = isblacklist;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
}
