package room.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("roomDao")
public class roomDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	private String namespace="room.model.roomBean";


	public roomBean searchRoom(roomBean rb) {
		roomBean rbean = sqlSessionTemplate.selectOne(namespace+".searchRoom", rb);
		return rbean;
	}


	public void createRoom(roomBean rb) {
		int result = sqlSessionTemplate.insert(namespace+".createRoom",rb);
		System.out.println("방 만든 결과 :"+result);
	}


	public Integer getMaxRoom() {
		Integer maxRoom_no = sqlSessionTemplate.selectOne(namespace+".getMaxRoom");
		return maxRoom_no;
	}


	public List<roomBean> searchRoomById(String id) {
		List<roomBean> rb = sqlSessionTemplate.selectList(namespace+".searchRoomById",id);
		return rb;
	}
}
