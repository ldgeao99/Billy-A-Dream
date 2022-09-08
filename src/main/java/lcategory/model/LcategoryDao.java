package lcategory.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("lcategoryDao")
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
			lcategory.setOrder_num(lastOrder);
		}
		sqlSessionTemplate.insert(namespace+".InsertLcategory", lcategory);
	}
	public List<LcategoryBean> selectLcategoryList (){
		List<LcategoryBean> lists=sqlSessionTemplate.selectList(namespace+".SelectLcategoryList");
		return lists;
	}
	public void updateOrder_num(int order_num) {
		String name=sqlSessionTemplate.selectOne(namespace+".SelectNameByOrder_num", order_num+1);
		sqlSessionTemplate.update(namespace+".UpdateOrder_num", order_num);
		sqlSessionTemplate.update(namespace+".AfterUpdateOrder_num", name);
		
	}
	
}
