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
<title>관리자메인화면</title>
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  -->
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

button.pass1 {
   width:20px;
   height:40px;
   background-image: url("../mvimages/화살표1.png");
    background-repeat: no-repeat;
    background-position: center;
   border: none;
   color: white;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   cursor:pointer;
}

button.pass2 {
   width:20px;
   height:40px;
   background-image: url("../mvimages/화살표2.png");
    background-repeat: no-repeat;
    background-position: center;
   border: none;
   color: white;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   cursor:pointer;
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
	
$(function(){   
	   
	   $("#button1").click(function(){
	      
	      let params = new URLSearchParams(window.location.search);
	      let pa1 = params.get("pageIndex1");
	      let pa2 = params.get("pageIndex2");
	      
	      if(pa1 == null || pa1 === "") {
	          pa1 = 1;
	      }

	      if(pa2 == null || pa2 === "") {
	          pa2 = 1;
	      }
	      
	      
	      param1 = parseInt(pa1);
	      param2 = parseInt(pa2);
	      
	      param1 = param1 + 1;
	      
	      if(param1 > ${vo.lastPage1}){
	         param1 = 1;
	      }
	      
	      location.href="/adminMain.do?pageIndex1="+param1+"&pageIndex2="+param2;
	      
	   });
	   
	   $("#button2").click(function(){
	      
	      let params = new URLSearchParams(window.location.search);
	      let pa1 = params.get("pageIndex1");
	      let pa2 = params.get("pageIndex2");
	      
	      if(pa1 == null || pa1 === "") {
	          pa1 = 1;
	      }

	      if(pa2 == null || pa2 === "") {
	          pa2 = 1;
	      }
	      
	      param1 = parseInt(pa1);
	      param2 = parseInt(pa2);
	      
	      param1 = param1 - 1;
	      if(param1 <= 0) {
	         param1 = ${vo.lastPage1};
	      }
	      
	      location.href="/adminMain.do?pageIndex1="+param1+"&pageIndex2="+param2;
	   });
	   
	   $("#button3").click(function(){

	      let params = new URLSearchParams(window.location.search);
	      let pa1 = params.get("pageIndex1");
	      let pa2 = params.get("pageIndex2");
	      
	      if(pa1 == null || pa1 === "") {
	          pa1 = 1;
	      }

	      if(pa2 == null || pa2 === "") {
	          pa2 = 1;
	      }      
	      
	      param1 = parseInt(pa1);
	      param2 = parseInt(pa2);
	      
	      param2 = param2 + 1;
	      
	      if(param2 > ${vo.lastPage2}){
	         param2 = 1;
	      }
	      
	      location.href="/adminMain.do?pageIndex1="+param1+"&pageIndex2="+param2;
	   });
	   
	   $("#button4").click(function(){

	      let params = new URLSearchParams(window.location.search);
	      let pa1 = params.get("pageIndex1");
	      let pa2 = params.get("pageIndex2");
	      
	      if(pa1 == null || pa1 === "") {
	          pa1 = 1;
	      }

	      if(pa2 == null || pa2 === "") {
	          pa2 = 1;
	      }
	      
	      param1 = parseInt(pa1);
	      param2 = parseInt(pa2);
	      
	      param2 = param2 - 1;
	      if(param2 <=0) {
	         param2 = ${vo.lastPage2};
	      }
	      
	      location.href="/adminMain.do?pageIndex1="+param1+"&pageIndex2="+param2;
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
		<%@ include file="../../mvinclude/mvadminnav.jsp" %> 
	</nav>
	
	<!-- 내용 -->
	<section style="height:800px;">
	<form name="frm">
	<input type="hidden" name="pageIndex1" id="pageIndex1" value="1">
   <input type="hidden" name="pageIndex2" id="pageIndex2" value="1">
   <button type="button" id="button2" class="pass1" style="position:relative; right:525px; top:200px;"></button>
   <button type="button" id="button1" class="pass2" style="position:relative; left:525px; top:200px;"></button>
	<table class="t2">
		<caption><h2><font color="white">현재 상영작</font></h2></caption>
		<tr>
		<c:set var="rownumber" value="${MovieAdminVO.recordCountPerPage1}"/>
		<c:forEach var="movie" items="${listNow}">
			<th>
				<div class="movieimage" 
						style="background-image:url(/mvimages/moviePoster/${movie.mvpost}); ">
						<div onmouseover="changeOpacity3(this)" onmouseout="changeOpacity4(this)" style="position:absolute; opacity:0;  width:190px; height:255px;">
							<table class="ticket" style="width:190px; height:255px;">
							<tr height="32%">
								<td>&nbsp;</td>
							</tr>
							<tr height="15%">
								<th><button class="ticket" type="button" onclick="openPopup('${movie.mvtitle}')">
								<font color="white">상세정보</font></button></th>
							</tr>
							<tr height="15%">
								<th><button class="ticket" type="button" onclick="openPopup2('${movie.mvprev}')">
								<font color="white">예고편</font></button></th>
							</tr>
							<tr height="32%">
								<td>&nbsp;</td>
							</tr>
						</table>
						</div>				
				</div>
				
			</th>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach var="movie" items="${listNow}">
			<td><img class="grade" src="../mvimages/${movie.mvgrade }.jpg">${movie.mvtitle}</td>
		</c:forEach>
		</tr>
	</table>
	
	<button type="button" id="button4" class="pass1" style="position:relative; right:525px; top:200px;"></button>
   <button type="button" id="button3" class="pass2" style="position:relative; left:525px; top:200px;"></button>

	<table class="t2">
		<caption><h2><font color="white">상영 예정작</font></h2></caption>
		
		<tr>
		<c:forEach var="movie" items="${listSoon}">
			<th>
				<div class="movieimage" 
					style="background-image:url(/mvimages/moviePoster/${movie.mvpost})">
					<div onmouseover="changeOpacity3(this)" onmouseout="changeOpacity4(this)" style="position:absolute; opacity:0;  width:190px; height:255px;">
						<table class="ticket" style="width:190px; height:255px;">
							<tr height="32%">
								<td>&nbsp;</td>
							</tr>
							<tr height="15%">
								<th><button class="ticket" type="button" onclick="openPopup('${movie.mvtitle}')">
								<font color="white">상세정보</font></button></th>
							</tr>
							<tr height="15%">
								<th><button class="ticket" type="button" onclick="openPopup2('${movie.mvprev}')">
								<font color="white">예고편</font></button></th>
							</tr>
							<tr height="32%">
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
				</div>
			</th>
		</c:forEach>
		</tr>
		<!-- 등급, 예매율? 추가 -->		
		<tr>
		
		<c:forEach var="movie" items="${listSoon}">
			<td><img class="grade" src="../mvimages/${movie.mvgrade}.jpg">${movie.mvtitle}</td>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach var="dday" items="${dday }">
			<td><font color="red">D-${dday.dday}</font></td>
		</c:forEach>
		</tr>
	</table>	
	</form>
	
	</section>

	
	<!-- 광고1 -->
	<aside>
<%-- 		<%@ include file="../../mvinclude/mvaside.jsp" %> --%>
	</aside>
	
	<!-- 광고2 -->
	<article>
<%-- 		<%@ include file="../../mvinclude/mvarticle.jsp" %> --%>
	</article>
	
	<!-- 하단메뉴 -->
	<footer>
		<%@ include file="../../mvinclude/mvfooter.jsp" %>
	</footer>
</div>
</body>
</html>