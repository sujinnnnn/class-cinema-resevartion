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
	alert("로그인이 필요한 서비스입니다.");
	 location= "/memberLogin.do";
	</script>
	<%

}
%>
<c:set var="location" value="${sessionScope.SessionLocation }"/>
<c:set var="title" value="${sessionScope.SessionTitle }"/>
<c:set var="date" value="${sessionScope.SessionDate }"/>
<c:set var="time" value="${sessionScope.SessionTime }"/>
<c:set var="userid" value="${sessionScope.SessionUserID }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화시간선택</title>
</head>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
body {
   font-family: Arial, sans-serif;
   margin: 0;
   padding: 0;
 }
.div1 {
   height: 850px;
   margin: auto;
   padding: 20px;
   position:relative;
   right:75px;
   
}
.container0 {
   position: absolute;
   left:17%;     
   top:4%;
 
   width:890px;
   height:640px;
}
.container2 {
   position: absolute;
   left: 20px;
   top:20px;
}
.reset {
   position: absolute;
   left:77%;
   width:120px;
   top:10px;;  
  
}
.next {
   position:absolute;
   left:750px;
   top:630px;
   width:120px;        
}
.message{
   position:absolute;
   top:100px;
}

.div2 {
   color:#ffffff;
   font-size:9px;
   text-align:center;
   width:50px;
   height:150px;
   background-color: #2E2E2E;      
}
.div3 {
   color:#ffffff;
   text-align:center;
   font-size:9px;
   width:50px;
   height:150px;
   background-color: #FA5858;
   
}
.div4 {
   color:#000000;
   text-align:center;
   font-size:9px;
   width:50px;
   height:150px;
   background-color: #FFFFFF;
   
}
.container {
   width:800px;
   display: flex;
   position:absolute;
   top:20px;
   left:70px;   
  }
.box {
   flex: 1; /* 공간을 동등하게 분할 */
   border: 1px solid black;
   padding: 10px;
   text-align:center;
   background-color:red;
   color: #ffffff;
   text-align:center;    
}
.container1 {
   width:800px;
   display: flex;
   position:absolute;
   top:62px;
   left:70px;
   height:558px;
   
   
}
.box1 {
   flex: 1; /* 공간을 동등하게 분할 */
   border: 1px solid #cccccc;
   padding: 10px;
   background-color:#ffffff;
}
.box2 {
   flex: 1; /* 공간을 동등하게 분할 */
   
   padding: 10px;
   background-color:#ffffff;
}
.box_st {   
   border: 1px solid white;
   padding: 10px;
   background-color:white;
   margin-left:-10.8px;
   margin-top:-11px;
   width:100%; 
   height:20px;
}

.btn_s {
   display: block;
   width: 100%;
   padding: 10px;
   background-color: #FA5858;
   color: #FFF;
   border: none;
   border-radius: 3px;
   cursor: pointer;
   text-align:center;
   position:relative;
   right:130px;
   bottom:38px;
}

.btn_location { 
   border: #cccccc;
   background-color: #ffffff;
   cursor: pointer; 
   width:98%;
   height:30px;
}
.btn_date { 
   width:10px;
   border: #cccccc;
   background-color: #ffffff;
   cursor: pointer; 
   text-align:center;
 }
 .btn_time { 
   width:60px;
   height:40px;
   border:2px solid #BDBDBD;
   background-color: #ffffff;
   cursor: pointer; 
   border-radius:5px;
   hover:red;
 }
 .btn_submit { 
   display: block;
   width: 100%;
   padding: 10px;
   background-color: #FA5858;
   color: #FFF;
   border: none;
   border-radius: 3px;
   cursor: pointer; 
 }
 #ticket{
    width:1200px;
    height:800px;
    margin-top:20px;
    position:relative;
    top:30px;
    left:50px;
        
 } 

input[type="text"] {
    width: 150px; /*가로크기*/
    height: 35px; /*세로크기*/
    background-color: red; /*배경색*/
    border:1.5px solid red; /*테두리 두께, 선스타일, 색상*/
    border-radius:1px; /*테두리 둥글게*/
    outline:none; /*기본테두리안보이게*/
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
    transition:.3s; /*서서히 나타내기*/
    margin-top:-5px;
    text-align:center;
    font-size:20px;
    font-weight:bold;
    color:#ffffff;
}
input::placeholder {
  color: #ffffff;
  
}


/* button[title]:hover::after{
   content:attr(title); 
   position: relative; 
   top: 100%;  
   left: 100%; 
   width:100px;
   height:50px; 
   line-height:15px;  
   padding: 5px; 
   background:#EAEAEA; 
   font-size:12px; 
   border:1px solid black; 
   color:black; 
   text-align:center; 
   z-index:100;
   display:none;
} */

ul {
    list-style: none;
    margin:0px;   
   padding:0px;
}
li {
   margin-top:10px;
   margin-right:5px;
   margin-left:5px;
   padding:0px;
   float:left;
   align:center;
}
.choose{   
   
   width:200px;
   height:30px;
   align:center;
   margin-left:8px;
}

