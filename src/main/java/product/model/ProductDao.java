package product.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.PagingProduct;

@Component("productDao")
public class ProductDao {
	
	private final String namespace = "product.model.SQL";
	
	@Autowired
	SqlSession sqlSessionTemplate;
	
	public int insertProduct(ProductBean pbean){
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertProduct", pbean);
		return cnt;
	}
	
	public List<ProductBean> getRecentProductList(Map<String, String> map, PagingProduct pageInfo){
		System.out.println("pageInfo.getOffset(): " + pageInfo.getOffset()); 
		System.out.println("pageInfo.getLimit(): " + pageInfo.getLimit()); 
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace + ".GetRecentProductList", map, rowBounds);
		return lists;
	}
	
	public List<ProductBean> getPopularProductList(Map<String, String> map, PagingProduct pageInfo){
		System.out.println("pageInfo.getOffset(): " + pageInfo.getOffset()); 
		System.out.println("pageInfo.getLimit(): " + pageInfo.getLimit()); 
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit()); 
		
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace + ".GetPopularProductList", map, rowBounds);
		return lists;
	}
	
	public List<ProductBean> getProductListBySearch(Map<String, String> map, PagingProduct pageInfo) {
		System.out.println("pageInfo.getOffset(): " + pageInfo.getOffset()); 
		System.out.println("pageInfo.getLimit(): " + pageInfo.getLimit()); 
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit()); 
	
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace+".GetProductListBySearch", map, rowBounds);
		return lists;
	}
	
	public int getTotalSearchCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalSearchCount", map);
		return cnt;
	}
	
	public ProductBean getByNo(String no) {
		ProductBean pb = sqlSessionTemplate.selectOne(namespace+".GetByNo",no);
		return pb;
	}

	public void updateView_count(String no) {
		sqlSessionTemplate.update(namespace+".updateView_count",no);	
	}
	
	public List<ProductBean> getByseller_no(String seller_no) {
		List<ProductBean> lists =  sqlSessionTemplate.selectList(namespace+".getByseller_no",seller_no);
		return lists;
	}

	public List<ProductBean> getAllByNo(String[] pnoLists) {
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace+".getAllByNo",pnoLists);
		return lists;
	}

	public int updateProduct(ProductBean pbFromForm) {
		int cnt =  sqlSessionTemplate.update(namespace+".UpdateProduct", pbFromForm);
		return cnt;
	}

	public int deleteProduct(String no) {
		int cnt =  sqlSessionTemplate.delete(namespace+".DeleteProduct", no);
		return cnt;
	}

	public void updatePulledDay(String no) {
		sqlSessionTemplate.update(namespace+".updatePulledDay",no);
		
	}

	public List<ProductBean> getEqualCate(Map<String, String> map) {
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace+".getEqualCate",map);
		return lists;
	}
	
	public int getTotalSellerPrdCount(int seller_no) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalSellerPrdCount", seller_no);
		return cnt;
	}
	
	public List<ProductBean> getTotalSellerPrd(int seller_no, PagingProduct pageInfo) {
		System.out.println("pageInfo.getOffset(): " + pageInfo.getOffset()); 
		System.out.println("pageInfo.getLimit(): " + pageInfo.getLimit()); 
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit()); 
	
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace+".GetTotalSellerPrd", seller_no, rowBounds);
		return lists;
	}

}
