package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.AdminMemberVO;
import egov.mywork1.service.AdminTheaterService;
import egov.mywork1.service.AdminTheaterVO;

@Service("adminTheaterService")
public class AdminTheaterServiceImpl implements AdminTheaterService {
   
   @Resource(name="adminTheaterDAO") // 다른클래스를 호출해서 사용(name=사용할 클래스 별칭)
   AdminTheaterDAO adminTheaterDAO; // 진짜 클래스명

   @Override
   public List<?> selectTheaterList(AdminTheaterVO vo) throws Exception {
      return  adminTheaterDAO.selectTheaterList(vo);
   }

   @Override
   public String insertTheater(AdminTheaterVO vo) throws Exception {
      return adminTheaterDAO.insertTheater(vo);
   }

   @Override
   public int updateTheater(AdminTheaterVO vo) {
      return adminTheaterDAO.updateTheater(vo);
   }

   @Override
   public int deleteTheater(AdminTheaterVO vo) throws Exception {
      return adminTheaterDAO.deleteTheater(vo);
   }

   @Override
   public int updatedeleteTheaterNo(AdminTheaterVO vo) {
      return adminTheaterDAO.updatedeleteTheaterNo(vo);
   }

   @Override
   public int selectAdminCount(AdminMemberVO vo) throws Exception {
      return adminTheaterDAO.selectAdminCount(vo);
   }

   @Override
   public AdminTheaterVO selectAdminBranch(String userid) throws Exception {
      return adminTheaterDAO.selectAdminBranch(userid);
   }

   @Override
   public List<?> selectTheaterList2(String userid) throws Exception {
      return  adminTheaterDAO.selectTheaterList2(userid);
   }

   @Override
   public int deleteTheaterSchedule(AdminTheaterVO vo) throws Exception {
      return adminTheaterDAO.deleteTheaterSchedule(vo);
   }

   @Override
   public int selectScheduleCount(AdminTheaterVO vo) throws Exception {
      return adminTheaterDAO.selectScheduleCount(vo);
   }

   

}