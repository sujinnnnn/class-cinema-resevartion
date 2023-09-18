package egov.mywork1.service;

import java.util.List;


public interface AdminMemberService {

   
      String insertAdLogin(AdminMemberVO vo) throws Exception;

      List<?> selectAdminList(DefaultVO vo) throws Exception;

      int updateAdLogin(AdminMemberVO vo) throws Exception;

      AdminMemberVO selectAdLoginDetail(String adminid) throws Exception;

      int deleteAdLogin(String adminid) throws Exception;
      // 회원 목록
      List<?> selectMemberList(MovieMemberVO vo) throws Exception;
      // 회원 상태 수정
      int updateMemberState(MovieMemberVO vo) throws Exception;
      // 회원 total
      int selectMemberTotal(MovieMemberVO vo) throws Exception;
      // 지점 스케줄 삭제
     int deleteSchedule(String branch) throws Exception;;
     
}