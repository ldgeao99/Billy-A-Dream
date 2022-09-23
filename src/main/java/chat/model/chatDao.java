package chat.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("chatDao")
public class chatDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	private String namespace="chat.model.chatBean";


	public List<chatBean> getByRoom_no(int room_no) {
		
		List<chatBean> lists = sqlSessionTemplate.selectList(namespace+".getByRoom_no",room_no);
		
		return lists;
	}


	public int sendMsg(chatBean cb) {
		int result = sqlSessionTemplate.insert(namespace+".sendMsg",cb);
		return result;
	}
}
