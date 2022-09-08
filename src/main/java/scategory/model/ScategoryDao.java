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
	
	public void insertScategory(ScategoryBean scategory) {
		sqlSessionTemplate.insert(namespace+".InsertScategory", scategory);
	}
	public List<ScategoryBean> selectScategoryList(int lcate_no){
		List<ScategoryBean> lists=sqlSessionTemplate.selectList(namespace+".SelectScategoryList", lcate_no);
		
		return lists;
	}
	public void deleteScategory(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteScategory", no);
	}
}
