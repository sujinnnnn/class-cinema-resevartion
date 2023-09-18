package egov.mywork1.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.mywork1.service.AdminMemberService;
import egov.mywork1.service.AdminMemberVO;
import egov.mywork1.service.AdminTheaterService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MovieMemberVO;

@Controller
public class AdminMemberController {
      
   
   @Resource(name = "adminMemberService") 
   AdminMemberService adminMemberService;
   
   @Resource(name = "adminTheaterService")
   AdminTheaterService adminTheaterService;   
   
   /** EgovPropertyService */
   @Resource(name = "propertiesService")
   protected EgovPropertyService propertiesService;
    
   
   @RequestMapping("/adminMemberWrite.do")
   public String adminlogin() {
      
      return "movie/admin/adminMemberWrite";
   }
   
   
    /*
     * 관리자 로그인 화면
     */
    @RequestMapping("/adminLogin.do")
      public String adminLoginWrite() {
         
         return "/movie/admin/adminLogin";
      }    
   /*
    * 관리자 로그인 sub
    */
   @RequestMapping("/adminLoginSub.do")
   @ResponseBody
   public String adminLoing(AdminMemberVO vo, HttpSession session) throws Exception {
      
      String message = "";
      /*
       * String pass1 = vo.getUserpw(); 
       * String pass2 = MyEncrypt.testMD5(pass1);
       * vo.setUserpw(pass2);
       */
      System.out.println("----------"+vo.getAdminid());
      int count = adminTheaterService.selectAdminCount(vo);
      System.out.println("----------"+count);
      if(count == 1) {
         // session 생성
         session.setAttribute("SessionAdminID", vo.getAdminid());
         // message 처리
         message = "ok";
      }         
         return message;
      }
   
    @RequestMapping("/adminMemberWriteSave.do")
      @ResponseBody
      public String insertAdLogin(AdminMemberVO vo,MultipartHttpServletRequest multiRequest) throws Exception {      
         System.out.println("123123123");
         String path = propertiesService.getString("Globals.fileStorePath");
       
         String adminpw = vo.getAdminpw();      
         String checkpw = vo.getCheckpw();
         String str = "";
         if( adminpw.length() < 6 || adminpw.length() > 12) {
            str = "len_over";
         } else if(!adminpw.equals(checkpw)) {
            str = "wrong";
         } else {      
            
           String postno = vo.getPostno();
           String addr1 = vo.getAddr1();
           String addr2=vo.getAddr2();
           String addr3=vo.getAddr3();
           String adminaddr = postno+" "+addr1+addr2+" "+addr3;
           vo.setAdminaddr(adminaddr);
           
           String branch = vo.getBranch();
           
           Map<String,String> map1 = uploadProcess(multiRequest,path,branch);        
         
         vo.setAdminpic(map1.get("f1").split("/")[0]);
            
         String result = adminMemberService.insertAdLogin(vo);   
          if(result==null) {
             str = "ok";
          }
         
         }
         return str;      
      }
   
   public static Map<String,String> uploadProcess( MultipartHttpServletRequest multiRequest , String path, String branch )       //영화정보 중 포스터 파일 업로드 메서드
         throws Exception {

      MultipartFile file;
      String save_dir = path;
      String save_file  = "";
      String filenames = "";
      String filesizes = "";
      String realsavename = "";
      
      Map<String, String> map = new HashMap<String, String>();
      
      File dirname = new File(save_dir);  // 물리적인 위치로 인식
      if (!dirname.exists()) dirname.mkdirs();
      
      //   업로드 파일 인식 ;;;   files : 파일이름(오리지널,암호화된이름),파일크기,파일종류 
      //   /tmp 디렉토리에 임시시장 ( abc.jpg -> xxxefsdf.sdfdf)
      Map<String, MultipartFile> files = multiRequest.getFileMap();
      
      // a.jpg  -->  /tmp/asfdasdfsadsadfxx11###.xxdfs         //임시폴더에 디폴트로 저장
      Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
      while (itr.hasNext()) {
         Entry<String, MultipartFile> entry = itr.next();
         file = entry.getValue();
         if (!"".equals(file.getOriginalFilename())) {         //file.getOriginalFilename():a.jpg
            realsavename = branch+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') );
            save_file = save_dir + "/" +realsavename;      
            file.transferTo(new File(save_file));                  //세이브파일:진짜 이름으로 저장
            
            filenames += realsavename+"/";
            filesizes += file.getSize()+"/";
         }
      }
      
      Map<String,String> map1 = new HashMap<String,String>();
      map1.put("f1",filenames);  //  filenames = "index.jsp／1234.PNG／";
      map1.put("f2",filesizes);  //         137／28647／
      
      return map1;
   }
   
