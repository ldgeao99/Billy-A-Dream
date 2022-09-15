package scategory.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("ScategoryDao")
public class ScategoryDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="scategory.model.Scategory";
	
	public void insertScategory(ScategoryBean scate) {
		System.out.println(1);
		if(scate.getOrder_num()==0) {
			int lastOrder=0;
			lastOrder=selectMaxOrder(scate);
			
			scate.setOrder_num(lastOrder+1);
		}
		System.out.println(2);
		sqlSessionTemplate.insert(namespace+".InsertScategory", scate);
	}
	public List<ScategoryBean> selectScategoryList(int lcate_no){
		List<ScategoryBean> lists=sqlSessionTemplate.selectList(namespace+".SelectScategoryList", lcate_no);
		
		return lists;
	}
	public int selectMaxOrder(ScategoryBean scate) {
		int lastOrder=sqlSessionTemplate.selectOne(namespace+".SelectMaxOrder",scate);
		return lastOrder;
	}
	public void deleteScategory(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteScategory", no);
	}
	public void deleteAllScategory(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteAllScategory", no);
	}
	public void updateOrder_num(ScategoryBean scate, int val) {
		scate.setOrder_num(scate.getOrder_num()+val);
		ScategoryBean updateScate=
				sqlSessionTemplate.selectOne(namespace+".SelectNextScategory", scate);
		scate.setOrder_num(val);
		sqlSessionTemplate.update(namespace+".UpdateOrder_num", scate);
		updateScate.setOrder_num(scate.getOrder_num());
		sqlSessionTemplate.update(namespace+".AfterUpdateOrder_num", updateScate);
	}
	public void updateScategory(ScategoryBean scate) {
		sqlSessionTemplate.update(namespace+".UpdateScategory", scate);
	}
	public void changeLcategory(ScategoryBean scate) {
		if(scate.getOrder_num()==0) {
			int lastOrder=selectMaxOrder(scate);
			scate.setOrder_num(lastOrder+1);
		}
		sqlSessionTemplate.update(namespace+".ChangeLcategory", scate);
	}
	
}
