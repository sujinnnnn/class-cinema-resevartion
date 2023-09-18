<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%
	// 세션 아이디 확인
	String s_userid = (String) session.getAttribute("SessionAdminID");
	if (s_userid == null) {
	%>
	<script>
	alert("잘못된 접근입니다.");
	 location= "/adminLogin.do";
	</script>
	<%
	}
%>


&nbsp;
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
hearder {

}

nav {

}

section {
	height:500px;
	text-align:center;
	border-top:2px solid black;
}

aside {
	margin-top:25px;
}

article {
	margin-top:25px;
}

footer {
	margin-top:15px;
}


body {
	font-size:12px;
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
	border-collapse:collapse;
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
	border-top:1px solid black;
	cellpadding:5px;
}

table.t2 {
	width:1000px;
	text-align:center;
}

table.t3 {
	width:900px;
	margin-top:5spx; 
	margin-bottom:5px;
}

table.t3 td {
	text-align:left;
}

table.writetable {
	position:relative;
	width:800px;
	left:200px;
	margin-top:15px;

}

table.writetable td {
	text-align:left;
}
</style>

<style>
.write1 {
	width:1000px;
	border-top:2px solid #474747;
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	position:relative; 
	left:110px;
}
.write1 td {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:10px 0 10px 5px;
	text-align:left;
	height:20px;
}
input[type="number"]::-webkit-inner-spin-button,      /*인풋 넘버 화살표 없애기*/
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type="text"] {
    width: 500px; /*가로크기*/
    height: 35px; /*세로크기*/
    background-color: #fafafa; /*배경색*/
    border:1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
    border-radius:1px; /*테두리 둥글게*/
    outline:none; /*기본테두리안보이게*/
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
    transition:.3s; /*서서히 나타내기*/
    margin-bottom:5px;
}
input[type="password"] {
    width: 500px; /*가로크기*/
    height: 35px; /*세로크기*/
    background-color: #fafafa; /*배경색*/
    border:1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
    border-radius:1px; /*테두리 둥글게*/
    outline:none; /*기본테두리안보이게*/
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
    transition:.3s; /*서서히 나타내기*/
}
input[type="email"] {
    width: 500px; /*가로크기*/
    height: 35px; /*세로크기*/
    background-color: #fafafa; /*배경색*/
    border:1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
    border-radius:1px; /*테두리 둥글게*/
    outline:none; /*기본테두리안보이게*/
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
    transition:.3s; /*서서히 나타내기*/
}
input[type="number"] {
    width: 100px; /*가로크기*/
    height: 35px; /*세로크기*/
    background-color: #fafafa; /*배경색*/
    border:1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
    border-radius:1px; /*테두리 둥글게*/
    outline:none; /*기본테두리안보이게*/
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
    transition:.3s; /*서서히 나타내기*/
}

