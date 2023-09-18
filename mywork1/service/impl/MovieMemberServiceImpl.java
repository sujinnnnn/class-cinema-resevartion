package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.MovieMemberService;
import egov.mywork1.service.MovieMemberVO;
import egov.mywork1.service.MypageVO;

@Service("movieMemberService")
public class MovieMemberServiceImpl implements MovieMemberService {
	
	@Resource(name="movieMemberDAO") // 다른클래스를 호출해서 사용(name=사용할 클래스 별칭)
	MovieMemberDAO movieMemberDAO; // 진짜 클래스명

	@Override
	public String insertMember(MovieMemberVO vo) throws Exception {
		return movieMemberDAO.insertMember(vo);
	}

	@Override
	public int selectMvmemberUserID(String userid) throws Exception {
		return movieMemberDAO.selectMvmemberUserID(userid);
	}

	@Override
	public MovieMemberVO selectMemberDetail(String userid) throws Exception {
		return movieMemberDAO.selectMemberDetail(userid);
	}

	@Override
	public int selectMC(MovieMemberVO vo) throws Exception {
		return movieMemberDAO.selectMC(vo);
	}

	@Override
	public int selectmovieMemberUserID(String userid) throws Exception {
		return movieMemberDAO.selectmovieMemberUserID(userid);
	}

	@Override
	public int selectMemberCount(MovieMemberVO vo) throws Exception {
		return movieMemberDAO.selectMemberCount(vo);
	}

	@Override
	public int updateMovieMember(MovieMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return movieMemberDAO.updateMovieMember(vo);
	}

	
	   @Override
	   public String selectMovieMemberUseridReturn(MovieMemberVO vo) throws Exception {

	      return movieMemberDAO.selectMovieMemberUseridReturn(vo);
	   }

	   @Override
	   public int selectMovieMemberExistCount(MovieMemberVO vo) throws Exception {

	      return movieMemberDAO.selectMovieMemberExistCount(vo);
	   }

	   @Override
	   public void updateMovieMemberPass(MovieMemberVO vo) throws Exception {

	      movieMemberDAO.updateMovieMemberPass(vo);
	   }
	   
	   @Override
	   public int selectPwCheck(MovieMemberVO vo) throws Exception {
	   	return movieMemberDAO.selectPwCheck(vo);
	   }

	   @Override
	   public void updateMemberState(MovieMemberVO vo) throws Exception {
	   	movieMemberDAO.updateMemberState(vo);
	   	
	   }

	   @Override
	   public void updatepw(MovieMemberVO vo) throws Exception {
	   	movieMemberDAO.updatepw(vo);
	   }

	   @Override
	   public int selectStatechk(MovieMemberVO vo) throws Exception {
	   	return movieMemberDAO.selectStatechk(vo);
	   }
	   
	   //마이페이지
		@Override
		public List<?> selectMemberList(String userid) throws Exception {
			return movieMemberDAO.selectMemberList(userid);
		}
	
		@Override
		public MypageVO selectMbreserveDetail(MypageVO vo) throws Exception {
			return movieMemberDAO.selectMbreserveDetail(vo);
		}
	
		@Override
		public int deletembrDelete(MypageVO vo) throws Exception {
			return movieMemberDAO.deletembrDelete(vo);
		}
	   

}
