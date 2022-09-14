package member.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {
	private int mno;
	@NotBlank(message = "아이디를 입력하세요")
	private String id;
	
	@Pattern(regexp ="^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$", message = "최소 8자,최소 하나의 문자와 숫자를 입력하세요")
	private String pw;
	
	@NotBlank(message = "이름을 입력하세요")
	private String name;
	
	@NotBlank(message = "주소를 입력하세요")
	private String postcode;
	private String address;
	
	@NotBlank(message = "주소를 입력하세요")
	private String detailaddress;
	@Pattern(regexp = "^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\\.[A-Za-z0-9\\-]+" , message = "올바르지 않은 형식의 이메일입니다")
	private String email;
	@Pattern(regexp = "(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$" , message = "올바르지 않은 형식의 번호입니다")
	private String hp; // 핸드폰번호
	private String isblacklist; // 블랙리스트
	private int rating;
	
	//유효성검사후 다시 쓰기 위해
	@NotBlank(message = "재확인 비밀번호를 입력하세요")
	private String repw;
	
	
	public String getRepw() {
		return repw;
	}
	public void setRepw(String repw) {
		this.repw = repw;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
