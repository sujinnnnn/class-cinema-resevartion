package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.MovieTicketingService;
import egov.mywork1.service.MovieTicketingVO;


@Service("movieTicketingService")
public class MovieTicketingServiceImpl implements MovieTicketingService {

	 @Resource(name="movieTicketingDAO")
	   MovieTicketingDAO movieTicketingDAO; 

	   @Override
	   public List<?> selectTheaterList(MovieTicketingVO vo) throws Exception {
	      return movieTicketingDAO.selectTheaterList(vo);
	   }

	   @Override
	   public List<?> selectMovieList(MovieTicketingVO vo) throws Exception {
	      return movieTicketingDAO.selectMovieList(vo);
	   }

	   @Override
	   public List<?> selectTimeList(MovieTicketingVO vo) throws Exception {
	      return movieTicketingDAO.selectTimeList(vo);
	   }

	   @Override
	   public List<?> selectDateList(MovieTicketingVO vo) throws Exception {
	      return movieTicketingDAO.selectDateList(vo);

	   }

	@Override
	public MovieTicketingVO selectScheduleline(MovieTicketingVO v) throws Exception {
		return movieTicketingDAO.selectScheduleline(v);
	}
	
	
	 @Override
     public String insertTicketPay(MovieTicketingVO vo) throws Exception {
  
        return movieTicketingDAO.insertTicketPay(vo);
     }
  
     @Override
     public String selectPayMent(MovieTicketingVO vo) throws Exception {
  
        return movieTicketingDAO.selectPayMent(vo);
     }

	@Override
	public String insertTicket(MovieTicketingVO vo) throws Exception {
		return movieTicketingDAO.insertTicket(vo);
	}
}
