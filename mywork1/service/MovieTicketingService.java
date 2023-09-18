package egov.mywork1.service;

import java.util.List;

public interface MovieTicketingService {
	
	   List<?> selectTheaterList(MovieTicketingVO vo) throws Exception;
	   // 영화 목록 출력
	   List<?> selectMovieList(MovieTicketingVO vo) throws Exception;
	   // 영화 상영 시간 출력
	   List<?> selectTimeList(MovieTicketingVO vo) throws Exception;
	   // 영화 상영일 출력
	   List<?> selectDateList(MovieTicketingVO vo) throws Exception;
	   
	   
	// 예매화면에서 선택된 스케줄정보 출력해서 좌석창으로 보내기
	MovieTicketingVO selectScheduleline(MovieTicketingVO v) throws Exception;
	
	
	// 결제창
    String insertTicketPay(MovieTicketingVO vo) throws Exception;

	 // 결제 완료
	 String selectPayMent(MovieTicketingVO vo) throws Exception;
	String insertTicket(MovieTicketingVO vo) throws Exception;
	
	 
	 

}
