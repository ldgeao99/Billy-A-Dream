package member.model;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao") // 객체 생성
public class MemberDao {

	private final String namespace = "member.MemberBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; 

	public String getPwById(String id) {
		
		String pw = sqlSessionTemplate.selectOne(namespace+".login",id);
		return pw;
	}
	public int idCheck(String id) {
		
		int result = sqlSessionTemplate.selectOne(namespace+".idCheck",id);
		return result;
	}
	public void InsertMember(MemberBean mb) {
		
		int result = sqlSessionTemplate.insert(namespace+".InsertMember",mb);
		System.out.println("회원가입 결과 :"+result);
	}
	public String FindId(Map<String, String> map) {
		
		String id = sqlSessionTemplate.selectOne(namespace+".FindId",map);
		
		return id;
	}
}