select {
    width: 80px; /*가로크기*/
    height: 35px; /*세로크기*/
    background-color: #fafafa; /*배경색*/
    border:1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
    border-radius:1px; /*테두리 둥글게*/
    outline:none; /*기본테두리안보이게*/
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
    transition:.3s; /*서서히 나타내기*/
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
$(function() {
    $("#button1").click(function() {
    	
    	var dotPosition = $("#file1").val().lastIndexOf(".");    	
    	if (dotPosition == -1 || dotPosition == 0) {
    		alert("올바른 첨부파일이 아닙니다.");
            $("#file1").focus();
            return false;
        }
    	var fileExtension = $("#file1").val().slice(dotPosition + 1).toLowerCase();    	
    	
        // 상품 이름 입력 검사
        if ($("#mdname").val() == "") {
            alert("이름을 입력해주세요");
            $("#mdname").focus();
            return false;
        }

        // 상품 사진 선택 검사
        if ($("#file1").val() == "") {
            alert("상품 사진을 등록해주세요");
            $("#file1").focus();
            return false;
        }else if(fileExtension!="jpg" &&
        		fileExtension!="jpeg" &&
        		fileExtension!="png"){
        	alert("사진파일이여야합니다.");
            $("#file1").focus();
            return false;
        }


        // 상품 가격 입력 검사
        if ($("#mdprice").val() == "") {
            alert("상품 가격을 입력해주세요");
            $("#mdprice").focus();
            return false;
        }

        // 유효기간 입력 검사
        if ($("#expirationdate").val() == "") {
            alert("유효기간을 입력해주세요");
            $("#expirationdate").focus();
            return false;
        }        

        var form = new FormData(document.getElementById('frm'));		
		let mdname = $("#mdname").val();
		
        $.ajax({
            type: "POST",
            data: form,
            url: "/adminStoreWriteSave.do",
            processData: false, // 파일이 전송되는 경우의 설정
            contentType: false, // 파일이 전송되는 경우의 설정
            datatype: "text",
            success: function(data) {            
            	
                if (data != "") {
                    alert(mdname+" 등록완료");
                    location = "/adminStore.do"
                } else {
                    alert("등록실패");
                }
            },
            error: function() {
                alert("전송실패");
            }
        });
    });
});
</script>

<style>
.movieimage {
    width: 190px;
    height: 255px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}

img.grade {
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
<body>
	<div class="d1" style="position:absolute; left:50%; transform:translateX(-50%);">
	<!-- -->
	<header>
		<img src=""> <!-- 광고?? -->
	</header>
	
	<!-- 탑메뉴 -->
	<nav>
		<%@ include file="../../mvinclude/mvadminnav.jsp" %>
	</nav>
	
	<!-- 내용 -->
	<section>
	<form name="frm" id="frm">
		<div>
		<form  id="frm" enctype="multipart/form-data">
			<table class="write1">
				<caption><h2>상품 등록(담당자 ver)</h2></caption>
				<tr>
				<th width="15%">상품 이름</th>
				<td><input type="text" name="mdname" id="mdname" placeholder="이름을 입력하세요"></td>
			</tr>			
			<tr>
				<th width="15%">상품 사진</th>
				<td><input type="file" name="file1" id="file1" accept="image/jpg,image/jpeg,image/png">
					<input type="hidden" name="mdphoto" id="mdphoto">
				</td>
			</tr>
			<tr>
				<th width="15%">구성품</th>
				<td><input type="text" name="mddetail" id="mddetail" placeholder="구성품을 입력하세요"></td>
			</tr>
			<tr>
				<th width="15%">가격</th>
				<td><input type="text" name="mdprice" id="mdprice" placeholder="가격을 입력하세요"></td>
			</tr>
			<tr>
				<th width="15%">유효기간</th>
				<td><input type="text" name="expirationdate" id="expirationdate" placeholder="유효기간을 입력하세요"></td>
			</tr>			
			</table>
			<table class="writetable" cellpadding="5" cellspacing="1">
				<tr>
					<th>
						<button type="button" id="button1">저장</button>
						<button type="reset">다시쓰기</button>
						<button type="button" onclick="location='adminMain.do'">메인으로</button>
					</th>
				</tr>
			</table>
		</form>
		</div>
	</form>
	</section>
	<br>&nbsp;
	<br>&nbsp;
	<br>&nbsp;
	<br>&nbsp;
	
	<!-- 광고1 -->
	<aside>
<%-- 		<a href="#"><%@ include file="../../mvinclude/mvaside.jsp" %></a> --%>
		<p>&nbsp;</p>
	</aside>
	
	<!-- 광고2 -->
	<article>
<%-- 		<a href="#"><%@ include file="../../mvinclude/mvarticle.jsp" %></a> --%>
		<p>&nbsp;</p>
	</article>
	
	<!-- 하단메뉴 -->
	<footer>
		<%@ include file="../../mvinclude/mvfooter.jsp" %>
	</footer>
</div>
</body>
</html>