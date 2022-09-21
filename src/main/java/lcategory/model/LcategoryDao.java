package lcategory.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LcategoryDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="lcategory.model.Lcategory";
	public int selectMaxOrder() {
		int lastOrder=sqlSessionTemplate.selectOne(namespace+".SelectMaxOrder");
		return lastOrder;
	}
	public void insertLcategory(LcategoryBean lcategory) {
		if(lcategory.getOrder_num()==0) {
			int lastOrder=selectMaxOrder();
			lcategory.setOrder_num(lastOrder+1);
		}
		sqlSessionTemplate.insert(namespace+".InsertLcategory", lcategory);
	}
	public List<LcategoryBean> selectLcategoryList (){
		List<LcategoryBean> lists=sqlSessionTemplate.selectList(namespace+".SelectLcategoryList");
		return lists;
	}
	public void updateOrder_num(LcategoryBean lcate, int val) {
		LcategoryBean updateLcate=
				sqlSessionTemplate.selectOne(namespace+".SelectNextLcategory", lcate.getOrder_num()+val);
		lcate.setOrder_num(val);
		sqlSessionTemplate.update(namespace+".UpdateOrder_num", lcate);
		updateLcate.setOrder_num(lcate.getOrder_num());
		sqlSessionTemplate.update(namespace+".AfterUpdateOrder_num", updateLcate);
		
	}
	public void updateLcategory(LcategoryBean lcate) {
		sqlSessionTemplate.update(namespace+".UpdateLcategory", lcate);
	}
	public void deleteLcategory(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteLcategory", no);
	}
	public String selectLcategoryName(int no) {
		String name= sqlSessionTemplate.selectOne(namespace+".SelectLcategoryName", no);
		return name;
	}
}