    @RequestMapping("/adminList.do")
      public String selectadminList(DefaultVO vo, ModelMap model) throws Exception{
          List<?> list = adminMemberService.selectAdminList(vo);
          
            model.addAttribute("resultList",list);
            
            return "movie/admin/adminList";
      }
      
    @RequestMapping("/adminModify.do")
      public String SelectAdLoginDetail(String adminid, HttpSession session,ModelMap model) throws Exception {
         
         String url = "movie/admin/adminModify";
           
         if(adminid==null) {
            
         }else {
         
         AdminMemberVO vo = adminMemberService.selectAdLoginDetail(adminid);
         model.addAttribute("vo",vo);
         }
         return url;
      }
    @RequestMapping("/adminModifySave.do")
    @ResponseBody
      public String updateAdLgoin(AdminMemberVO vo) throws Exception {
         
         int result = adminMemberService.updateAdLogin(vo);
         String str = "";
         if(result == 0) str = "fail";
         else if(result == 1) str = "ok";
         
         return str;
      }
      // 직원 삭제/ 지점 삭제
    @RequestMapping("/adminDelete.do")
       public String deleteAdLogin(String adminid, String branch) throws Exception {
         /* String str =""; */
         int result = adminMemberService.deleteAdLogin(adminid);
        
        System.out.println("99999999999999"+result);
        if(result == 1) {
           int cnt = adminMemberService.deleteSchedule(branch);
           System.out.println("8888888888888"+cnt);
        }
         
         return "redirect:/adminList.do";
                
       }
    
    @RequestMapping("/adminLogout.do")
   @ResponseBody
   public String adminLogout(HttpSession session) {
      
      session.removeAttribute("SessionAdminID");
      return "1";
   }
    
 // 회원 목록
    @RequestMapping("/memberList.do")
    public String selectmemberList(MovieMemberVO vo, ModelMap model) throws Exception{
       
       // 페이징
      // 출력페이지번호
      
      System.out.println("#$#################12412414141241241");
      int pageIndex = vo.getPageIndex3();
      
      // 화면출력개수
      int pageUnit = vo.getPageUnit3();
      
      // firstIndex 값 계산
      int firstIndex = (pageIndex-1)*pageUnit+1;
      
      // lastIndex  값 계산
      int lastIndex = firstIndex + (pageUnit-1);
      
      // VO에 데이터 넣기
      vo.setFirstIndex3(firstIndex);
      vo.setLastIndex3(lastIndex); 
      System.out.println("#######!!!!!!!"+ vo.getFirstIndex3());
      int total = adminMemberService.selectMemberTotal(vo);
      
      System.out.println("#$#################"+total);
      
      // 화면 출력 시작번호
      int recordCountPerPage = total - ((pageIndex-1)*pageUnit); 
      vo.setRecordCountPerPage3(recordCountPerPage);
      
      int lastPage = (int) Math.ceil((double)total/pageUnit);
      vo.setLastPage3(lastPage);               
      
      model.addAttribute("vo",vo);
      model.addAttribute("total",total);
      // 페이징 E
       
        List<?> list = adminMemberService.selectMemberList(vo);
        
          model.addAttribute("resultList",list);
          
          return "movie/admin/memberList";
    }
    
    // 회원 상태 수정
    @RequestMapping("/memberStateModify.do")
    @ResponseBody
    public String updateMemberState(MovieMemberVO vo) throws Exception {
       
       String str ="";
       String state = vo.getState();
       System.out.println("!!!!!!!!!!!!!!!!!!!"+state);
       int cnt = adminMemberService.updateMemberState(vo);
      if(cnt ==1) str = "ok";
       
       return str;
    }


}