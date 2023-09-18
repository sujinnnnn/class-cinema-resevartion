package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.MovieMemberVO;
import egov.mywork1.service.MypageVO;

@Repository("movieMemberDAO") // 어노테이션(해당클래스)
public class MovieMemberDAO extends EgovAbstractDAO {

	public String insertMember(MovieMemberVO vo) {		
		return (String) insert("movieMemberDAO.insertMember",vo);
	}

	public int selectMvmemberUserID(String userid) {
		return (int) select("movieMemberDAO.selectMvmemberUserID",userid);
	}

	public MovieMemberVO selectMemberDetail(String userid) {
		return (MovieMemberVO) select("movieMemberDAO.selectMemberDetail",userid);
	}

	public int selectMC(MovieMemberVO vo) {		
		return (int) select("movieMemberDAO.selectMC",vo);
	}

	public int selectmovieMemberUserID(String userid) {
		return (int) select("movieMemberDAO.selectmovieMemberUserID",userid);
	}

	public int selectMemberCount(MovieMemberVO vo) {
		return (int) select("movieMemberDAO.selectMemberCount",vo);
	}

	public int updateMovieMember(MovieMemberVO vo) {
		return (int) update("movieMemberDAO.updateMovieMember",vo);
	}

	
	
	   public int selectMovieMemberExistCount(MovieMemberVO vo) {

		      return (int) select("movieMemberDAO.selectMovieMemberExistCount",vo);
		   }

		   public String selectMovieMemberUseridReturn(MovieMemberVO vo) {

		      return (String) select ("movieMemberDAO.selectMovieMemberUseridReturn",vo);
		   }

		   public void updateMovieMemberPass(MovieMemberVO vo) {
		      update ("movieMemberDAO.updateMovieMemberPass",vo);
		      
		   }
		   
	   public int selectPwCheck(MovieMemberVO vo) {
			return (int) select("movieMemberDAO.selectPwCheck",vo);
		}

		public void updateMemberState(MovieMemberVO vo) {
			update("movieMemberDAO.updateMemberState",vo);
		}

		public void updatepw(MovieMemberVO vo) {
			update("movieMemberDAO.updatepw",vo);
		}

		public int selectStatechk(MovieMemberVO vo) {
			return (int) select("movieMemberDAO.selectStatechk",vo);
		}

		public List<?> selectMemberList(String userid) {
	        return list ("movieMemberDAO.selectMemberList",userid);
	    }

		public MypageVO selectMbreserveDetail(String unq) {
			return (MypageVO) select("movieMemberDAO.selectMbreserveDetail",unq);
		}

		public int deletembrDelete(MypageVO vo) {
			return (int) delete("movieMemberDAO.deletembrDelete",vo);
		}

		public MypageVO selectMbreserveDetail(MypageVO vo) {
			return (MypageVO) select("movieMemberDAO.selectMbreserveDetail",vo);
		}


}
