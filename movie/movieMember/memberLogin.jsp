<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 기본 css -->
<style>
nav {

}

section {
	width: 1200px;
	text-align: center;
	/* 	background-color:gray; */
}

aside {
	margin-top: 25px;
	text-align: center;
}

article {
	margin-top: 25px;
	text-align: center;
}

body {
	font-size: 12px;
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

div.d1 {
	width: 1200px;
	text-align: center;
}

div.outline {
	width: 1200px;
	text-align: center;
}

div.main {
	width: 1200px;
	text-align: center;
	align: center;
	item-align: center;
	border-collapse: collapse;
}

div.marketing2 {
	width:1200px;
	text-align:center;
}
/* 상단메뉴 */
table.mainmenu2 {
	width: 1200px;
	text-align: center;
	border-collapse: collapse;
	margin-top: 10px;
	margin-bottom: 5px;
}

table.mainmenu2 th {
	text-align: center;
	font-size: 20px;
	padding: 5px;
}

/* 하단메뉴 */
table.downmenu {
	width: 1200px;
	text-align: center;
}

table.downmenu td {
	border-right: 1px solid black;
}

table.t1 {
	width: 1200px;
	text-align: center;
	border-collapse: collapse;
	margin-top: 10px;
	margin-bottom: 5px;
}

table.t2 {
	width: 1200px;
	text-align:center;
}

table.t3 {
	width: 900px;
	margin-top: 5spx;
	margin-bottom: 5px;
}

table.t3 td {
	text-align: left;
}

table.t3 input, select, textarea {
	width: 95%;
}
</style>

<!-- 회원가입 css -->
<style>
.write1 {
	width: 800px;
	border-top: 2px solid #474747;
	border-collapse: collapse;
	position: relative;
	left: 110px;
}

.write1 td {
	border-bottom: 1px solid #cccccc;
	border-collapse: collapse;
	padding: 10px 0 10px 5px;
	text-align: left;
	height: 20px;
}

input[type="number"]::-webkit-inner-spin-button, /*인풋 넘버 화살표 없애기*/ input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input[type="text"] {
	width: 300px; /*가로크기*/
	height: 35px; /*세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
	margin-bottom: 5px;
}

input[type="password"] {
	width: 300px; /*가로크기*/
	height: 35px; /*세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
}

input[type="email"] {
	width: 500px; /*가로크기*/
	height: 35px; /*세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
}

input[type="number"] {
	width: 100px; /*가로크기*/
	height: 35px; /*세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
}

select {
	width: 80px; /*가로크기*/
	height: 35px; /*세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
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
	width: 20px;
	height: 20px;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	position: relative;
	top: 4.5px;
	right: 4px;
}

img.link1 {
	width: 15px;
	height: 15px;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	position: relative;
	top: 2.5px;
	right: 2px;
}

button.ticket {
	border-radius: 0px;
	border: 1px solid white;
	cursor: pointer;
	color: black;
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.5);
}

table.ticket {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.5);
}
</style>
<script>
$(function(){
	$("#button2").click(function(){
		var url = "/idpwCheck.do";
		window.open(url,"popup","width=400 height=300");
	});
	
	$("#button3").click(function(){
		location = "/memberJoinWrite.do";
	});
	
	$("#button1").click(function(){
		
		var userid = $.trim($("#userid").val());
		var userpw = $.trim($("#userpw").val());
		
		if(userid == "") {
			alert("아이디를 입력해 주세요.");
			$("#userid").focus();
			return false;
		}
		if(userpw == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#userpw").focus();
			return false;
		}
		
		$.ajax({
			type : "POST",
			data : "userid="+userid+"&userpw="+userpw,
			url : "memberLoginSub.do",
			dataType : "text",
			
			success : function(result) {
                if(result == "ok") {
                    alert(userid+"님 로그인 되었습니다.");
                    location="/movieMain.do";
                } else if(result == "2"){
                	alert("정지된 회원 입니다.")
                } else if(result == "3"){
                	alert("탈퇴한 회원 입니다.")
                } else {
                    alert("로그인 정보를 다시 확인해 주세요.");
                    $("#userpw").focus();
                    return false;
                }
			},
			error : function() {
				alert("오류");
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
	width: 15px;
	height: 15px;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	position: relative;
	top: 2.5px;
	right: 2px;
}

button.ticket {
	border-radius: 0px;
	border: 1px solid white;
	cursor: pointer;
	color: black;
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.5);
}

table.ticket {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.5);
}
.input-box{
    background:transparent;
    border:none;
    font-size:14pt;
    width:100%;
}
.input-box > input{
    
}
input::placeholder{
}
input:placeholder-shown + label{
	color:#aaa;
    font-size:14pt;
    top:15px;
}
input:focus + label, label{
	color:#8aa1a1;
    font-size:10pt;
    pointer-events: none;
    position: absolute;
    left:0px;
    top:0px;
}

input:focus, input:not(:placeholder-shown){
	border-bottom: solid 1px #8aa1a1;
    outline:none;
}
button{
	background-color:red;
	width:300px;
    height:35px;
    font-size:14pt;
    color:white;
    border-radius:5px;
    border:none;
}
#button2{
    font-size:12pt;
    color:rgb(164, 164, 164);
    cursor:pointer;
}
#button3{
    font-size:12pt;
    color:rgb(164, 164, 164);
    cursor:pointer;
}

.center-content {

}
</style>
<body>
	<div class="d1"
		style="position: absolute; left: 50%; transform: translateX(-50%);">

		<header>
			<img src="">
			<!-- 광고?? -->
		</header>

		<!-- 탑메뉴 -->
		<nav>
			<%@ include file="../../mvinclude/mvnav.jsp"%>
		</nav>

		<!-- 내용 -->
		<section>
		<p>
		&nbsp;
		</p>
		<p>
		&nbsp;
		</p>
		<p>
		&nbsp;
		</p>
		<p>
		&nbsp;
		</p>
		<div class="center-content">
			<form name="frm" id="frm">
			<table class="t2" cellspacing="0" cellpadding="5">
				<tr>
					<td>
				        <input id="userid" type="text" name="userid" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>
				        <input id="userpw" type="password" name="userpw" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td>  
				        <a id="button2">아이디/비밀번호 찾기</a>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        <a id="button3">회원가입</a>
					</td>
				</tr>
				<tr>
					<th>
						<button class="" type="submit" id="button1" onclick="return false;">로그인</button>
					</th>
				</tr>
			</table>
		</form>
		</div>
		</section>
		<p>
		&nbsp;
		</p>
		<p>
		&nbsp;
		</p>
		<p>
		&nbsp;
		</p>
		<p>
		&nbsp;
		</p>
		<!-- 광고1 -->
		<aside>
<%-- 			<%@ include file="../../mvinclude/mvaside.jsp" %> --%>
		</aside>

		<!-- 광고2 -->
		<article>
			<%@ include file="../../mvinclude/mvarticle.jsp" %>
		</article>

		<!-- 하단메뉴 -->
		<footer>
			<%@ include file="../../mvinclude/mvfooter.jsp"%>
		</footer>
	</div>
</body>
</html>