package reservation.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ReservationDao")
public class ReservationDao {
		
		@Autowired
		SqlSessionTemplate sqlSessionTemplate;
		
		private String namespace="reservation.model.ReservationBean";

		public void InsertReservation(ReservationBean rb) {
			int result = sqlSessionTemplate.insert(namespace+".InsertReservation",rb);
			System.out.println(result);
		}
		
		public List<ReservationBean> getAllReservationOnlyDates(String pno) {
			List<ReservationBean> result = sqlSessionTemplate.selectList(namespace+".GetAllReservationOnlyDates", pno);
			System.out.println("size:" + result.size());
			return result;
		}
}
