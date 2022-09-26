package review.model;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.PagingReview;

@Component("ReviewDao")
public class ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace = "review.model.ReviewBean";

	public void WriteReview(ReviewBean rb) {

		int result = sqlSessionTemplate.insert(namespace+".WriteReview",rb);
		System.out.println("삽입한 결과:"+result);
		
	}
	
	public int getTotalCount(String pno) {
		
		int count = sqlSessionTemplate.selectOne(namespace+".getTotalCount",pno);
		System.out.println("가져온 레코드 갯수 : "+count);
		return count;
	}

	public List<ReviewBean> getReviewList(PagingReview pageInfo, String pno) {
		
		RowBounds rowBounds = 
				new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
			//몇개 뛰고 ,몇개 보여주나

			List<ReviewBean>lists = sqlSessionTemplate.selectList(namespace+".getReviewList",pno,rowBounds);
			// rowBounds 보내면 현재페이지에 보여줄 레코드갯수만 가져옴
		return lists;
	}
}
