package coupon.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.DateParse; 

@Component
public class CouponDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="coupon.model.Coupon";
	

	public List<CouponBean> selectCouponList(Map<String, String> map){
		List<CouponBean> list=sqlSessionTemplate.selectList(namespace+".SelectCouponList",map);
		List<CouponBean> lists=new ArrayList<CouponBean>();
		String now=DateParse.getTodayPlus(0);
		CouponCount cCount=new CouponCount();
		cCount.setReg_date(now);
		for(CouponBean coupon : list) {
			String strtdate =coupon.getStartdate();
			String[] startdate=strtdate.split(" ");
			String endate=coupon.getEnddate();
			String[] enddate=endate.split(" ");
			
			coupon.setStartdate(startdate[0]);
			coupon.setEnddate(enddate[0]);
			cCount.setCno(coupon.getNo());
			int cnt=sqlSessionTemplate.selectOne(namespace+".SelectCouponCount",cCount );
			coupon.setUse(cnt);
			if(Integer.parseInt(now)<Integer.parseInt(DateParse.dateToStr(coupon.getStartdate()))) {
				coupon.setUse(2);
			}
			lists.add(coupon);
		}
		return lists;
	}
	public void insertCoupon(CouponBean coupon) {
		int cno=sqlSessionTemplate.selectOne(namespace+".GetNextCno");
		coupon.setNo(cno);
		sqlSessionTemplate.insert(namespace+".InsertCoupon", coupon);
		int dif = DateParse.dateDif(coupon.getStartdate(), coupon.getEnddate());

		// 쿠폰 시작일 ~ 마감일 -1
		for(int i=0; i<dif ;i++) {
			sqlSessionTemplate.insert( namespace+".InsertCouponCount",
					new CouponCount(coupon.getNo(),DateParse.datePlus(coupon.getStartdate(), i)));
		}
	}
	public void updateCoupon(CouponBean coupon) {
		sqlSessionTemplate.update(namespace+".UpdateCoupon", coupon);
		sqlSessionTemplate.delete(namespace+".DeleteCouponCount", coupon.getNo());
		int dif = DateParse.dateDif(coupon.getStartdate(), coupon.getEnddate());

		// 쿠폰 시작일 ~ 마감일 -1
		for(int i=0; i<dif ;i++) {
			sqlSessionTemplate.insert( namespace+".InsertCouponCount",
					new CouponCount(coupon.getNo(),DateParse.datePlus(coupon.getStartdate(), i)));
		}
	}
	public void deleteCoupon(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteCoupon", no);
		sqlSessionTemplate.delete(namespace+".DeleteCouponCount",no);
	}
	public CouponBean selectCoupon(int no) {
		CouponBean coupon=sqlSessionTemplate.selectOne(namespace+".SelectCoupon", no);
		String strtdate =DateParse.dateToStr(coupon.getStartdate());
		String[] startdate=strtdate.split(" ");
		String endate=DateParse.dateToStr(coupon.getEnddate());
		String[] enddate=endate.split(" ");
		
		coupon.setStartdate(startdate[0]);
		coupon.setEnddate(enddate[0]);
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
