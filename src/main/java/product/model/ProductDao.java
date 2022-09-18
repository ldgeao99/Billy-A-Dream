package product.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProductDao {
private final String namespace = "product.model.SQL"; // product.xml 에서 namespace에 적어준것
	
	@Autowired //  root-context.xml에서 만들게 한 객체 주입
	SqlSession sqlSessionTemplate;
	
	public int insertProduct(ProductBean pbean){
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertProduct", pbean);
		return cnt;
	}
	
	public List<ProductBean> getRecentProductList(){
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace + ".GetRecentProductList");
		return lists;
	}
	
	public List<ProductBean> getPopularProductList(){
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace + ".GetPopularProductList");
		return lists;
	}
	
	
}
