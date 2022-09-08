package scategory.model;

public class ScategoryBean {
	private int no; //이건 필요할까
	private String name;
	private int lcate_no; //1차 순서 대분류에 따름
	private int order_num; //2차 순서
	private int search_count; //조회수
	private String lcate_name;
	public String getLcate_name() {
		return lcate_name;
	}
	public void setLcate_name(String lcate_name) {
		this.lcate_name = lcate_name;
	}
	ScategoryBean(){
		System.out.println("ScategoryBean생성자");
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLcate_no() {
		return lcate_no;
	}
	public void setLcate_no(int lcate_no) {
		this.lcate_no = lcate_no;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getSearch_count() {
		return search_count;
	}
	public void setSearch_count(int search_count) {
		this.search_count = search_count;
	}
	
}
