package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.AdminMemberVO;
import egov.mywork1.service.AdminTheaterVO;

@Repository("adminTheaterDAO")
public class AdminTheaterDAO extends EgovAbstractDAO {

   public List<?> selectTheaterList(AdminTheaterVO vo) {
      return list ("adminTheaterDAO.selectTheaterList",vo);
   }

   public String insertTheater(AdminTheaterVO vo) {      
      return (String) insert("adminTheaterDAO.insertTheater",vo);
   }

   public int updateTheater(AdminTheaterVO vo) {      
      return update("adminTheaterDAO.updateTheater",vo);
   }

   public int deleteTheater(AdminTheaterVO vo) {
      return delete("adminTheaterDAO.deleteTheater",vo);
   }

   public int updatedeleteTheaterNo(AdminTheaterVO vo) {
      return update("adminTheaterDAO.updatedeleteTheaterNo",vo);
   }

   public int selectAdminCount(AdminMemberVO vo) {
      return (int) select("adminTheaterDAO.selectAdminCount",vo);
   }

   public AdminTheaterVO selectAdminBranch(String userid) {
      return (AdminTheaterVO) select("adminTheaterDAO.selectAdminBranch",userid);
   }

   public List<?> selectTheaterList2(String userid) {
      return list ("adminTheaterDAO.selectTheaterList2",userid);
   }

   public int deleteTheaterSchedule(AdminTheaterVO vo) {
      return delete("adminTheaterDAO.deleteTheaterSchedule",vo);
   }

   public int selectScheduleCount(AdminTheaterVO vo) {
      return (int) select("adminTheaterDAO.selectScheduleCount",vo);
   }

}