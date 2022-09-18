package coupon.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.DateParse;

@Component("couponDao")
public class CouponDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	DateParse dateParse;
	
	private String namespace="coupon.model.Coupon";
	

	public List<CouponBean> selectCouponList(){
		List<CouponBean> lists=sqlSessionTemplate.selectList(namespace+".SelectCouponList");
		for(CouponBean coupon : lists) {
			coupon.setStartdate(DateParse.dateToStr(coupon.getStartdate()));
			coupon.setEnddate(DateParse.dateToStr(coupon.getEnddate()));
		}
		return lists;
	}
	public void insertCoupon(CouponBean coupon) {
		sqlSessionTemplate.insert(namespace+".InsertCoupon", coupon);
	}
	public void updateCoupon(CouponBean coupon) {
		sqlSessionTemplate.update(namespace+".UpdateCoupon", coupon);
	}
	public void deleteCoupon(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteCoupon", no);
	}
	public CouponBean selectCoupon(int no) {
		CouponBean coupon=sqlSessionTemplate.selectOne(namespace+".SelectCoupon", no);
		return coupon;
	}
	public CouponBean getByCode(String code) {
		
		CouponBean cb = sqlSessionTemplate.selectOne(namespace+".getByCode",code);
		return cb;
	}
	public List<CouponBean> getAllByNo(String[] couponLists) {
		
		List<CouponBean> lists = sqlSessionTemplate.selectList(namespace+".getAllByNo",couponLists);
		
		return lists;
	}
}
