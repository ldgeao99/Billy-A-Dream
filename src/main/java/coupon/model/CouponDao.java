package coupon.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("couponDao")
public class CouponDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="coupon.model.Coupon";
	
	
	public CouponBean getByCode(String code) {
		
		CouponBean cb = sqlSessionTemplate.selectOne(namespace+".getByCode",code);
		
		return cb;
	}
}
