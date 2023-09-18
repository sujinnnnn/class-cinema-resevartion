package egov.mywork1.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.AdminMemberVO;
import egov.mywork1.service.AdminTheaterService;
import egov.mywork1.service.AdminTheaterVO;
import egov.mywork1.service.MovieMemberVO;

@Controller
public class AdminTheaterController {

   @Resource(name = "adminTheaterService")
   AdminTheaterService adminTheaterService;   
   
   /*
    * 상영관 관리
    */
   @RequestMapping("/adminTheaterWrite.do")
   public String selectTheaterList(AdminTheaterVO vo, HttpSession session, ModelMap model) 
                                                      throws Exception {
      
      
      String userid = (String) session.getAttribute("SessionAdminID");
      
      if(userid != null) {
         
      
      AdminTheaterVO v = adminTheaterService.selectAdminBranch(userid);      
      
      vo.setId(userid);      
      
      List<?> list = adminTheaterService.selectTheaterList(vo);
      
      model.addAttribute("list",list);
      model.addAttribute("vo",v);
      
      }
      
      return "/movie/admin/adminTheaterWrite";
   }
   /*
    * 상영관 등록
    */      
   @RequestMapping("/adminTheaterRegister.do")
   @ResponseBody
   public String insertTheater(AdminTheaterVO vo) throws Exception {
   
      String str="";   
      
      if(vo.getNo() == null || vo.getNo().equals("")) {
         String result = adminTheaterService.insertTheater(vo);      
         if(result == null) str = "ok";
         
      } else {
         int cnt = adminTheaterService.updateTheater(vo);
         if(cnt ==1) str = "ok";
         
      }      
   
      return str;
   }
   
   /*
    * 상영관 삭제   
    */
   @RequestMapping("theaterDelete.do")
   @ResponseBody
   public String deleteMene(AdminTheaterVO vo, HttpSession session ) throws Exception {
      
      String str = "";
      String userid = (String) session.getAttribute("SessionAdminID");
      vo.setId(userid);
      int cnt = 0;
      
      int theater = adminTheaterService.selectScheduleCount(vo);
      if( theater == 0) {
      int cnt1 =  adminTheaterService.deleteTheater(vo);
         if(cnt1 == 1) {
            str = "ok2";
            int cnt3 = adminTheaterService.deleteTheaterSchedule(vo);
            if(cnt3 == 1){
               str = "ok";
            }            
         }
      }
      else {
         str = "4";
      }
      
      if(str != "4") {
    	  adminTheaterService.updatedeleteTheaterNo(vo);
      }
      
      
      System.out.println("2222222222222"+userid);      
      System.out.println("1111111111111"+cnt);
      System.out.println("9999999999999"+theater);
      
      return str;
   }
   
    

}