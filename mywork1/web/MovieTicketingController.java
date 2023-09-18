package egov.mywork1.web;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.MovieAdminService;
import egov.mywork1.service.MovieAdminVO;
import egov.mywork1.service.MovieTicketingService;
import egov.mywork1.service.MovieTicketingVO;


@Controller
public class MovieTicketingController {

   @Resource(name="movieAdminService")
   MovieAdminService movieAdminService;
   
   @Resource(name="movieTicketingService")
   MovieTicketingService movieTicketingService;
   
   
   @RequestMapping("/ticketingSchedule.do")
      public String selectTheaterList3(MovieTicketingVO vo, ModelMap model, HttpSession session) throws Exception {
         
         session.setAttribute("SessionLocation", vo.getMvlocation());
         session.setAttribute("SessionTitle", vo.getMvtitle());
         session.setAttribute("SessionDate", vo.getMvdate());
         session.setAttribute("SessionTime", vo.getMvschedule());      
         session.setAttribute("SessionRoom", vo.getMvroom());
         
         System.out.println("#########################1"+vo.getMvdate());
         
            
         List<?> listLocation = movieTicketingService.selectTheaterList(vo);
         List<?> listMovie     = movieTicketingService.selectMovieList(vo);
         List<?> listTime    = movieTicketingService.selectTimeList(vo);
         List<?> listDate    = movieTicketingService.selectDateList(vo);   
         
         model.addAttribute("listLocation",listLocation);
         model.addAttribute("listMovie",listMovie);
         model.addAttribute("listTime",listTime);
         model.addAttribute("listDate",listDate);
         model.addAttribute("vo",vo);   

      return "movie/movieTicketing/ticketingSchedule";
   }
   
   
   
   @RequestMapping("/ticketingSeats.do")
    public String movieTest(MovieTicketingVO v, MovieAdminVO vo, ModelMap model,HttpSession session) throws Exception {
       
      String userid =(String) session.getAttribute("SessionUserID");
      if(userid!=null && !userid.equals("")) {
      
      
       v = movieTicketingService.selectScheduleline(v);
       
       List<?> list = movieAdminService.selectTicketChk(v);
       String str = "";
       
       if(list != null || !list.equals("")) {
          str += list;
       }
       String[] array = str.split(",");

       model.addAttribute("seat",str);
       model.addAttribute("v",v);
       
      }
       return "movie/movieTicketing/ticketingSeats";
    }
    
    
    
    
    @RequestMapping("/ticketPay.do")
    public String ticketPay (MovieTicketingVO vo, ModelMap model,HttpSession session) {
       String userid =(String) session.getAttribute("SessionUserID");
       vo.setUserid(userid);
       
    String[] money = vo.getTotalPrice().split(":");
    
    vo.setTotalPrice(money[1].substring(1));
       
       model.addAttribute("vo",vo); 
       
       
       return "movie/movieTicketing/ticketPay";
    }
     @RequestMapping("/ticketPaySave.do")
     public String ticketPaySave (MovieTicketingVO vo) throws Exception {
        
        
        
        
        return "";
     }
     
     
     
     @RequestMapping("/payMent.do")
     public String payMent(MovieAdminVO v, MovieTicketingVO vo, ModelMap model, HttpSession session) throws Exception {
         String userid = (String) session.getAttribute("SessionUserID");
         if (userid != null && !userid.equals("")) {
             // 사용자의 세션에서 이미 예약한 좌석 정보 가져오기
             List<String> reservedSeats = (List<String>) session.getAttribute("reservedSeats");

             String[] unqseatstp = vo.getUnq().split("-");
             vo.setUnq(unqseatstp[0]);
             vo.setSeats(unqseatstp[1]);
             vo.setTotalPrice(unqseatstp[2]);

             String unq = vo.getUnq();
             System.out.println(unq + "rerererererererererer");

             
             
             // 이미 예약한 좌석 정보와 새로 예약하려는 좌석 정보 비교
             if (reservedSeats != null && reservedSeats.contains(vo.getSeats())) {
                 // 중복된 경우 예약 처리하지 않고 에러 메시지를 모델에 추가
                 model.addAttribute("");
             } else {
                 // 중복되지 않은 경우 예약 처리
                 v = movieAdminService.selectSchedule(unq);

                 vo.setUserid(userid);
                 vo.setMvtitle(v.getMvtitle());
                 vo.setMvgrade(v.getMvgrade());
                 vo.setMvschedule(v.getMvschedule());
                 vo.setMvdate(v.getMvdate());
                 vo.setMvpost(v.getMvpost());
                 vo.setMvvolume(v.getMvvolume());
                 vo.setMvlocation(v.getMvlocation());
                 vo.setMvroom(v.getMvroom());

                 System.out.println("#########################2" + vo.getMvdate());

                 String result = movieTicketingService.insertTicket(vo);

                 // 예약한 좌석을 세션에 추가
                 if (reservedSeats == null) {
                     reservedSeats = new ArrayList<>();
                 }
                 reservedSeats.add(vo.getSeats());
                 session.setAttribute("reservedSeats", reservedSeats);

                 // 전체 좌석수에서 예매한 좌석수 빼기
                 int cnt = vo.getSeats().split(",").length;
                 vo.setCnt(cnt);
                 int result2 = movieAdminService.updateMovieSchedule(vo);
                 System.out.println(result + "rrrrrrrrrrrrresult");

                 model.addAttribute("v", v);
                 model.addAttribute("vo", vo);
            
             }
             
             
         }
         if (vo.getMvtitle() == null || vo.getMvdate() == null || vo.getMvlocation() == null || vo.getMvroom() == null) {
             // vo가 비어있는 경우 홈 화면으로 리디렉션
             return "redirect:/"; // "/home"이 홈 화면의 URL이라고 가정하고 있습니다.
         } else {
         return "movie/movieTicketing/payMent";
         }
     }

    
    @RequestMapping("/ticketKakaoPay.do")
    @ResponseBody
    public String kakaopay(MovieTicketingVO vo) throws Exception{
       String unq = vo.getUnq()+"-"+vo.getSeats()+"-"+vo.getTotalPrice();
       System.out.println("unqunqunqunqunqunquqn"+unq);
       
       
       URL kkp = new URL("https://kapi.kakao.com/v1/payment/ready");
       HttpURLConnection con = (HttpURLConnection) kkp.openConnection();
       con.setRequestMethod("POST");
       con.setRequestProperty("Authorization", "KakaoAK 2d0c57de4f988b5b3ab89b5a5b3853e9");
       con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
       con.setDoOutput(true);
       String parameter = "cid=TC0ONETIME&"
               + "partner_order_id=partner_order_id&"
               + "partner_user_id=partner_user_id&"
               + "item_name=item_name&"
               + "quantity=1&"
               + "total_amount=10000&"
               + "tax_free_amount=0&"
               + "approval_url=http://192.168.0.30:8090/payMent.do?unq="+unq+"&"
               + "cancel_url=http://192.168.0.30:8090&"
               + "fail_url=http://192.168.0.30:8090";
       OutputStream ops = con.getOutputStream();
       DataOutputStream dops = new DataOutputStream(ops);
       dops.writeBytes(parameter);
       dops.close();
       
       
       int result = con.getResponseCode();
       
       InputStream ips;
       System.out.println(result);
       if(result==200) {
          ips = con.getInputStream();
          System.out.println(ips);
       }else {
          ips = con.getErrorStream();
       }
       
          InputStreamReader ipsr = new InputStreamReader(ips);
          BufferedReader bfrd = new BufferedReader(ipsr);
          return bfrd.readLine();
    }
    
     
      



}