</style>

<style>
hearder {

}

nav {
   width:1200px;
}

section {
   width:1200px;
   text-align:center;
   background-color:black;
}

aside {
   margin-top:25px;
   text-align:center;
}

article {
   margin-top:25px;
   text-align:center;
}

body {
   font-size:12px;
   text-align:center;
}

a {
   text-decoration:none;
   color:black;
}

div.d1 {
   width:1200px;
   text-align:center;
}

div.outline {
   width:1200px;
   text-align:center;
}

div.main {
   width:1200px;
   text-align:center;
   align:center;
   item-align:center;
   border-collapse:collapse;
}
/* 상단메뉴 */
table.mainmenu2 {
   width:1200px;
   text-align:center;
   border-collapse:collapse;
   margin-top:10px;
   margin-bottom:5px;
}

table.mainmenu2 th{
   text-align:center;
   font-size:20px;
   padding:5px;
}

/* 하단메뉴 */
table.downmenu {
   width:1200px;
   text-align:center;
}

table.downmenu td {
   border-right:1px solid black;
}

table.t1 {
   width:1200px;
   text-align:center;
   border-collapse:collapse;
   margin-top:10px;
   margin-bottom:5px;
}

table.t2 {
   width:1000px;
   text-align:center;
   position:relative;
   left:103px;
   color:white;
}

table.t3 {
   width:900px;
   margin-top:5spx; 
   margin-bottom:5px;
}

table.t3 td {
   text-align:left;
}

table.t3 input,textarea {
   width:95%;
}
.movieimage {
    width: 190px;
    height: 255px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}

img.grade {
   width:20px;
   height:20px;
   background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    position:relative;
    top:4.5px;
    right:4px;
}

img.link1 {
   width:15px;
   height:15px;
   background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    position:relative;
    top:2.5px;
    right:2px;
}

button.ticket {
   width:100px;
   height:35px;
   border-radius:0px;
   border:1px solid white;
   cursor:pointer;
   color:black;
   background-color: #000000;
    background-color: rgba( 0, 0, 0, 0.5 );
}
table.ticket {
   background-color: #000000;
    background-color: rgba( 0, 0, 0, 0.5 );
}
</style>


<script>

function btn_location(mvlocation) {   
   location="/ticketingSchedule.do?mvlocation="+mvlocation;
}

function btn_title(mvlocation,mvtitle) {   
   location="/ticketingSchedule.do?mvlocation="+mvlocation+"&mvtitle="+mvtitle;
}

function btn_date(mvlocation,mvtitle,mvdate) { 
   location="/ticketingSchedule.do?mvlocation="+mvlocation+"&mvtitle="+mvtitle+"&mvdate="+mvdate;
}

function btn_time(mvlocation,mvtitle,mvdate,mvschedule,mvroom) {   
   location="/ticketingSchedule.do?mvlocation="+mvlocation+"&mvtitle="+mvtitle+"&mvdate="+mvdate+"&mvschedule="+mvschedule+"&mvroom="+mvroom;
}

