package member.model;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao") // 占쏙옙체 占쏙옙占쏙옙
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
		System.out.println("가입한 결과 :"+result);
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
		System.out.println("회원탈퇴 결과 :"+result);
	}
	public List<MemberBean> selectMemberList(Map<String, String> map){//admin
		List<MemberBean> lists = sqlSessionTemplate.selectList(namespace+".SelectMemberList",map);
		return lists;
	}
	public void changeBlacklist(MemberBean member) {
		sqlSessionTemplate.update(namespace+".ChangeBlacklist", member);
	}
	public void updateMember(MemberBean mb) {

		int result = sqlSessionTemplate.update(namespace+".updateMember",mb);
		
		System.out.println("회원정보수정 결과 :"+result);
	}
	
	public void insertCoupon(Map<String, String> map) {
		int result = sqlSessionTemplate.update(namespace+".insertCoupon",map);
		System.out.println("쿠폰추가 결과:"+result);
	}
	
	public MemberBean getMemberAddress(String id) {
		MemberBean mbean = sqlSessionTemplate.selectOne(namespace+".getMemberAddress",id);
		return mbean;
	}
	public int ipHpCheck(Map<String, String> map) {

		int cnt = sqlSessionTemplate.selectOne(namespace+".ipHpCheck",map);
		System.out.println("cnt : "+cnt);
		return cnt;
	}
	public void updateLikePnum(Map<String, String> map) {
		int cnt = sqlSessionTemplate.update(namespace+".updateLikePnum",map);
		System.out.println("찜한 결과 :"+cnt);
	}
	public MemberBean getByMno(int seller_no) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".getByMno",seller_no);
		return mb;
	}
}
