package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.AdminMemberService;
import egov.mywork1.service.AdminMemberVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MovieMemberVO;


@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

     @Resource(name="adminMemberDAO")
     AdminMemberDAO adminMemberDAO;

      
   @Override
   public String insertAdLogin(AdminMemberVO vo) throws Exception {
      System.out.println("5555555555");
      return adminMemberDAO.insertAdLogin(vo);
   }

   @Override
   public List<?> selectAdminList(DefaultVO vo) throws Exception {
      return adminMemberDAO.selectadminList(vo);
   }

   @Override
   public int updateAdLogin(AdminMemberVO vo) throws Exception {
      return adminMemberDAO.updateAdLogin(vo);
   }

   @Override
   public AdminMemberVO selectAdLoginDetail(String adminid) throws Exception {
      return adminMemberDAO.selectAdLoginDetail(adminid);
   }

   @Override
   public int deleteAdLogin(String adminid) throws Exception {
      return adminMemberDAO.deleteAdLogin(adminid);
   }
   
   @Override
   public List<?> selectMemberList(MovieMemberVO vo) {
      return adminMemberDAO.selectMemberList(vo);
   }

   @Override // 회원 상태 수정
   public int updateMemberState(MovieMemberVO vo) throws Exception {
      return adminMemberDAO.updateMemberState(vo);
   }
   @Override // 회원 total
    public int selectMemberTotal(MovieMemberVO vo) throws Exception {
       return adminMemberDAO.selectMemberTotal(vo);
    }

   @Override
   public int deleteSchedule(String branch) throws Exception {
      return adminMemberDAO.deleteSchedule(branch);
   }


}