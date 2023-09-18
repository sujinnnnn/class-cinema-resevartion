package egov.mywork1.web;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.MovieMemberService;
import egov.mywork1.service.MovieMemberVO;
import egov.mywork1.service.MypageVO;


@Controller
public class MovieMemberController {
	
	
	 @Resource(name = "movieMemberService") 
	 MovieMemberService movieMemberService;
		 
	 /*
	  * 로그인 화면
	  */
	 @RequestMapping("/memberLogin.do")
		public String movieLoginWrite() {
			
			return "/movie/movieMember/memberLogin";
		}
	/*
	 * 로그인 sub
	 */
	@RequestMapping("/memberLoginSub.do")
	@ResponseBody
	public String loginProcession(MovieMemberVO vo, HttpSession session) throws Exception {
		
		String message = "";
		String pass1 = vo.getUserpw();
		String pass2 = MyEncrypt.testMD5(pass1);
		vo.setUserpw(pass2);
		
		int state = movieMemberService.selectStatechk(vo);

		int count = movieMemberService.selectMemberCount(vo);
		if(state == 1) {
			if(count == 1) {
				// session 생성
				session.setAttribute("SessionUserID", vo.getUserid());
				// message 처리
				message = "ok";
			}
		} else if(state == 2) {
			message="2";
		} else if(state == 3) {
			message="3";
		} else {
			message="4";
		}
			
			return message;
		}
	/*
	 * 회원가입 화면
	 */
	@RequestMapping("/memberJoinWrite.do")
	public String movieWrite() {		
		return "/movie/movieMember/memberJoinWrite";
	}
	/*
	 * 회원가입 저장
	 */
	@RequestMapping("/movieMemberWriteSave.do")
	@ResponseBody
	public String insertMember(MovieMemberVO vo) throws Exception {		

		String str = "3";
		
		int result1 = movieMemberService.selectMvmemberUserID(vo.getUserid());
		System.out.println("111123123111"+result1);
		String patteren = "[0-9a-zA-Z_]{2,19}";
		String pass = vo.getUserpw();
		System.out.println("111123123111"+pass);
		boolean patteren_chk = pass.matches(patteren);
		System.out.println("111123123111"+patteren_chk);
		if(result1 == 1) { 
			str = "2"; // 아이디 중복 저장x
		}
		else  if( patteren_chk == false){ 
				str= "5";
				
			} else {
				String pass1 = vo.getUserpw();
				String pass2 = MyEncrypt.testMD5(pass1);
				vo.setUserpw(pass2);
				movieMemberService.insertMember(vo);
				str = "1"; // 저장 성공
			}			
		 		
		return str;
	}
	/*
	 * 아이디 체크
	 */
	@RequestMapping("/movieUserIdCheck.do")
	@ResponseBody
	public String selectMemberUserid(String userid) throws Exception {	
		String msg = "3";
		int result = 0;
		String patteren = "[a-zA-Z]{1}[0-9a-zA-Z_]{2,12}";
		boolean patteren_chk = userid.matches(patteren);
		
		if (patteren_chk == true) {
			result = movieMemberService.selectmovieMemberUserID(userid);
			if(result == 0) {
				 msg = "1"; // 사용가능
			}
			else msg ="2";			   // 이미사용중
		}
		
		return msg;
	}
	
	@RequestMapping("/movieMemberInfo.do")
	public String memberInfo() throws Exception {
		return "/movie/movieMember/movieMemberInfo";
	}
	
	/*
	 * 회원정보 수정화면
	 */
	@RequestMapping("/movieMemberModify.do")
	public String selectMemberDetail(HttpSession session, ModelMap model) throws Exception {
		
		String url = "/movie/movieMember/movieMemberModify";
		String userid = (String) session.getAttribute("SessionUserID");
		if(userid == null) {
			url = "redirect:/memberJoinWrite.do";
		}
		
		MovieMemberVO vo = movieMemberService.selectMemberDetail(userid);
		String phone1 = vo.getPhone().substring(0,3);
		String phone2 = vo.getPhone().substring(3,7);
		String phone3 = vo.getPhone().substring(7);
		
		vo.setPhone1(phone1);
		vo.setPhone2(phone2);
		vo.setPhone3(phone3);		
		
		model.addAttribute("vo",vo);
		
		return url;
	
	/*
	 * 회원정보 수정 저장
	 */
	}
	
	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(HttpSession session) {
		
		session.removeAttribute("SessionUserID");
		return "1";
	}
	
	
	/*
	    * 회원정보 수정 처리
	    */   
	   @RequestMapping("/movieMemberModifySave.do")
	   @ResponseBody
	   public String updateMovieMember(MovieMemberVO vo) throws Exception {      

	      String str = "";
	      System.out.println("+++++++++++++"+vo.getUserid());
	      int cnt = movieMemberService.updateMovieMember(vo);
	      System.out.println("+++++++++++++"+cnt);
	      if(cnt == 1) {
	         str = "ok" ;
	      }
	      
	      return str;
	      
	   }
	   
