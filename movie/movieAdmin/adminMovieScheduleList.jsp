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
<title>회원 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<style>

  .table1 {
 	 background-color: white;
    width: 50%;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 10px;
    border-collapse: collapse;
    align:center;
  }
  
  .table1table1 .list td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .bb:hover{
  	background-color:lightsalmon;  	
  }
  .aa:hover {
  	background-color:white;
  	color:black;
  }
  
    select, input[type="text"], input[type="date"], input[type="file"] {
    width: 100px;
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
.button2 {
	padding: 5px 10px;
	margin: 2px;
	background-color: grey;
	border: none;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}
.list{
	text-align:center; 
	width:800px; 
	
	position:relative;
	left:200px;
}
.list2{
	text-align:center; 
	width:800px; 	
	position:relative;
	left:300px;
}
a:hover{
	cursor:pointer;
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
	width:98%;
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

button {
    padding: 3px 20px;
    margin: 5px;
    background-color: red;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
    height:30px;
  }



</style>

<script>
function fn_delete(unq) {
	  const userConfirmation = confirm("정말로 삭제하시겠습니까?");
	  if (userConfirmation) {
	    location= "/adminMovieScheduleDelete.do?unq="+unq;
	  } else {
		  return false;
	  }
	}

function btn_title(mvtitle) {   
	   location="/adminMovieScheduleList.do?mvtitle="+mvtitle;
	}
	
/* var page =${pageIndex3};

function page(mvtitle){
	for( var i=1; i<=${movieAdminVO.lastPage3}; i++;){
		if(i == page) {
			location="adminMovieScheduleList/.do?mvtitle="+mvtitle+page=${i};
		}
		else{
			location="adminMovieScheduleList/.do?mvtitle="+mvtitle+page=${i};
		}
	}
	
}
 */
</script>


<body>

<div class="d1" style="position:absolute; left:50%; transform:translateX(-50%);">
	<nav>
		<%@ include file="../../mvinclude/mvadminnav.jsp" %> 
	</nav>

<section style="background-color:white; width:1200px; height:1000px; text-align:center;">
로그인 아이디 : ${sessionScope.SessionAdminID }

<form id="frm">
<table border="1" class="t1">	
	<colgroup>
		<col width="5%">
		<col width="*%">
		<col width="10%">
		<col width="10%">
		<col width="20%">
		<col width="15%">
		<col width="10%">
	</colgroup>
	<tr>
		<th>번호</th>
		<th>영화제목</th>
		<th>영업점</th>
		<th>상영관</th>
		<th>상영날짜</th>
		<th>상영시간</th>
<!-- 		<th>수정</th> -->
		<th>삭제</th>
	</tr>
	<div style="text-align:left;">
	<c:forEach var="title2" items="${title}">	
			<button type="button" onclick="btn_title('${title2.mvtitle}')">${title2.mvtitle }</button>		
	</c:forEach>
	</div>
	<c:forEach var="result2" items="${resultList2}">
					<input type="hidden" name="unq" id="unq" value="${result2.unq }">
					<tr>
						<td>${result2.rn }</td>
						<td>${result2.mvtitle }</td>
						<td>${result2.mvlocation}</td>
						<td>${result2.mvroom}</td>
						<td>${result2.mvdate}</td>
						<td>${result2.mvschedule}</td>
						<%-- <td><button type="button" onclick="location='/adminMovieScheduleModify.do?unq=${result2.unq }'">수정</button></td> --%>
						<td><button type="button" onclick="fn_delete('${result2.unq }')">삭제</button></td>
					</tr>
				</c:forEach>
	
</table>
<div style="width:600px; text-align:center; margin-top:10px; margin-left:310px; font-size:13px;">

	<c:set var="page" value="${pageIndex3}" />
		<c:forEach var="i" begin="1" end="${movieAdminVO.lastPage3}">
		    <c:choose>
		        <c:when test="${i == page}">
		            <a href="adminMovieScheduleList.do?mvtitle=${vo.mvtitle}&pageIndex3=${i}" style="color: blue; font-weight: bold; font-size:19px;">${i}</a>
		            <%-- <a href="fn_page('${ vo.mvtitle}')" style="color: blue; font-weight: bold; font-size:19px;">${i}</a> --%>
		            
		        </c:when>
		        <c:otherwise>
		            <a href="/adminMovieScheduleList.do?mvtitle=${vo.mvtitle}&pageIndex3=${i}">${i}</a>
		           <%--  <a href="fn_page('${ vo.mvtitle}')">${i}</a> --%>
		        </c:otherwise>
		    </c:choose>
		</c:forEach>
</div>
<div style="margin-top:10px;">
<button type="button" onclick="location='adminMovieInfoList.do'">상영영화 리스트로 이동</button>
<button type="button" onclick="location='adminMain.do'">메인으로 이동</button>
</div>
</from>
</div>
</body>
</section>
</html>