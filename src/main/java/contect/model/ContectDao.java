package contect.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ContectDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="contect.model.Contect"; 
	
	public List<ContectBean> selectAllContect(Map<String,String> map){
		List<ContectBean> lists=sqlSessionTemplate.selectList(namespace+".SelectContect", map);
		return lists;
	}
	public List<ContectBean> selectMyContect(){
		List<ContectBean> lists=sqlSessionTemplate.selectList(namespace+".SelectMyContect");
		return lists;
	}
	public ContectBean selectContectDetail(int no) {
		if(no%2==0) {
			sqlSessionTemplate.update(namespace+".UpdateReadcount",no);
		}
		ContectBean contect = sqlSessionTemplate.selectOne(namespace+".SelectContectDetail", no);
		return contect;
	}
	public void insertReplyContect(int no) {
		sqlSessionTemplate.insert(namespace+".InsertReplyContect", no-1);
		sqlSessionTemplate.update(namespace+".UpdateReply", no);
	}
	public void insertNewContect(ContectBean contect) {
		sqlSessionTemplate.insert(namespace+".InsertNewContect",contect);
	}
	public List<ContectBean> selectContectToReply(){
		List<ContectBean> lists=sqlSessionTemplate.selectList(namespace+".SelectContectToReply");
		return lists;
	}
	public void deleteContect(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteContect", no);
		
	}
	public void deleteReplyContect(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteReplyContect", no);		
	}
	public void updateContect(ContectBean contect) {
		sqlSessionTemplate.update(namespace+".UpdateContect", contect);
	}
}