		@RequestMapping("/idpwCheck.do")
		public String idpwCheck() {
					
			return "/movie/movieMember/idpwCheck";
		}
		
		@RequestMapping("/idpwCheckSub.do")
	    @ResponseBody
	    public String selectIdpwCheck(MovieMemberVO vo) throws Exception {
			String str = "";
	        if(vo.getUserid() == null || vo.getUserid().equals("")) {
	        // 닉네임, 이메일을 통한 아이디 검색
	        	String userid = movieMemberService.selectMovieMemberUseridReturn(vo);
	            if(userid != null && !userid.equals("")) {
	               str = userid;
	            } else {
	               str = "4";
	            }
	        } else {
	        	// 아이디, 이메일을 통한 존재 여부 확인 후 패스워드 재설정
	            int cnt = movieMemberService.selectMovieMemberExistCount(vo);
	            if(cnt == 0) {
	               str = "4";
	            } else {
	               String pass1 = generateRandomString(6);
	               String pass2 = MyEncrypt.testMD5(pass1);
	               vo.setUserpw(pass2);
	               movieMemberService.updateMovieMemberPass(vo);
	               str = pass1;
	            } 
	         }
	         return str;
	      }
	      private String generateRandomString(int length) {
	    	  String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	          Random random = new Random();
	          StringBuilder stringBuilder = new StringBuilder(length);

	          for (int i = 0; i < length; i++) {
	        	  int randomIndex = random.nextInt(characters.length());
	              char randomChar = characters.charAt(randomIndex);
	              stringBuilder.append(randomChar);
	          }
	          return stringBuilder.toString();
	    }
		
		/*
		 * 회원 탈퇴 비밀번호 확인 화면
		 */
		@RequestMapping("/pwCheck.do")
		public String pwCheck() {
					
			return "/movie/movieMember/pwCheck";
		}
		/*
		 * 회원탈퇴 비밀번호 확인/ 회원탈퇴 처리
		 */
		@RequestMapping("/pwCheckSub.do")
		@ResponseBody
		public String selectpwCheck(MovieMemberVO vo) throws Exception {
			
			String pass1 = vo.getUserpw();
			String pass2 = MyEncrypt.testMD5(pass1);
			vo.setUserpw(pass2);
			System.out.println("+++++++++++"+pass2);
			String str = "";			
			
			int cnt = movieMemberService.selectPwCheck(vo);
			
			if(cnt == 1) {
				movieMemberService.updateMemberState(vo);
				str = "ok";
			} else {
				str = "4";
			}
			
			
			return str;
		}
		/*
		 * 비밀번호 변경 화면
		 */
		@RequestMapping("/changepw.do")
		public String changepw() {
					
			return "/movie/movieMember/changepw";
		}
		/*
		 * 비밀번호 변경처리
		 */
		@RequestMapping("/changepwSub.do")
		@ResponseBody
		public String updatepw(MovieMemberVO vo) throws Exception {
			
			String pass1 = vo.getUserpw();
			String pass2 = MyEncrypt.testMD5(pass1);
			vo.setUserpw(pass2);
			System.out.println("+++++++++++"+pass2);
			
			String npass1 = vo.getNpw1();
			String npass2 = MyEncrypt.testMD5(npass1);
			vo.setNpw1(npass2);
			
			String str = "";			
			
			int cnt = movieMemberService.selectPwCheck(vo);
			
			if(cnt == 1) {
				movieMemberService.updatepw(vo);
				str = "ok";
			} else {
				str = "4";
			}
			System.out.println("!!!!!!!!!!!!"+str);
			
			return str;
		}
		
		//마이페이지
		
		@RequestMapping("/myPageList.do")
        public String selectmemberList(ModelMap model, HttpSession session) throws Exception {
            String userid = (String) session.getAttribute("SessionUserID"); 
            List<?> list = movieMemberService.selectMemberList(userid);
            model.addAttribute("resultList", list); 
            return "movie/movieMember/myPageList";
        }

     @RequestMapping("/mbreserveDetail.do")   
       public String mbreserveDetail(MypageVO vo,ModelMap model) throws Exception {
        
          MypageVO v = movieMemberService.selectMbreserveDetail(vo);
          
          model.addAttribute("vo", v);
          return "movie/movieMember/mbreserveDetail";
    }
     
     
       @RequestMapping("/mbrDelete.do")
        public String deletembrDelete(MypageVO vo) throws Exception {
          /* String str =""; */
          int result = movieMemberService.deletembrDelete(vo);
          /*
           * if(result==0) str = "fail"; else if(result==1) str = "ok";
           */            
          return "redirect:/myPageList.do";
	 
       }

}
