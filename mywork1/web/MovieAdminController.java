package egov.mywork1.web;

import java.util.Iterator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
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


import egov.mywork1.service.MovieAdminService;
import egov.mywork1.service.MovieAdminVO;
import egov.mywork1.service.AdminTheaterService;
import egov.mywork1.service.AdminTheaterVO;
import egov.mywork1.service.DefaultVO;

@Controller
public class MovieAdminController {

	@Resource(name="movieAdminService")
	MovieAdminService movieAdminService;
	
	@Resource(name="adminTheaterService")
	AdminTheaterService adminTheaterService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping("/adminPage.do")
	public String adminPage() {
		return "movie/movieAdmin/adminPage";
	}
	
	
	
	
	   @RequestMapping("/adminMovieInfoWrite.do")				//영화정보등록창
	   public String movieWrite(AdminTheaterVO vo,HttpSession session,ModelMap model) throws Exception{
		   
		   String userid = (String) session.getAttribute("SessionAdminID");

		   AdminTheaterVO v = adminTheaterService.selectAdminBranch(userid);	
		   
		   model.addAttribute("vo",v);
		   
	      return "/movie/movieAdmin/adminMovieInfoWrite";
	   }
	   

	   
	   @RequestMapping("adminMovieInfoWriteSave.do")			//영화정보저장
		@ResponseBody
		public String insertFileboard(MovieAdminVO vo,MultipartHttpServletRequest multiRequest) 
																throws Exception {
			System.out.println("########## Controller ##########");
			
			String path = propertiesService.getString("Globals.fileStorePath");
			
			System.out.println("path:::::::::::"+path);
			String mvtitle = vo.getMvtitle();
			
			Map<String,String> map1 = uploadProcess(multiRequest,path,mvtitle);
			
		
			String message = mvtitle+" ";
			
			vo.setMvpost(map1.get("f1").split("/")[0]);
			vo.setMvprev(map1.get("f1").split("/")[1]);
			
			String result=movieAdminService.insertMovie(vo);
			
			//if( result != null ) message = "error"; 
			//map.put("filename", filename);
			//map.put("cnt", Integer.toString(cnt));
			//System.out.println("filename :::: " + filename);
			

			return message;
		}
		
		public static Map<String,String> uploadProcess( MultipartHttpServletRequest multiRequest , String path, String mvtitle ) 		//영화정보 중 포스터 파일 업로드 메서드
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
			
			// a.jpg  -->  /tmp/asfdasdfsadsadfxx11###.xxdfs			//임시폴더에 디폴트로 저장
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
			while (itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				if (!"".equals(file.getOriginalFilename())) {			//file.getOriginalFilename():a.jpg
					realsavename = mvtitle+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') );
					save_file = save_dir + "/" +realsavename;		
					file.transferTo(new File(save_file));						//세이브파일:진짜 이름으로 저장
					
					filenames += realsavename+"/";
					filesizes += file.getSize()+"/";
				}
			}
			
			Map<String,String> map1 = new HashMap<String,String>();
			map1.put("f1",filenames);  //  filenames = "index.jsp／1234.PNG／";
			map1.put("f2",filesizes);  //         137／28647／
			
