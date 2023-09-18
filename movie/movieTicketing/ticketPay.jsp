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
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
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
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
	table {
		width: 80%;
    	border-collapse : collapse;
		border-spacing : 0;
	}
	.div1 {
	  height: 761px;
      width: 1200px;
      margin: auto;
      padding: 20px;
      border-radius: 5px;
      position:relative;
      right:75px;
      top:30px;
	}
	.container0 {
		position: absolute;
  		left:17%;
  		
	}
	.container2 {
		position: absolute;
		left: 20px;
		top:20px;
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
	    color: white;
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
    .kakao_btn {
      display: block;
      width: 40%;
      padding: 10px;
      background-color: #FA5858;
      color: #FFF;
      border: none;
      border-radius: 3px;
      cursor: pointer;
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

.pay3 {
	width:230px;
	height:25px;
	color:black;
	font-size:20px;
}

.movieimage {
    width: 226px;
    height: 355px;
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
</style>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
$(function(){
	
    $("#button1").click(function(){
    	
    	var form = $("#frm").serialize();
    	var aaa = $("#mvdate").val();
      
    	$.ajax({
            url: "/ticketKakaoPay.do",
            data: form,	
            
            dataType: "json",
            success: function(data){
            	
                var qrcode = data.next_redirect_pc_url;           		
                location=qrcode;
                
            },
            error: function() {
               alert("에러");
            }
         });
        
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
	<form name="frm" id="frm">
		<div class="div1">
			<div class="container0">
				<div class="container">
					<div class="box">예매정보</a></div>
					<div class="box">결제정보</div>
					<div class="box">결제하기</div>
				</div>
				<div class="container1"> 
					<div class="box1">
						<table>
							<tr>
								<th colspan="2">
									<img class="movieimage"	style="background-image:url(/mvimages/moviePoster/${vo.mvpost}">
								</th>
							</tr>	
							<tr>
								<td colspan="2">
									<img class="grade" src="../mvimages/${vo.mvgrade }.jpg">
									<font size="5">${vo.mvtitle }</font>
								</td>
							</tr>
							<tr>
								<td>상영일</td>
								<td>		
									${vo.mvdate} ${vo.mvschedule }
								</td>
							</tr>
							<tr>
								<td>영화관</td>
								<td>
									 ${vo.mvlocation } ${vo.mvroom }
								</td>
							</tr>
							<tr>
								<td>좌석</td>
								<td>
									${vo.seats}
								</td>
							</tr>
						</table>
					</div>
					<div class="box1">
						<table>
							<tr>
								<td>
									<div class="pay3" >총합계 : ${vo.totalPrice }</div>
								<td>
							</tr>
							<tr>
								<td>
								<input type="hidden" value="${vo.totalPrice }" id="totalPrice" name="totalPrice">
									<input type="hidden" value="${vo.userid }" id="userid" name="userid">
									<input type="hidden" value="${vo.mvlocation }" id="mvlocation" name="mvlocation">
									<input type="hidden" value="${vo.mvtitle }" id="mvtitle" name="mvtitle">
									<input type="hidden" value="${vo.mvroom }" id="mvroom" name="mvroom">
									<input type="hidden" value="${vo.mvgrade }" id="mvgrade" name="mvgrade">
									<input type="hidden" value="${vo.mvvolume }" id="mvvolume" name="mvvolume">
									<input type="hidden" value="${vo.mvschedule }" id="mvschedule" name="mvschedule">
									<input type="hidden" value="${vo.mvdate}" id="mvdate" name="mvdate">
									<input type="hidden" value="${vo.mvpost}" id="mvpost" name="mvpost">
									<input type="hidden" value="${vo.unq }" id="unq" name="unq">
									<input type="hidden" value="${vo.seats }" id="seats" name="seats">
								</td>
							</tr>
						</table>
					</div>
					<div class="box1"><button type="button" id="button1" class="kakao_btn">결제하기</button></div>
				</div>	
			</div>
		</div>
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