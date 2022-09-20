package reservation.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import product.model.ProductBean;

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

		public List<ReservationBean> getAllByBuyer_no(String Buyer_no) {
			List<ReservationBean>lists =  sqlSessionTemplate.selectList(namespace+".getAllByBuyer_no",Buyer_no);
			return lists; 
		}

		public List<ReservationBean> getAllByMno(int mno) {
			List<ReservationBean> lists = sqlSessionTemplate.selectList(namespace+".getAllByMno",mno);
			return lists;
		}

		public void updateAccept(String rno) {
			int result = sqlSessionTemplate.update(namespace+".updateAccept",rno);
			System.out.println("승인한 결과 :"+result);
		}



}
