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
<title>메인화면</title>
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

/* 기존 스타일 유지 및 필요한 스타일 추가 */
.main {
  display: flex;
  flex-wrap: wrap; /* 필요한 경우 줄바꿈이 되도록 설정 */
  justify-content: center;
	width:98%;
	margin-left: 10px;
}

.store {
  border: 1px solid #ccc;
  background-color: white;
  padding: 1rem;
  margin: 1rem;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  text-align: center;
  width:98%;
  height:5%;
  float: left;
  position:relative;
}

.store2 {
   margin-top: 10px;
  background-color: white;
  text-align: center;
  width:49%;
  height:99%;
    float: left;
  position:relative;
}


.store3 {
border-left: 2px solid #ccc;
   margin-top: 10px;
  background-color: white;
  text-align: center;
  width:49%;
  height:99%;
    float: left;
  position:relative;
}


.header {
  background-color: red;
  color: white;
  text-align: center;
  padding: 1rem 0;
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
function changeOpacity1(obj)
{
    obj.style.opacity="0.5";
}
function changeOpacity2(obj)
{
    obj.style.opacity="1";
}
function changeOpacity3(obj)
{
    obj.style.opacity="1";
}
function changeOpacity4(obj)
{
    obj.style.opacity="0";
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
		<%@ include file="../../mvinclude/mvnav.jsp" %> 
	</nav>
	
	<!-- 내용 -->
	<section>
	  <header class="header">
	        <h1>영업점 정보</h1>
	      </header>
	      <main class="main">
	        <c:forEach var="list" items="${list}">
	        <c:if test="${list.branch!='최고관리자'}">
	          <div class="store" >
	          <div class="store2">
	            <h1>${list.branch} </h1>

	            <p>${list.adminaddr}</p>
	            <p>전화번호: ${list.adminphone}</p>
	           </div>
	           <div class="store3">
	            <img src="../../mvimages/moviePoster/${list.adminpic}" width="400" height="170" >
	           </div> 
	          </div>
	         </c:if>
	        </c:forEach>
	      </main>
	</section>
	
	<!-- 광고1 -->
	<aside>
		<%@ include file="../../mvinclude/mvaside.jsp" %>
	</aside>
	
	<!-- 광고2 -->
	<article>
		<%@ include file="../../mvinclude/mvarticle.jsp" %>
	</article>
	
	<!-- 하단메뉴 -->
	<footer>
		<%@ include file="../../mvinclude/mvfooter.jsp" %>
	</footer>
</div>
</body>
</html>