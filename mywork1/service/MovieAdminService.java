package egov.mywork1.service;

import java.util.List;

public interface MovieAdminService {
	
	String insertmv(MovieAdminVO vo) throws Exception;

	String insertMovie(MovieAdminVO vo) throws Exception;

	MovieAdminVO selectMovieInfo(String mvtitle) throws Exception;

	List<?> selectMovieInfoAll(MovieAdminVO vo) throws Exception;

	List<?> selectMvList(MovieAdminVO vo) throws Exception;

	int deleteInfo(MovieAdminVO vo) throws Exception;	//영화정보 삭제

	MovieAdminVO selectSchedule(String unq) throws Exception;	//스케줄모디파이출력

	int deleteSchedule(String unq) throws Exception;

	int updateMovieInfo(MovieAdminVO vo) throws Exception;	//영화정보 모디파이 세이브

	int selectSchedulecnt(MovieAdminVO vo) throws Exception;
	
	List<?> selectMainListSoon(MovieAdminVO vo) throws Exception;	// 메인화면 관련
	List<?> selectMainListNow(MovieAdminVO vo) throws Exception;
	List<?> selectDday(MovieAdminVO vo) throws Exception;
	
	
	List<?> selectTicket() throws Exception;			// 좌석선택관련
	String insertTicket(MovieAdminVO vo) throws Exception;
	List<?> selectTicketChk(MovieTicketingVO v) throws Exception;

	int selectSchedulecnt2(MovieAdminVO vo)throws Exception;
	
	int selectMovie1Total(MovieAdminVO vo) throws Exception;			//페이징
	   int selectMovie2Total(MovieAdminVO vo) throws Exception;

	int updateMovieSchedule(MovieTicketingVO vo)throws Exception;		//예매하면 전체좌석수 cnt만큼 마이너스

	List<?> selectTitle(MovieAdminVO vo) throws Exception;
	// 영화 갯수
	int selectMovieTotal(MovieAdminVO vo) throws Exception;
	
	// 상품 저장
	String insertMd(MovieAdminVO vo) throws Exception;
	//  상품 리스트 출력
	List<?> selectStoreMd(MovieAdminVO vo) throws Exception;
	
	// 상품 삭제
	int deleteStore(MovieAdminVO vo) throws Exception;
	// 스케줄 total
	int selectScheduleTotal(MovieAdminVO vo) throws Exception;

	
	 
}
