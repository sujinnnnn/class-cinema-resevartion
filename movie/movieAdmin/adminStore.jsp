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
<title>관리자스토어화면</title>
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
	color:black;
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
    width: 300px;
    height: 300px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;    
}
.ticket{
	
	width: 100%;
	margin-left:50px;
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
}


button.pass1 {
   width:20px;
   height:40px;
   background-image: url("../mvimages/화살표1.png");
    background-repeat: no-repeat;
    background-position: center;
   border: none;
   color: black;
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
   color: black;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   cursor:pointer;
}
</style>
<script>

 function btn_mdDelete(mdname) {
   const userConfirmation = confirm("정말로 삭제하시겠습니까?");
   if (userConfirmation) {
	   location= "/adminStoreDelete.do?mdname="+mdname;
	   location="/adminStore.do";
        
   } else {
      return false;
   }
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
	<p>&nbsp;</p>
	<!-- 내용 -->
	<section style="height:800px;">
	<div>
		<img src="../../mvimages/광고.jpg" width="1000"> <!-- 광고?? -->
	</div>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<form name="frm">   
	<table class="t2">
    <c:forEach var="movie" items="${store}" varStatus="loop">
        <c:if test="${loop.index % 3 == 0}">
            <tr>
        </c:if>
        <td>
            <div class="movieimage">						
                <div>
                    <img src="../../mvimages/storeMD/${movie.mdphoto}" width="200" height="180">
                    <table class="ticket" style="width:190px; height:20px;">	
                        <tr>
                            <td>${movie.mdname}</td>							
                        </tr>	
                        <tr>
                            <td>${movie.mdprice}</td>							
                        </tr>
                        <tr>
                        	<td><button type="button" onclick="btn_mdDelete('${movie.mdname}')">삭제</button></td>
                        </tr>	
                    </table>
                </div>				
            </div>
        </td>
        <c:if test="${loop.index % 3 == 2 || loop.index == store.size() - 1}">
            </tr>
        </c:if>
    </c:forEach>
</table>
		
		<!-- 등급, 예매율? 추가 -->		
		
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