			return map1;
		}
	   
		@RequestMapping("/adminMovieInfoList.do")			//영화정보 리스트창
		public String selectMovieInfo(AdminTheaterVO v,HttpSession session,MovieAdminVO vo, ModelMap model) throws Exception{
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
			int total = movieAdminService.selectMovieTotal(vo);
			
			System.out.println("#$#################"+total);
			
			// 화면 출력 시작번호
			int recordCountPerPage = total - ((pageIndex-1)*pageUnit); 
			vo.setRecordCountPerPage3(recordCountPerPage);
			
			int lastPage = (int) Math.ceil((double)total/pageUnit);
			vo.setLastPage3(lastPage);					
			
			model.addAttribute("vo",vo);
			model.addAttribute("total",total);
			// 페이징 E
			
			String userid = (String) session.getAttribute("SessionAdminID");
			if(userid!=null&&!userid.equals("")) {
			   v = adminTheaterService.selectAdminBranch(userid);
			   String branch=v.getBranch();
			   vo.setBranch(branch);
			}
			
			LocalDate today = LocalDate.now();
			
			 // 날짜를 원하는 형식으로 포맷팅
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String formattedDate = today.format(formatter);
	        vo.setTday(formattedDate);
	        
			List<?> list1 = movieAdminService.selectMovieInfoAll(vo);			
		
			model.addAttribute("resultList1", list1);
			model.addAttribute("vo", vo);
			model.addAttribute("pageIndex3",pageIndex);
			
			System.out.println("#$#################"+list1);
			System.out.println("#$#################"+vo);
			
			return "movie/movieAdmin/adminMovieInfoList";
		}
		
		
		
		  @RequestMapping("/adminMovieInfoModify.do")  //영화정보 수정입력창 일단보류
		  public String selectMovieInfoModify(String mvtitle, ModelMap model) throws Exception{ 
		  
		  MovieAdminVO vo = movieAdminService.selectMovieInfo(mvtitle);
		  
		  model.addAttribute("vo", vo);
		  
		  
		  return "movie/movieAdmin/adminMovieInfoModify"; }
		 
	   
	   @RequestMapping("adminMovieInfoModifySave.do")			//영화정보저장
		@ResponseBody
		public String updateMovieInfo(HttpSession session,MovieAdminVO vo,MultipartHttpServletRequest multiRequest) 
																throws Exception {
		   
		   String userid =(String) session.getAttribute("SessionAdminID");
		   String message = "";
			if(userid!=null && !userid.equals("")) {
		   
		   String mvpost = vo.getMvpost();
		   String mvprev = vo.getMvprev();
		   deleteFile(mvpost,mvprev);
			
			String path = propertiesService.getString("Globals.fileStorePath");
			
			String mvtitle = vo.getMvtitle();
			
			
			Map<String,String> map1 = uploadProcess(multiRequest,path,mvtitle);
			
			vo.setMvpost(map1.get("f1").split("/")[0]);
			vo.setMvprev(map1.get("f1").split("/")[1]);
			
			message = "(파일업로드 성공)";
			
			int result=movieAdminService.updateMovieInfo(vo);
			
			if((message!=null&&!message.equals(""))&&result!=0) {
				message = mvtitle+" ";
			}
			
			//if( result != null ) message = "error"; 
			//map.put("filename", filename);
			//map.put("cnt", Integer.toString(cnt));
			//System.out.println("filename :::: " + filename);
			
			}
			return message;
		}
	   
	   public static void deleteFile(String mvpost,String mvprev) throws Exception{
		   String filePath = "C:/eGovFrameDev-4.0.0-64bit (2) (1)/workspace2/mvproject/src/main/webapp/mvimages/moviePoster/"+mvpost; 
		   String filePath2 = "C:/eGovFrameDev-4.0.0-64bit (2) (1)/workspace2/mvproject/src/main/webapp/mvimages/moviePoster/"+mvprev; 

	        Path path = Paths.get(filePath);
	        Path path2 = Paths.get(filePath2);
	        
	        if(Files.exists(path)) {
	           Files.delete(path);
	        }
	        if(Files.exists(path2)) {
	           Files.delete(path2);
	        }

          
	   }
	   
	   @RequestMapping("/adminMovieInfoDelete.do")				//영화정보 삭제
		public String deleteInfo(MovieAdminVO vo,HttpSession session) throws Exception {
		  
			String mvpost = vo.getMvpost();
			String mvprev = vo.getMvprev();
			deleteFile(mvpost,mvprev);
			movieAdminService.deleteInfo(vo);
			
			return "redirect:adminMovieInfoList.do";
		}
	   
		  
		  
		  
		  
		  
	////////////////////////////////////////////////////영화스케줄 시작  
	@RequestMapping("/adminMovieScheduleWrite.do")            //스케줄등록
	public String boardWrite(AdminTheaterVO v1,HttpSession session,String mvtitle, ModelMap model) throws Exception{
	
		String userid =(String) session.getAttribute("SessionAdminID");
		if(userid!=null && !userid.equals("")) {
		
		
		AdminTheaterVO v = adminTheaterService.selectAdminBranch(userid);
		List<?> list = adminTheaterService.selectTheaterList2(userid);
		
		MovieAdminVO vo = movieAdminService.selectMovieInfo(mvtitle);
		String startday = vo.getStartday();
		String lastday = vo.getLastday();
		String startday_day = startday.substring(startday.length() - 2);
		String lastday_day = lastday.substring(lastday.length() - 2);
		String startday_year = startday.substring(0,4);
		String startday_month = startday.substring(5,7);
		String lastday_month = lastday.substring(5,7);
		
		
		
		
		int sday = Integer.parseInt(startday_day);
		int lday = Integer.parseInt(lastday_day);
		int syear = Integer.parseInt(startday_year);
		int smonth = Integer.parseInt(startday_month);
		int lmonth = Integer.parseInt(lastday_month);
		
		LocalDate date = LocalDate.of(syear, smonth, sday);      //시작일 날짜 추출
		
		YearMonth yearMonth = YearMonth.from(date);            // 시작일 날짜의 년도와 달
		
		int lastDayOfMonth = yearMonth.lengthOfMonth();         //시작일 달의 마지막 날짜 추출
		
		
		vo.setLastDayOfMonth(lastDayOfMonth);
		vo.setSday(sday);
		vo.setLday(lday);
		vo.setSyear(syear);
		vo.setSmonth(smonth);
		vo.setLmonth(lmonth);
		
		
		model.addAttribute("v",v);
		
		System.out.println("11111111111"+sday+lday);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		}
		return "movie/movieAdmin/adminMovieScheduleWrite";
		}     


	@RequestMapping("/adminMovieScheduleWriteSave.do")                  //스케줄저장
	@ResponseBody
		public String insertmv(MovieAdminVO vo,HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("SessionAdminID");
		String str = "";
		if(userid!=null && !userid.equals("")) {
		
		String[] seat =vo.getMvroom().split("/");
		vo.setMvroom(seat[0]);
		vo.setMvseat(seat[1]);
		
		String[] schedule = {vo.getSchedule1_1(),
                vo.getSchedule2_1() ,
                vo.getSchedule3_1() ,
                
                vo.getSchedule1_2() ,
                vo.getSchedule2_2() ,
                vo.getSchedule3_2() ,
                
                vo.getSchedule1_3() ,
                vo.getSchedule2_3() ,
                vo.getSchedule3_3() ,
                
                vo.getSchedule1_4(),
                vo.getSchedule2_4(),
                vo.getSchedule3_4(),
                
                vo.getSchedule1_5(),
                vo.getSchedule2_5(),
                vo.getSchedule3_5(),
                
                vo.getSchedule1_6(),
                vo.getSchedule2_6(),
                vo.getSchedule3_6(),
                
                vo.getSchedule1_7(),
                vo.getSchedule2_7(),
                vo.getSchedule3_7()};

String[] unixtime = {vo.getU1t1(),
                vo.getU1t2(),
                vo.getU1t3(),
                
                
                vo.getU2t1(),
                vo.getU2t2(),
                vo.getU2t3(),
                
                vo.getU3t1(),
                vo.getU3t2(),
                vo.getU3t3(),
                
                vo.getU3t1(),
                vo.getU3t2(),
                vo.getU3t3(),
                
                vo.getU4t1(),
                vo.getU4t2(),
                vo.getU4t3(),
                
                vo.getU5t1(),
                vo.getU5t2(),
                vo.getU5t3(),
                
                vo.getU6t1(),
                vo.getU6t2(),
                vo.getU6t3(),
                
                vo.getU7t1(),
                vo.getU7t2(),
                vo.getU7t3()
};
		
		
		String result = "";
		int ovr = 0;
		int ovr2 = 0;
		for(int i=0; i<schedule.length; i++) {
			if(!schedule[i].equals("")&&schedule[i]!=null&&!schedule[i].equals("0")) {
				String[] spt = schedule[i].split(" ");
				String[] mvd = spt[0].split("-");
				if(mvd[1].length()==1) {mvd[1]="0"+mvd[1];}
				if(mvd[2].length()==1) {mvd[2]="0"+mvd[2];}
				vo.setMvdate(mvd[0]+"-"+mvd[1]+"-"+mvd[2]);
				vo.setMvschedule(spt[1]);
				vo.setMvunixtime(unixtime[i]);
				System.out.println(unixtime[i]+"이거는"+i+"번째입니다");
				int cnt = movieAdminService.selectSchedulecnt(vo);
				if(cnt==0) {
					int cnt2 = movieAdminService.selectSchedulecnt2(vo);
					if(cnt2<3) {
					result = movieAdminService.insertmv(vo);
					}else {
						ovr2++;
					}
				}
				
			}
		}
			
			if(result==null) {str="ok"+ovr;}
		}
		return str;
		}
		
	@RequestMapping("/adminMovieScheduleList.do")               //스케줄 리스트 출력
	public String movieTitle(AdminTheaterVO v,HttpSession session,MovieAdminVO vo, ModelMap model) throws Exception{
	      
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
	            
	               
	               // 페이징 E
	      
	      String userid = (String) session.getAttribute("SessionAdminID");
	      if(userid!=null && !userid.equals("")) {
	         v = adminTheaterService.selectAdminBranch(userid);
	         String branch=v.getBranch();
	         vo.setBranch(branch);
	         
	       int total = movieAdminService.selectScheduleTotal(vo);
	      
	      System.out.println("#$#################"+total);
	      
	      // 화면 출력 시작번호
	      int recordCountPerPage = total - ((pageIndex-1)*pageUnit); 
	      vo.setRecordCountPerPage3(recordCountPerPage);
	      
	      int lastPage = (int) Math.ceil((double)total/pageUnit);
	      vo.setLastPage3(lastPage);               
	      
	      model.addAttribute("vo",vo);
	      model.addAttribute("total",total);
	      
	      
	      List<?> list1 = movieAdminService.selectTitle(vo);
	      List<?> list2 = movieAdminService.selectMvList(vo);
	      
	      
	      
	      model.addAttribute("title", list1);
	      model.addAttribute("resultList2", list2);

	      }
	      
	      return "movie/movieAdmin/adminMovieScheduleList";
	   }
	

	@RequestMapping("/adminMovieScheduleModify.do")				//스케줄수정
	public String selectSchedule(String unq, ModelMap model) throws Exception{
		
		MovieAdminVO vo = movieAdminService.selectSchedule(unq);
		model.addAttribute("vo", vo);
		System.out.println(vo.getMvgrade());
		
		return "movie/movieAdmin/adminMovieScheduleModify";
	}  
	
	

	  
	@RequestMapping("/adminMovieScheduleDelete.do")				//영화스케줄 삭제
	public String deleteSchedule(String unq,HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("SessionAdminID");
		if(userid!=null && !userid.equals("")) {
		
		int cnt = movieAdminService.deleteSchedule(unq);
		
		
		}
		return "redirect:/adminMovieScheduleList.do";
	}
	
	@RequestMapping("/movieDetail.do")				//영화상세정보
	public String movieDetaile(String mvtitle,ModelMap model) throws Exception {
		MovieAdminVO vo = movieAdminService.selectMovieInfo(mvtitle);
		model.addAttribute("vo", vo);
		return "/movie/movieMain/movieDetile";
	}
	
	 @RequestMapping("/adminStoreWrite.do")            //상품 등록 창
     public String storeWrite(AdminTheaterVO vo,HttpSession session,ModelMap model) throws Exception{
        
        String userid = (String) session.getAttribute("SessionAdminID");

        AdminTheaterVO v = adminTheaterService.selectAdminBranch(userid);   
        
        model.addAttribute("vo",v);
        
        return "/movie/movieAdmin/adminStoreWrite";
     }
     

     
     @RequestMapping("/adminStoreWriteSave.do")         //상품 저장
     @ResponseBody
     public String insertStoreFile(MovieAdminVO vo,MultipartHttpServletRequest multiRequest) 
                                               throws Exception {        
        String path = propertiesService.getString("Globals.fileStore2Path");
        
        String mdname = vo.getMdname();            
        
        Map<String,String> map2 = storeuploadProcess(multiRequest,path,mdname,vo);         
     
        String message = mdname+" ";      
        
        //vo.setf
        
        String result=movieAdminService.insertMd(vo);         
        
        //if( result != null ) message = "error"; 
        //map.put("filename", filename);
        //map.put("cnt", Integer.toString(cnt));
        //System.out.println("filename :::: " + filename);
        

        return message;
     }
     
      //스토어 상품 사진 파일 업로드 메서드
     public static Map<String,String> storeuploadProcess( MultipartHttpServletRequest multiRequest , String path, String mdname,MovieAdminVO vo )       
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
              realsavename = mdname+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') );
              save_file = save_dir +realsavename;
              file.transferTo(new File(save_file));                  //세이브파일:진짜 이름으로 저장
              
              filenames += realsavename;
              filesizes += file.getSize();
           }
        }
        Map<String,String> map2 = new HashMap<String,String>();
        map2.put("f1",filenames);  //  filenames = "index.jsp／1234.PNG／";
        map2.put("f2",filesizes);  //         137／28647／
        
        vo.setMdphoto(filenames);
        
        return map2;
     }
     
      //메인홈페이지 화면
      @RequestMapping("/adminStore.do")
      public String storePage(ModelMap model,MovieAdminVO vo) throws Exception {         
            
            //화면 리스트 출력
            List<?> store = movieAdminService.selectStoreMd(vo);             
          
            
            model.addAttribute("vo", vo);   
            model.addAttribute("store",store);
       
        
           return "/movie/movieAdmin/adminStore";
      }
      
      @RequestMapping("/adminStoreDelete.do")            //상품정보
      public String storeDelete(MovieAdminVO vo,HttpSession session) throws Exception {           
        
        int cnt =  movieAdminService.deleteStore(vo);
         
         return "redirect:/adminStore.do";
     }


}





