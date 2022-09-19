package wishlist.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class WishlistDao {
	
	private final String namespace = "wishlist.model.SQL";
	
	@Autowired
	SqlSession sqlSessionTemplate;

	public Boolean isExistUserInThisProduct(WishlistBean wb) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".IsExistUserInThisProduct", wb);
		
		if(cnt > 0) {
			return true;
		}else {
			return false;
		}
	}

	public int deleteWishlist(WishlistBean wb) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DeleteWishlist", wb);
		return 0;
	}

	public int insertWishlist(WishlistBean wb) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertWishlist", wb);
		return 0;
	}

	public int getCountWishMembers(String product_no) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GetCountWishMembers", product_no);
		return cnt;
	}
	
	public List<WishlistBean> getWishListByMno(String member_no) {
		List<WishlistBean> lists = sqlSessionTemplate.selectList(namespace + ".GetWishListByMno", member_no);
		return lists;
	}
}
