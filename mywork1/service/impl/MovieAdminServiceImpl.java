package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egov.mywork1.service.MovieAdminService;
import egov.mywork1.service.MovieAdminVO;
import egov.mywork1.service.MovieTicketingVO;
import egov.mywork1.service.DefaultVO;

@Service("movieAdminService")
public class MovieAdminServiceImpl   extends EgovAbstractServiceImpl
								implements MovieAdminService {

	@Resource(name="movieAdminDAO")
	MovieAdminDAO movieAdminDAO;
	
	@Override
	public String insertmv(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.insertmv(vo);
	}

	@Override
	public String insertMovie(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.insertMovie(vo);
	}

	@Override
	public MovieAdminVO selectMovieInfo(String mvtitle) throws Exception {
		return movieAdminDAO.selectMovieInfo(mvtitle);
	}

	@Override
	public List<?> selectMovieInfoAll(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectMovieInfoAll(vo);
	}

	@Override
	public List<?> selectMvList(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectMvList(vo);
	}

	@Override
	public int deleteInfo(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.deleteInfo(vo);
	}

	@Override
	public MovieAdminVO selectSchedule(String unq) throws Exception {
		return movieAdminDAO.selectSchedule(unq);
	}

	@Override
	public int deleteSchedule(String unq) throws Exception {
		return movieAdminDAO.deleteSchedule(unq);
	}

	@Override
	public int updateMovieInfo(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.updateMovieInfo(vo);
	}

	@Override
	public int selectSchedulecnt(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectSchedulecnt(vo);
	}

	@Override
	public List<?> selectMainListSoon(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectMainListSoon(vo);
	}

	@Override
	public List<?> selectMainListNow(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectMainListNow(vo);
	}

	@Override
	public List<?> selectDday(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectDday(vo);
	}

	@Override
	public List<?> selectTicket() throws Exception {
		return movieAdminDAO.selectTicket();
	}

	@Override
	public String insertTicket(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.insertTicket(vo);
	}

	@Override
	public List<?> selectTicketChk(MovieTicketingVO v) throws Exception {
		return movieAdminDAO.selectTicketChk(v);
	}

	@Override
	public int selectSchedulecnt2(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectSchedulecnt2(vo);
	}
	
	
	@Override
	   public int selectMovie1Total(MovieAdminVO vo) throws Exception {
	      return movieAdminDAO.selectMovie1Total(vo);
	   }

	   @Override
	   public int selectMovie2Total(MovieAdminVO vo) throws Exception {
	      return movieAdminDAO.selectMovie2Total(vo);
	   }

	@Override
	public int updateMovieSchedule(MovieTicketingVO vo) throws Exception {
		return movieAdminDAO.updateMovieSchedule(vo);
	}

	@Override
	public List<?> selectTitle(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectTitle(vo);
	}

	@Override
	public int selectMovieTotal(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectMovieTotal(vo);
	}
	
	@Override
    public String insertMd(MovieAdminVO vo) throws Exception {
       return movieAdminDAO.insertMd(vo);
    }

    @Override
    public List<?> selectStoreMd(MovieAdminVO vo) throws Exception {
       return movieAdminDAO.selectStoreMd(vo);
    }
    @Override
    public int deleteStore(MovieAdminVO vo) throws Exception {
       return movieAdminDAO.deleteStore(vo);
    }

	@Override //스케줄 total
	public int selectScheduleTotal(MovieAdminVO vo) throws Exception {
		return movieAdminDAO.selectScheduleTotal(vo);
	}

}




