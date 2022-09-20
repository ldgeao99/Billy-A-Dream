package reservation.model;

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
			System.out.println("예약 결과 :"+result);
		}
}
