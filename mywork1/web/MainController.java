package egov.mywork1.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.mywork1.service.AdminMemberService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MovieAdminService;
import egov.mywork1.service.MovieAdminVO;

@Controller
public class MainController {
	
	@Resource(name="movieAdminService")
	MovieAdminService movieAdminService;
	
	@Resource(name="adminMemberService")
	AdminMemberService adminMemberService;
   
   @RequestMapping("/index.do")
   public String index() {
      
      return "index";
   }

	/*
	 * @RequestMapping("/main.do") public String main() {
	 * 
	 * return "main/main"; }
	 * 
	 * @RequestMapping("/adminNoticeList.do") public String selectNoticeList() {
	 * 
	 * return "admin/board/adminNoticeList"; }
	 */
   
 //메인홈페이지 화면
 	@RequestMapping("/movieMain.do")
 	public String mainPage(ModelMap model,MovieAdminVO vo) throws Exception {
 		
 	// 출력페이지 번호
 	      int pageIndex1 = vo.getPageIndex1();
 	     
 	      
 	      // 출력페이지 번호
 	      int pageIndex2 = vo.getPageIndex2();
 	      
 	      // 화면출력 개수 
 	      int pageUnit = vo.getPageUnit();
 	      
 	      // firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
 	      int firstIndex1 = (pageIndex1-1)*pageUnit + 1;
 	      int firstIndex2 = (pageIndex2-1)*pageUnit + 1;
 	      
 	      // lastIndex 값 계산
 	      int lastIndex1 = pageIndex1*pageUnit;
 	      int lastIndex2 = pageIndex2*pageUnit;
 	      
 	      vo.setFirstIndex1(firstIndex1);
 	      vo.setLastIndex1(lastIndex1);
 	      
 	      vo.setFirstIndex2(firstIndex2);
 	      vo.setLastIndex2(lastIndex2);
 	     
 	      //상영중 토탈
 	      int total1 = movieAdminService.selectMovie1Total(vo);
 	      //상영예정 토탈
 	      int total2 = movieAdminService.selectMovie2Total(vo);
 	     
 	      
 	      // 출력화면 시작번호
 	      int recordCountPerPage1 = total1 - ((pageIndex1-1)*pageUnit);
 	      vo.setRecordCountPerPage1(recordCountPerPage1);
 	      
 	      int recordCountPerPage2 = total2 - ((pageIndex2-1)*pageUnit);
 	      vo.setRecordCountPerPage2(recordCountPerPage2);

 	      // 12/10 ->  ceil(1.2) -> 2
 	      int lastPage1 = (int) Math.ceil((double)total1/pageUnit);
 	      vo.setLastPage1(lastPage1);
 	      int lastPage2 = (int) Math.ceil((double)total2/pageUnit);
 	      vo.setLastPage2(lastPage2);
 	      
 	  
 	      
 	      //화면 리스트 출력
 	      List<?> listSoon = movieAdminService.selectMainListSoon(vo);
 	      List<?> listNow = movieAdminService.selectMainListNow(vo);
 	      List<?> dday = movieAdminService.selectDday(vo);
 	      
 	    
 	      
 	      model.addAttribute("vo", vo);
 	      model.addAttribute("totalNow", total1);
 	      model.addAttribute("totalSoon",total2);
 	      
 	      model.addAttribute("dday",dday);
 	      model.addAttribute("listSoon",listSoon);
 	      model.addAttribute("listNow",listNow);
 		
 		return "/movie/movieMain/movieMain";
 	}
 	//관리자메인
 	@RequestMapping("/adminMain.do")
 	public String adminMainPage(ModelMap model,MovieAdminVO vo) throws Exception {
 		
 	// 출력페이지 번호
	      int pageIndex1 = vo.getPageIndex1();
	      
	      
	      // 출력페이지 번호
	      int pageIndex2 = vo.getPageIndex2();
	      
	      // 화면출력 개수 
	      int pageUnit = vo.getPageUnit();
	      
	      // firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
	      int firstIndex1 = (pageIndex1-1)*pageUnit + 1;
	      int firstIndex2 = (pageIndex2-1)*pageUnit + 1;
	      
	      // lastIndex 값 계산
	      int lastIndex1 = pageIndex1*pageUnit;
	      int lastIndex2 = pageIndex2*pageUnit;
	      
	      vo.setFirstIndex1(firstIndex1);
	      vo.setLastIndex1(lastIndex1);
	      
	      vo.setFirstIndex2(firstIndex2);
	      vo.setLastIndex2(lastIndex2);
	      
	      //상영중 토탈
	      int total1 = movieAdminService.selectMovie1Total(vo);
	      //상영예정 토탈
	      int total2 = movieAdminService.selectMovie2Total(vo);
	      
	      // 출력화면 시작번호
	      int recordCountPerPage1 = total1 - ((pageIndex1-1)*pageUnit);
	      vo.setRecordCountPerPage1(recordCountPerPage1);
	      
	      int recordCountPerPage2 = total2 - ((pageIndex2-1)*pageUnit);
	      vo.setRecordCountPerPage2(recordCountPerPage2);

	      // 12/10 ->  ceil(1.2) -> 2
	      int lastPage1 = (int) Math.ceil((double)total1/pageUnit);
	      vo.setLastPage1(lastPage1);
	      int lastPage2 = (int) Math.ceil((double)total2/pageUnit);
	      vo.setLastPage2(lastPage2);
 		
 		List<?> listSoon = movieAdminService.selectMainListSoon(vo);
 		List<?> listNow = movieAdminService.selectMainListNow(vo);
 		List<?> dday = movieAdminService.selectDday(vo);
 		
 			model.addAttribute("vo", vo);
	      model.addAttribute("totalNow", total1);
	      model.addAttribute("totalSoon",total2);
 		
 		model.addAttribute("dday",dday);
 		model.addAttribute("listSoon",listSoon);
 		model.addAttribute("listNow",listNow);
 		
 		return "/movie/movieMain/adminMain";
 	}
 	
 	//영업점정보
 	 	@RequestMapping("/branchInfo.do")
 	 	public String branchInfo(ModelMap model,DefaultVO vo) throws Exception {
 	 		
 	 		 List<?> list = adminMemberService.selectAdminList(vo);
 	 		
 	 		model.addAttribute("list",list);
 
 	 		
 	 		return "/movie/movieMain/branchInfo";
 	 	}
 	 	
 	 	 //스토어 화면
        @RequestMapping("/store.do")
        public String storePage(ModelMap model,MovieAdminVO vo) throws Exception {         
              
              //화면 리스트 출력
              List<?> store = movieAdminService.selectStoreMd(vo);             
            
              
              model.addAttribute("vo", vo);   
              model.addAttribute("store",store);
         
          
             return "/movie/movieMain/store";
        }
 	 	
}
 