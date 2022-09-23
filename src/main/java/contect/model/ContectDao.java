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
	
	private String namespace="contect.model.ContectBean"; 
	
	public List<ContectBean> selectAllContect(Map<String,String> map){
		List<ContectBean> lists=sqlSessionTemplate.selectList(namespace+".SelectAllContect", map);
		return lists;
	}
	public List<ContectBean> selectMyContect(){
		List<ContectBean> lists=sqlSessionTemplate.selectList(namespace+".SelectMyContect");
		return lists;
	}
	public List<ContectBean> selectContectDetail(int no) {
		List<ContectBean> contect = sqlSessionTemplate.selectOne(namespace+".SelectContectDetail", no);
		sqlSessionTemplate.update(namespace+".UpdateReadcount",no);
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
		sqlSessionTemplate.delete(namespace+".DeleteReplyContect", no-1);
	}
	public void deleteReplyContect(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteReplyContect", no);		
	}
	public void updateContect(ContectBean contect) {
		sqlSessionTemplate.update(namespace+".UpdateContect", contect);
	}
}
