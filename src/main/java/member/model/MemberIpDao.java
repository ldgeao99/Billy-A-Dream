package member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMeberIpDao")
public class MemberIpDao {
	private final String namespace = "member.MemberIpBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; 

	
	public void InsertIp(Map<String, String> map){
		int result = sqlSessionTemplate.insert(namespace+".InsertIp",map);
		System.out.println("ip   :"+result);
	}
	
	public List<MemberIpBean> getAllByMno(int mno) {
		
		List<MemberIpBean> lists = sqlSessionTemplate.selectList(namespace+".GetAllByMno",mno);
		return lists;
	}
}
