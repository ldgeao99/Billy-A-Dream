package member.model;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao") // ��ü ����
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
		System.out.println("ȸ������ ��� :"+result);
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
		System.out.println("������ ��� :"+result);
	}
	public List<MemberBean> selectMemberList(Map<String, String> map){//admin에서 회원 조회
		List<MemberBean> lists = sqlSessionTemplate.selectList(namespace+".SelectMemberList",map);
		return lists;
	}
	public void changeBlacklist(MemberBean member) {
		sqlSessionTemplate.update(namespace+".ChangeBlacklist", member);
	}
	public void updateMember(MemberBean mb) {

		int result = sqlSessionTemplate.update(namespace+".updateMember",mb);
		
		System.out.println("������Ʈ�� ��� :"+result);
	}
	
}
