package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.MovieTicketingVO;


@Repository("movieTicketingDAO")
public class MovieTicketingDAO extends EgovAbstractDAO{

	   public List<?> selectTheaterList(MovieTicketingVO vo) {      
		      return list ("movieTicketingDAO.selectTheaterList",vo);
		   }

		   public List<?> selectMovieList(MovieTicketingVO vo) {
		      return list ("movieTicketingDAO.selectMovieList",vo);
		   }

		   public List<?> selectTimeList(MovieTicketingVO vo) {
		      return list ("movieTicketingDAO.selectTimeList",vo);
		   }

		   public List<?> selectDateList(MovieTicketingVO vo) {
		      return list ("movieTicketingDAO.selectDateList",vo);
		   }

		public MovieTicketingVO selectScheduleline(MovieTicketingVO v) {
			return (MovieTicketingVO) select ("movieTicketingDAO.selectScheduleline",v);
		}
		
		
	      public String insertTicketPay(MovieTicketingVO vo) {				/// 결제

	          return (String) insert("MovieTicketingDAO.insertTicketPay",vo);
	       }

	       public String selectPayMent(MovieTicketingVO vo) {

	          return (String) select("MovieTicketingDAO.insertPayMent",vo);
	       }

		public String insertTicket(MovieTicketingVO vo) {
			return (String) insert("MovieTicketingDAO.insertTicket",vo);
		}

}
