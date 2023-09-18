<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록영화리스트</title>
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  -->
<style>

  .table1 {
     background-color: white;
    width: 98%;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 10px;
    border-collapse: collapse;
  }
  
  .th1, .td1 {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  
    select, input[type="text"], input[type="date"], input[type="file"] {
    width: 98%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }
  
    .button1 {
    padding: 5px 10px;
    margin: 2px;
    background-color: red;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
  }
  

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
</style>

<style>
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

function btn_All(){
   location="/adminMovieInfoList.do"
}
function btn_Now(){
   location="/adminMovieInfoListNow.do"
}
function btn_Soon(){
   location="/adminMovieInfoListSoon.do"
}

function fn_delete(mvpost,mvprev) {
   const userConfirmation = confirm("정말로 삭제하시겠습니까?");
   if (userConfirmation) {
      location= "/adminMovieInfoDelete.do?mvpost="+mvpost+"&mvprev="+mvprev;
      
//       let datas = {"mvpost":mvpost,"mvprev":mvprev};
              
//         $.ajax({
//          url  : "/adminMovieInfoDelete.do",
//          type : "post",
//          data : datas,
         
//          datatype : "text",
//          success : function(data) {
//             if( data == "ok" ) {
//                alert("삭제완료");
//                     location = "/adminMovieInfoList.do"
//             } else {
//                 alert("삭제실패");
//                 return false;
//             }
//          },
//          error : function() {
//              alert("전송실패");
//          }
//       });
        
   } else {
      return false;
   }
}

function openPopup(mvtitle) {
     // 팝업창을 띄우는 코드
     var popupWidth = 700;
      var popupHeight = 400;
      
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
      
      var popupY= (window.screen.height / 2) - (popupHeight / 2);
      // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
      
     var popupWindow = window.open("/movieDetail.do?mvtitle="+mvtitle, "detaile", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
   }
   
function openPopup2(mvprev) {
     // 팝업창을 띄우는 코드
     var popupWidth = 700;
      var popupHeight = 400;
      
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
      
      var popupY= (window.screen.height / 2) - (popupHeight / 2);
      // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
      
     var popupWindow = window.open("../../../mvimages/moviePoster/"+mvprev, "detaile", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
   }   
</script>

<body>
<div class="d1" style="position:absolute; left:50%; transform:translateX(-50%);">
   <header>
      <img src=""> <!-- 광고?? -->
   </header>
   
   <!-- 탑메뉴 -->
   <nav>
      <%@ include file="../../mvinclude/mvadminnav.jsp" %> 
   </nav>
   
   <!-- 내용 ------------------------------------------------------------------->
   <section style="height:800px;">
   
   로그인 아이디 : ${sessionScope.SessionAdminID }
   <form id="frm" >
   <input type="hidden" name="pageIndex3" id="pageIndex3" value="1">
   <table class="table1">
      <tr>
         <th class="th1" width="30%">영화제목</th>
         <th class="th1" width="30%">상영기간</th>
         <c:if test="${s_userid =='root'}">
         <th class="th1" width="25%">수정</th>
         <th class="th1" width="25%">삭제</th>
         </c:if>
         <c:if test="${s_userid !='root'}">
         <th class="th1" width="*">스케줄등록</th>
         </c:if>
      </tr>
      <c:set var="rownumber" value="${MovieAdminVO.recordCountPerPage3}"/>
      <font color="white" size="4">영화제목 : </font>      
      <form name="searchFrm" id="searchFrm"  method="post" action="/adminMovieInfoList.do">
		<input type="hidden" name="pageIndex" id="pageIndex" value="1">
		<input type="hidden" name="searchCondition" id="searchCondition" value="mvtitle">
		<input type="text" name="searchKeyword" value="${MovieAdminVO.searchKeyword }" placeholder="영화제목을 입력하세요." style="width:200px;">
		<button type="submit" class="button1" >검색</button>
	  </form>
	  
      <c:forEach var="result1" items="${resultList1}">
      <c:if test="${result1.lastday < vo.tday}">
      <tr style="background-color: skyblue;" >
         <td class="td1">${result1.mvtitle }</td>
         <td class="td1">${result1.startday}~${result1.lastday}</td>
         <c:if test="${s_userid =='root'}">
         <td class="td1"><button class="button1" type="button" onclick="location='/adminMovieInfoModify.do?mvtitle=${result1.mvtitle }'">수정</button></td>
         <td class="td1"><button class="button1" type="button" onclick="fn_delete('${result1.mvpost }','${result1.mvprev }')">삭제</button></td>
         </c:if>
         <c:if test="${s_userid !='root'}">
         <td class="td1"><button class="button1" type="button" onclick="location='adminMovieScheduleWrite.do?mvtitle=${result1.mvtitle }'">등록</button></c:if></td>
      </tr>
      </c:if>
      <c:if test="${result1.lastday >= vo.tday}">
      <tr>
         <td class="td1">${result1.mvtitle }</td>
         <td class="td1">${result1.startday}~${result1.lastday}</td>
         <c:if test="${s_userid =='root'}">
         <td class="td1"><button class="button1" type="button" onclick="location='/adminMovieInfoModify.do?mvtitle=${result1.mvtitle }'">수정</button></td>
         <td class="td1"><button class="button1" type="button" onclick="fn_delete('${result1.mvpost }','${result1.mvprev }')">삭제</button></td>
         </c:if>
         <c:if test="${s_userid !='root'}">
         <td class="td1"><button class="button1" type="button" onclick="location='adminMovieScheduleWrite.do?mvtitle=${result1.mvtitle }'">등록</button></c:if></td>
      </tr>
      </c:if>
      <c:set var="rownumber" value="${rownumber-1 }"/>
      </c:forEach>
      <tr>
      	<td colspan="4" style="font-size:17px; height:30px;">
      	<c:choose>
		    <c:when test="${empty searchKeyword}">
		        <c:set var="page" value="${pageIndex3}" />
		        <c:forEach var="i" begin="1" end="${movieAdminVO.lastPage3}">
		            <c:choose>
		                <c:when test="${i == page}">
		                    <a href="/adminMovieInfoList.do?pageIndex3=${i}" style="color: blue; font-weight: bold; font-size:19px;">${i}</a>
		                </c:when>
		                <c:otherwise>
		                    <a href="/adminMovieInfoList.do?pageIndex3=${i}">${i}</a>
		                </c:otherwise>
		            </c:choose>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <!-- searchKeyword가 있을 때의 처리를 여기에 추가 -->
		    </c:otherwise>
		</c:choose>
	  	<td>
	  </tr>
   </table>
   <div style="width:600px; text-align:center; margin-top:10px; background-color:white; text-color:white;">

   

</div>
   </from>

   </section>
   <!-- 내용 끝 ------------------------------------------------------------------->
   
   <!-- 광고1 -->
   <aside>
<%--       <%@ include file="../../mvinclude/mvaside.jsp" %> --%>
   </aside>
   
   <!-- 광고2 -->
   <article>
<%--       <%@ include file="../../mvinclude/mvarticle.jsp" %> --%>
   </article>
   
   <!-- 하단메뉴 -->
   <footer>
      <%@ include file="../../mvinclude/mvfooter.jsp" %>
   </footer>
</div>
</body>
</html>