package egov.mywork1.service;

import java.util.List;

public interface AdminTheaterService {
   
   // 상영관 목록 출력
   List<?> selectTheaterList(AdminTheaterVO vo) throws Exception;
   // 상영관 등록
   String insertTheater(AdminTheaterVO vo) throws Exception;
   // 상영관 수정
   int updateTheater(AdminTheaterVO vo) throws Exception;
   // 상영관 삭제
   int deleteTheater(AdminTheaterVO vo) throws Exception;
   // 번호 순서 
   int updatedeleteTheaterNo(AdminTheaterVO vo);
   // 관리자 로그인
   int selectAdminCount(AdminMemberVO vo) throws Exception;
   // 영업점 불러오기
   AdminTheaterVO selectAdminBranch(String userid) throws Exception;
   
   // 상영관 목록 출력(영화스케줄등록)
   List<?> selectTheaterList2(String userid) throws Exception;
   // 상영관 삭제 -> 스케줄 상영관 삭제
   int deleteTheaterSchedule(AdminTheaterVO vo) throws Exception;
   // 스케줄 여부
   int selectScheduleCount(AdminTheaterVO vo) throws Exception;   
   
}