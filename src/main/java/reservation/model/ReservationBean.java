package reservation.model;

public class ReservationBean {
	private int no;
	private int product_no;
	private int buyer_no;
	private String start_date;
	private String end_date;
	private String is_accepted;
	private String accepted_date;
	private String status;
	private int amount; 
	
	private String name; // 승인내역 가져올때 필요함
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getAccepted_date() {
		return accepted_date;
	}
	public void setAccepted_date(String accepted_date) {
		this.accepted_date = accepted_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getBuyer_no() {
		return buyer_no;
	}
	public void setBuyer_no(int buyer_no) {
		this.buyer_no = buyer_no;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getIs_accepted() {
		return is_accepted;
	}
	public void setIs_accepted(String is_accepted) {
		this.is_accepted = is_accepted;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
