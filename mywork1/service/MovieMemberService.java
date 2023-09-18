package egov.mywork1.service;

import java.util.List;

import egov.mywork1.service.impl.MovieMemberDAO;

public interface MovieMemberService {
	
	String insertMember(MovieMemberVO vo) throws Exception;
	int selectMvmemberUserID(String userid) throws Exception;
	MovieMemberVO selectMemberDetail(String userid) throws Exception;
	int selectMC(MovieMemberVO vo) throws Exception;
	// 아이디 체크
	int selectmovieMemberUserID(String userid) throws Exception;
	// 로그인
	int selectMemberCount(MovieMemberVO vo) throws Exception;
	int updateMovieMember(MovieMemberVO vo) throws Exception;
	
	   String selectMovieMemberUseridReturn(MovieMemberVO vo) throws Exception;

	   int selectMovieMemberExistCount(MovieMemberVO vo) throws Exception;

	   void updateMovieMemberPass(MovieMemberVO vo) throws Exception;
	   
	// 회원 탈퇴 비밀번호 체크 
	int selectPwCheck(MovieMemberVO vo) throws Exception;
	// 회원 탈퇴
	void updateMemberState(MovieMemberVO vo) throws Exception;
	// 비밀번호 변경
	void updatepw(MovieMemberVO vo) throws Exception;
	// 회원 상태 확인
	int selectStatechk(MovieMemberVO vo) throws Exception;
	
	//마이페이지
	 List<?> selectMemberList(String userid) throws Exception;
     
     MypageVO selectMbreserveDetail(MypageVO vo) throws Exception;
     
     int deletembrDelete(MypageVO vo) throws Exception;

}
