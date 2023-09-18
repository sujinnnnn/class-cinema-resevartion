package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.MovieAdminVO;
import egov.mywork1.service.MovieTicketingVO;

@Repository("movieAdminDAO")
public class MovieAdminDAO extends EgovAbstractDAO {

	public String insertmv(MovieAdminVO vo) {
		return (String) insert("movieAdminDAO.insertmv",vo);
	}

	public String insertMovie(MovieAdminVO vo) {
		return (String) insert("movieAdminDAO.insertMovie",vo);
	}

	public MovieAdminVO selectMovieInfo(String mvtitle) {
		return (MovieAdminVO) select("movieAdminDAO.selectMovieInfo",mvtitle);
	}

	public List<?> selectMovieInfoAll(MovieAdminVO vo) {
		return list("movieAdminDAO.selectMovieInfoAll",vo);
	}

	public List<?> selectMvList(MovieAdminVO vo) {
		return list("movieAdminDAO.selectMvList",vo);
	}

	public int deleteInfo(MovieAdminVO vo) {
		return delete("movieAdminDAO.deleteInfo",vo);
	}

	public MovieAdminVO selectSchedule(String unq) {
		return (MovieAdminVO) select("movieAdminDAO.selectSchedule",unq);
	}

	public int deleteSchedule(String unq) {
		return delete("movieAdminDAO.deleteSchedule",unq);
	}

	public int updateMovieInfo(MovieAdminVO vo) {
		return update("movieAdminDAO.updateMovieInfo",vo);
	}

	public int selectSchedulecnt(MovieAdminVO vo) {
		return (int) select("movieAdminDAO.selectSchedulecnt",vo);
	}
	
	//메인화면 상영리스트 출력	시작
	public List<?> selectMainListSoon(MovieAdminVO vo) {
		return list("movieAdminDAO.selectMainListSoon",vo);
	}

	public List<?> selectMainListNow(MovieAdminVO vo) {
		return list("movieAdminDAO.selectMainListNow",vo);
	}

	public List<?> selectDday(MovieAdminVO vo) {
		return list("movieAdminDAO.selectDday",vo);
	}
	//메인화면 상영리스트 출력 끝
	
	
	public List<?> selectTicket() {
      return list("movieDAO.selectTicket");
   }

   public String insertTicket(MovieAdminVO vo) {
      return (String) insert("movieDAO.insertTicket",vo);
   }

   public List<?> selectTicketChk(MovieTicketingVO v) {
      return list("movieDAO.selectTicketChk",v);
   }

	public int selectSchedulecnt2(MovieAdminVO vo) {
		return (int) select("movieAdminDAO.selectSchedulecnt2",vo);
	}
	
	
	public int selectMovie1Total(MovieAdminVO vo) {
	    return (int) select("movieDAO.selectMovie1Total",vo);
	 }
	
	 public int selectMovie2Total(MovieAdminVO vo) {
	    return (int) select("movieDAO.selectMovie2Total",vo);
	 }
	
	public int updateMovieSchedule(MovieTicketingVO vo) {
		return update("movieAdminDAO.updateMovieSchedule",vo);
	}
	
	public List<?> selectTitle(MovieAdminVO vo) {
		return list("movieAdminDAO.selectTitle",vo);
	}
	
	public int selectMovieTotal(MovieAdminVO vo) {	
		return (int) select("movieAdminDAO.selectMovieTotal",vo);
	}
	public String insertMd(MovieAdminVO vo) {
		return (String) insert("movieAdminDAO.insertMd",vo);
	}
	public List<?> selectStoreMd(MovieAdminVO vo) {
		return list("movieAdminDAO.selectStoreMd",vo);
	}
	public int deleteStore(MovieAdminVO vo) {
	   return (int) delete("movieAdminDAO.deleteStore",vo);
	}

	public int selectScheduleTotal(MovieAdminVO vo) {
		System.out.println("여기까지 오나요?");
		return (int) select("movieAdminDAO.selectScheduleTotal",vo);
	}
	
}
