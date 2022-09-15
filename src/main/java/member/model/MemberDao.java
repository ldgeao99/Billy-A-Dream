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

	public MemberBean getById(String id) {
		
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".login",id);
		return mb;
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
	public int FindPW(Map<String, String> map) {
		
		int result = sqlSessionTemplate.selectOne(namespace+".FindPw",map);
		return result;
	}
	public int resetPW(Map<String, String> map) {
		
		int result = sqlSessionTemplate.update(namespace+".resetPw",map);
		return result;
	}
	public void deleteMember(String id) {
		
		int result = sqlSessionTemplate.delete(namespace+".deleteMember",id);
		System.out.println("삭제한 결과 :"+result);
	}
	public void updateMember(MemberBean mb) {

		int result = sqlSessionTemplate.update(namespace+".updateMember",mb);
		
		System.out.println("업데이트한 결과 :"+result);
	}
	
}