$(function(){
   
   $("#btn_submit").click(function(){
      
      let branch      = $("#branch").val();
      let mvtitle      = $("#mvtitle").val();
      let mvdate      = $("#mvdate").val();
      let mvschedule = $("#mvschedule").val();
      let mvroom = $("#mvroom").val();
      
      if( branch == "" || branch == null ) {
         alert("지역을 선택해 주세요");
         return false;
      }
      if( mvtitle == "" || mvtitle == null ) {
         alert("영화을 선택해 주세요");
         return false;
      }
      if( mvdate == "" || mvdate == null ) {
         alert("관람일을 선택해 주세요");
         return false;
      }
      if( mvschedule == "" || mvschedule == null ) {
         alert("관람시간을 선택해 주세요");         
         return false;
      }
      if(${userid==null}){         
         var chk = confirm("로그인이 필요한서비스입니다. ");
         if(chk) {
            location="/memberLogin.do";   
            return false;
         } else {
            return false;
         }         
      }
      
      location="/ticketingSeats.do?mvlocation="+branch+"&mvtitle="+mvtitle+"&mvdate="+mvdate+"&mvschedule="+mvschedule+"&mvroom="+mvroom;
      
   });
});

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
	         <div class="box"><input type="text" id="branch" value="${sessionScope.SessionLocation }" placeholder="영화관" readonly></div>
	         <div class="box"><input type="text" id="mvtitle" value="${sessionScope.SessionTitle }" placeholder="영화선택" readonly style="width:98%">   </div>
	         <div class="box"><input type="text" id="mvdate" value="${sessionScope.SessionDate }" placeholder="선택날짜" readonly></div>          
	      </div>
	      <!-- 영화관 선택 S -->
	      <div class="container1" >
	         <div class="box1" >
	         <input type="hidden" name="mvlocation" value="${list.mvlocation }">         
	         <table></table>
	         <c:if test="${location==null }">
	         <c:forEach var="list" items="${listLocation }">   
	         <tr style="text-align:center">
	            <td>
	               <button type="button" onclick="btn_location('${list.mvlocation }')" class="btn_location" id="btnLocation" readonly>${list.mvlocation } </button>
	            </td> 
	         </tr>
	         </c:forEach>
	         </c:if>
	         <c:if test="${location!=null }">
	         <c:forEach var="list" items="${listLocation }">   
	         <tr style="text-align:center">
	            <td>
	               <button type="button" onclick="btn_location('${list.mvlocation }')" class="btn_location" id="btnLocation" readonly>${list.mvlocation } </button>
	            </td> 
	         </tr>
	         </c:forEach>
	         </c:if>   
	         </table>   
	         </div>
	         <!-- 영화관 선택 E -->
	         
	         <!-- 영화 선택 S-->
	         <div class="box1">
	            <table  style="width:98%;">      
	         
	         <c:forEach var="list" items="${listMovie }">                              
	            <tr style="text-align:center">             
	               <td>
	                  <button type="button" onclick="btn_title('${list.mvlocation }','${list.mvtitle }')" class="btn_location" id="btnTitle" readonly>${list.mvtitle }</button>
	               </td>
	            </tr>            
	         </c:forEach>
	         
	      </table>      
	         </div>
	         <!-- 날짜 선택 S -->
	          <div class="box1">
	          <div class="box_st"><input type="text" id="mvlocation" value="${sessionScope.SessionTime }" placeholder="상영시간" style="background-color:white; border:0px; color:black;" readonly></div>
	         <table  style="width:98%;">
	                  
	         <tr style="text-align:center;">   
	               
	         <c:forEach var="list" items="${listDate }">      
	         
	            <td style="height:45px;">
	            
	            <button type="button" onclick="btn_date('${list.mvlocation }','${list.mvtitle }','${list.mvdate }')" 
	            class="btn_date" id="btnDate" >   
	               <c:if test="${list.mvdate==null }">
	                  <span>상영 가능한 날짜가 없습니다.</span>
	               </c:if>                            
	               <c:if test="${list.dy=='토' }">
	                  <span class="day"><font color="blue">${list.mdate } <br> ${list.dy }</font></span>
	               </c:if>   
	               <c:if test="${list.dy=='일' }">
	                  <span class="day"><font color="red">${list.mdate } <br> ${list.dy }</font></span>
	               </c:if>   
	               <c:if test="${list.dy!='토' && list.dy!='일' }">
	                  <span class="day"><font color="black">${list.mdate} <br> ${list.dy }</font></span>
	               </c:if>   
	               
	                           
	            </button>                        
	            </td>                        
	         </div>         
	         </c:forEach>
	      
	         </tr>               
	         </table> 
	      <!-- 날짜 선택 E -->
	      
	       <!-- 시간 선택 S -->         
	        <div  class="box2">
	        <ul style="text-align:center">                   
	         <c:forEach var="list" items="${listTime }">   
	         <input type="hidden" value="${list.unq }" id="unq">
	         <input type="hidden" value="${list.mvdate }" id="btnDate">         
	            <li colspan="7" style="text-align:center">
	            <button type="button" 
	                  onclick="btn_time('${list.mvlocation }','${list.mvtitle }','${list.mvdate }','${list.mvschedule }','${list.mvroom }')"
	                  class="btn_time" id="btnTime" title="종료 ${list.mvvolume }"> 
	                  ${list.mvschedule } <br> ${list.mvroom }
	            </button>                  
	            </li>         
	         </c:forEach>         
	      </ul>
	         <div class="message">
	            <c:if test="${vo.mvdate==null }">
	               <div class="choose">극장,영화,날짜를 선택해주세요</div>
	            </c:if>
	         </div>
	      </div>
	       <!-- 시간 선택 E -->   
	      </div>
	      </div>   
	      <div style="text-align:right; top-margin:30px;" class="next">
	      <button type="button" id="btn_submit" class="btn_submit">좌석 선택하기</button>
	      <button type="button" onclick="location='/ticketingSchedule.do'" 
	            class="btn_s">
	         다시선택
	      </button>
	   </div>
	   </div>
	   <div>
		   <input type="hidden" value="${sessionScope.SessionLocation }" id="branch">
		   <input type="hidden" value="${sessionScope.SessionTitle }" id="mvtitle">
		   <input type="hidden" value="${sessionScope.SessionDate }" id="mvdate ">
		   <input type="hidden" value="${sessionScope.SessionTime }" id="mvschedule">
		   <input type="hidden" value="${sessionScope.SessionRoom }" id="mvroom">
	   <div>
	</div>
	
	</section>
	
	<!-- 광고1 -->
	<aside>
		
	</aside>
	
	<!-- 광고2 -->
	<article>
		
	</article>
	
	<!-- 하단메뉴 -->
	<footer>
		<%@ include file="../../mvinclude/mvfooter.jsp" %>
	</footer>
</div>
</body>
</html>