<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// 세션 아이디 확인
String s_userid = (String) session.getAttribute("SessionUserID");
if (s_userid == null) {
	%>
	<script>
	alert("잘못된 접근입니다.");
	 location= "/memberLogin.do";
	</script>
	<%

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료창</title>
</head>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
<%@include file="../../mvinclude/payMentCSS.css"%>


</style>
<script>
function movieMain() {
 location.href = "/movieMain.do";
}

// 여기에 함수명을 정의해주세요.
// 아래와 같이 정의해야 합니다.
</script>
<body>
<div class="d1" style="position:absolute; left:50%; transform:translateX(-50%);">
   <header>
      <img src=""> <!-- 광고?? -->
   </header>
   
   <!-- 탑메뉴 -->
   <nav>
      <%@ include file="../../mvinclude/mvnav.jsp" %> 
   </nav>
   
   <!-- 내용 -->
   <section style="height:800px;">
   <br>
   <br>
   <div class="div1">   
      <div class="container0" >
         
         <div class="container">
            <div class="box" style="background-color:red;"><font size="4">결제완료</font></div>        
         </div>
         <div class="container1">
         		<caption><b>${vo.userid} 회원님, 결제가 성공적으로 완료되었습니다.</b></caption>
         		<table class="movie-table">        		
         			<tr>
         				<th rowspan="5" align="center"><div class="movieimage" style="background-image:url(../mvimages/moviePoster/${vo.mvpost}"></th>
         			</tr>
         			<tr>
         				<td><b>예매번호</b></td>
         				<td>111111</td>
         			</tr>     				
         			<tr>
         				<td><b>상영일시</b></td>
         				<td> ${vo.mvdate} ${vo.mvschedule}</td>
         			</tr>
         			<tr>
         				<td><b>상영관</b></td>
         				<td>${vo.mvlocation} ${vo.mvroom}</td>
         			</tr>
         			<tr>
         				<td><b>좌석</b></td>
         				<td>${vo.seats}</td>
         			</tr>
         		</table>
         		<table>
         			<tr>
         				<td colspan="3">
         					-온라인 예매 내역 취소는 상영 20분 전까지 가능하며, 20분 이전부터는 현장 취소만 가능합니다.
         				</td>
         			</tr>
         			<tr>
         				<td colspan="3">
							-티켓에 표기된 상영시작시간 이후 환불은 불가합니다.
						</td>
					</tr>
					<tr>
						<td colspan="3">
							-무대인사, 스페셜상영회, GV, 라이브뷰잉 등 특별 상영 회차의 예매 취소는 상영전일 23시 59분 59초까지만 취소 가능합니다.
						</td>
					</tr>
					<tr>	
						<td colspan="3">
							-온라인 예매 후 현장에서 티켓 발권 시 온라인으로 예매 취소는 불가능하며, 현장 취소만 가능합니다.
						</td>
					</tr>
					<tr>	
						<td colspan="3">
							-적립 예정 L.POINT는 영화 관람 다음 날 적립됩니다.
						</td>
					</tr>
					<tr>	
						<td colspan="3">	
							-예고편과 광고 상영으로 실제 영화 시작 시간이 10분 정도 차이 날 수 있습니다.
						</td>
					</tr>
					<tr>	
						<td colspan="3">	
							-SMS 수신을 이용하시면 예매내역을 휴대폰으로 받을 수 있습니다.	
         				</td>
         			</tr>
         			<tr>
         				<th colspan="3"><input type="button" class="btn" value="홈으로 바로가기" onclick="movieMain()"></button></th>
         			</tr>
         		</table>
				 
			
         </div>
       
      </div>
      
</div>
<footer>
		<%@ include file="../../mvinclude/mvfooter.jsp" %>
	</footer>
</body>
</html>