package egov.mywork1.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;
import java.util.List;

import egov.mywork1.service.AdminMemberVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MovieMemberVO;


@Repository("adminMemberDAO")
public class AdminMemberDAO extends EgovAbstractDAO{

   public String insertAdLogin(AdminMemberVO vo) {
         return (String) insert("adloginDAO.insertAdLogin",vo);
      }

      public List<?> selectadminList(DefaultVO vo) {
         return list ("adloginDAO.selectAdminList",vo);
         
      }

      public int updateAdLogin(AdminMemberVO vo) {
         return update("adloginDAO.updateAdLogin",vo);
      }

      public AdminMemberVO selectAdLoginDetail(String adminid) {
         return (AdminMemberVO) select("adloginDAO.selectAdminDetail",adminid);
      }

      public int deleteAdLogin(String adminid) {
         return delete("adloginDAO.deleteAdLogin",adminid);
      }
      
      public List<?> selectMemberList(MovieMemberVO vo) {
         return list ("adloginDAO.selectMemberList",vo);
      }

   public int updateMemberState(MovieMemberVO vo) {      
      return update("adloginDAO.updateMemberState",vo);
   }
   public int selectMemberTotal(MovieMemberVO vo) {
         return (int) select("adloginDAO.selectMemberTotal",vo);
    }

   public int deleteSchedule(String branch) {
      return delete("adloginDAO.deleteSchedule",branch);
   }


}