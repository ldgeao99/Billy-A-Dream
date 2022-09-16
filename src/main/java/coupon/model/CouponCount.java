package coupon.model;

public class CouponCount {
	private int cno;
	private String reg_date;
	public CouponCount() {}
	public CouponCount(int cno, String reg_date) {
		super();
		this.cno = cno;
		this.reg_date = reg_date;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
