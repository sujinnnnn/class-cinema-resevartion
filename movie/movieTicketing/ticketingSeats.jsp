<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// 세션 아이디 확인
String s_userid = (String) session.getAttribute("SessionUserID");
if (s_userid == null) {
%>
<script>
	alert("로그인이 필요한 서비스입니다.");
	location = "/memberLogin.do";
</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석선택</title>
</head>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
hearder {
	
}

nav {
	width: 1200px;
}

section {
	width: 1200px;
	text-align: center;
	background-color: black;
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
	width: 1120px;
	text-align: center;
	border-collapse: collapse;
	margin-top: 10px;
	margin-bottom: 5px;
	background-color: white;
}

table.t2 {
	width: 1000px;
	text-align: center;
	position: relative;
	left: 103px;
	color: white;
}

table.t3 {
	width: 900px;
	margin-top: 5spx;
	margin-bottom: 5px;
}

table.t3 td {
	text-align: left;
}

table.t3 input, textarea {
	width: 95%;
}

.movieimage {
	width: 120px;
	height: 160px;
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

img.grade {
	width: 30px;
	height: 30px;
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
	width: 100px;
	height: 35px;
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

<style>
input[type="checkbox"] {
	width: 20px; /*가로크기*/
	height: 20px; /*세로크기*/
	border: 0px;
}

input[type=checkbox], input[type=radio] {
	accent-color: red;
}

.select_member {
	width: 50px;
	height: 35px;
	position: relative;
	bottom: 2px;
	border: 1px solid black;
	font-size: 20px;
}

.pay1 {
	width: 150px;
	height: 80px;
	background-color: red;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

.pay2 {
	width: 150px;
	height: 80px;
	background-color: gray;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

.pay3 {
	width: 700px;
	height: 75px;
	background-color: gray;
	color: white;
	font-size: 20px;
}

.seat_case1 {
	width: 20px;
	height: 20px;
	background-color: red;
}

.seat_case2 {
	width: 20px;
	height: 20px;
	background-color: white;
}

.seat_case3 {
	width: 20px;
	height: 20px;
	background-color: gray;
}
</style>
<script>
	function fn_aa(vv) {

		var nn = vv.substring(0, 2);
		var index = vv.substring(1);

		fn_bb(vv, nn, index - 1);
	}

	function fn_bb(id, nn, index) {

		var len = $("#count").val();
		var bool = true;
		var seat = 0;

		//인원 미선택시
		if (len == 0) {
			alert("인원을 선택해주세요");
			$("#" + id).prop("checked", false);
			return false;
		} else if (len == 1) {
			$(":checkbox").each(function() {
				if ($(this).prop("checked")) {
					var xx = $("ul").has(this).attr("class");
					if (xx == "counting") {
						seat++;
					}
				}
			});
			if (seat > len) {
				alert("좌석을 모두 선택하였습니다");
				$("#" + id).prop("checked", false);
				return false;
			}
			//두명 선택시
		} else if (len == 2) {
			$(":checkbox").each(function() {
				if ($(this).prop("checked")) {
					var xx = $("ul").has(this).attr("class");
					if (xx == "counting") {
						seat++;
					}
				}
			});
			if (seat > len) {
				alert("좌석을 모두 선택하였습니다");
				$("#" + id).prop("checked", false);
				return false;
			}
			//세명 선택시	
		} else if (len == 3) {
			$(":checkbox").each(function() {
				if ($(this).prop("checked")) {
					var xx = $("ul").has(this).attr("class");
					if (xx == "counting") {
						seat++;
					}
				}
			});
			if (seat > len) {
				alert("좌석을 모두 선택하였습니다");
				$("#" + id).prop("checked", false);
				return false;
			}

		} else if (len == 4) {
			$(":checkbox").each(function() {
				if ($(this).prop("checked")) {
					var xx = $("ul").has(this).attr("class");
					if (xx == "counting") {
						seat++;
					}
				}
			});
			if (seat > len) {
				alert("좌석을 모두 선택하였습니다");
				$("#" + id).prop("checked", false);
				return false;
			}
			/* if( $("input[name='"+nn+"']").is(":checked") == false ) {
				bool = false;
			}
			for( var i=0; i<1; i++ ) {
				$("input[name='"+nn+"']")[index+i].checked = bool;
			} */
		}
	}

	function fn_change(value) {

		var h_count = $("#h_count").val();
		var money = $("#h_count").val() * 11000;
		var len = document.getElementsByName("seats").length;
		if (value < h_count) {
			for (var i = 0; i < len; i++) {
				document.getElementsByName("seats")[i].checked = false;
			}
		}
		$("#h_count").val(value);
		var money = value * 11000;
		var total = "총 합계 : " + money + "원"
		$("#money").val(total);
		$("#totalPrice").val(total);
	}

	$(function() {

		$("#button1").click(function() {
			
			var count = $("#count").val();
			var countchk = 0;
			var str = "";
			var datas = "";
			var len = $("input[name='seats']").length;

			for (var i = 0; i < len; i++) {
				if ($("input[name='seats']")[i].checked == true) {
					str = document.getElementsByName("seats")[i].value;
					countchk++;
					datas += str + ",";
				}
			}
			if (count != countchk) {
				alert("좌석을 모두 선택해주세요");
				return false;
			}
			if (datas != "") {
				datas = datas.substring(0, datas.length - 1);
			} else {
				alert("좌석을 선택해주세요");
				return false;
			}
			alert("선택한 좌석은 " + datas + "입니다.");
			$("#frm").submit();

		});
	});
</script>

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
		<section style="height: 800px;">
			<ul class="counting">
				<div align="center" style="">
					<h3>영화관 좌석 예매</h3>
					<h4>예매할 좌석을 체크 한 후 예약 버튼 눌러주세요</h4>
				</div>
				<hr>
				<form name="frm" id="frm" method="post" action="ticketPay.do">
					<table style="color: white; width: 1120px;">
						<tr>
							<td width="20%"></td>
							<th width="*"><font style="font-size: 20px;">인원/좌석 선택</font></th>
							<td width="20%" align="right"
								style="position: relative; top: 10px;"><font
								style="font-size: 10px;">*인원은 최대 4명까지 선택 가능합니다.</font></td>
						</tr>
					</table>
					<table class="t1">
						<tr>
							<th>
								<table cellpadding="10">
									<tr>
										<th rowspan="4"><div class="movieimage"
												style="background-image:url(../mvimages/moviePoster/${v.mvpost}"></div></th>
										<td align="left"><img class="grade"
											src="../mvimages/${v.mvgrade }.jpg"> <font size="5">${v.mvtitle }</font>
										</td>
									</tr>
									<tr>
										<td align="left">${v.mvdate }<br>${v.mvschedule }</td>
									</tr>
									<tr>
										<td align="left">${v.mvlocation }- ${v.mvroom }</td>
									</tr>
								</table>
							</th>
							<th><font color="black" size="5">인원 : </font> <select
								id="count" name="count" onchange="fn_change(this.value)"
								class="select_member">
									<option value="0">0명</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
							</select></th>
						</tr>
					</table>
					<br> <br> <br>
					<div style="position: relative; left: 375px;">
						<table style="color: white; width: 1120px;" align="center">
							<input type="hidden" name="h_count" id="h_count" value="">
							<tr>
								<th>
									<table>
										<tr>
											<th colspan="2">좌석배치도</th>
										</tr>
										<tr>
											<th style="border: 1px solid white;" colspan="2"><div
													style="color: white;">screen</div></th>
										</tr>
										<tr>
											<th>&nbsp;</th>
										</tr>
										<tr>
											<th width="10%"><font color="white">a열</font></th>
											<th><input type="checkbox" name="seats" id="a1"
												value="a1"
												<c:if test="${fn:contains(seat, 'a1')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="a2" value="a2"
												<c:if test="${fn:contains(seat, 'a2')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="a3" value="a3"
												<c:if test="${fn:contains(seat, 'a3')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="a4" value="a4"
												<c:if test="${fn:contains(seat, 'a4')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="a5" value="a5"
												<c:if test="${fn:contains(seat, 'a5')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="a6" value="a6"
												<c:if test="${fn:contains(seat, 'a6')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="a7" value="a7"
												<c:if test="${fn:contains(seat, 'a7')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="a8" value="a8"
												<c:if test="${fn:contains(seat, 'a8')}"> disabled </c:if>
												onclick="fn_aa(this.value)"></th>
										</tr>
										<tr>
											<th><font color="white">b열</font></th>
											<th><input type="checkbox" name="seats" id="b1"
												value="b1"
												<c:if test="${fn:contains(seat, 'b1')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="b2" value="b2"
												<c:if test="${fn:contains(seat, 'b2')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="b3" value="b3"
												<c:if test="${fn:contains(seat, 'b3')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="b4" value="b4"
												<c:if test="${fn:contains(seat, 'b4')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="b5" value="b5"
												<c:if test="${fn:contains(seat, 'b5')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="b6" value="b6"
												<c:if test="${fn:contains(seat, 'b6')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="b7" value="b7"
												<c:if test="${fn:contains(seat, 'b7')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="b8" value="b8"
												<c:if test="${fn:contains(seat, 'b8')}"> disabled </c:if>
												onclick="fn_aa(this.value)"></th>
										</tr>
										<tr>
											<th><font color="white">c열</font></th>
											<th><input type="checkbox" name="seats" id="c1"
												value="c1"
												<c:if test="${fn:contains(seat, 'c1')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="c2" value="c2"
												<c:if test="${fn:contains(seat, 'c2')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="c3" value="c3"
												<c:if test="${fn:contains(seat, 'c3')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="c4" value="c4"
												<c:if test="${fn:contains(seat, 'c4')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="c5" value="c5"
												<c:if test="${fn:contains(seat, 'c5')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="c6" value="c6"
												<c:if test="${fn:contains(seat, 'c6')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="c7" value="c7"
												<c:if test="${fn:contains(seat, 'c7')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="c8" value="c8"
												<c:if test="${fn:contains(seat, 'c8')}"> disabled </c:if>
												onclick="fn_aa(this.value)"></th>
										</tr>
										<tr>
											<th><font color="white">d열</font></th>
											<th><input type="checkbox" name="seats" id="d1"
												value="d1"
												<c:if test="${fn:contains(seat, 'd1')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="d2" value="d2"
												<c:if test="${fn:contains(seat, 'd2')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="d3" value="d3"
												<c:if test="${fn:contains(seat, 'd3')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="d4" value="d4"
												<c:if test="${fn:contains(seat, 'd4')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="d5" value="d5"
												<c:if test="${fn:contains(seat, 'd5')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="d6" value="d6"
												<c:if test="${fn:contains(seat, 'd6')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="d7" value="d7"
												<c:if test="${fn:contains(seat, 'd7')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="d8" value="d8"
												<c:if test="${fn:contains(seat, 'd8')}"> disabled </c:if>
												onclick="fn_aa(this.value)"></th>
										</tr>
										<tr>
											<th><font color="white">e열</font></th>
											<th><input type="checkbox" name="seats" id="e1"
												value="e1"
												<c:if test="${fn:contains(seat, 'e1')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="e2" value="e2"
												<c:if test="${fn:contains(seat, 'e2')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="e3" value="e3"
												<c:if test="${fn:contains(seat, 'e3')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="e4" value="e4"
												<c:if test="${fn:contains(seat, 'e4')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="e5" value="e5"
												<c:if test="${fn:contains(seat, 'e5')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="e6" value="e6"
												<c:if test="${fn:contains(seat, 'e6')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="e7" value="e7"
												<c:if test="${fn:contains(seat, 'e7')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="e8" value="e8"
												<c:if test="${fn:contains(seat, 'e8')}"> disabled </c:if>
												onclick="fn_aa(this.value)"></th>
										</tr>
										<tr>
											<th><font color="white">f열</font></th>
											<th><input type="checkbox" name="seats" id="f1"
												value="f1"
												<c:if test="${fn:contains(seat, 'f1')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="f2" value="f2"
												<c:if test="${fn:contains(seat, 'f2')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="f3" value="f3"
												<c:if test="${fn:contains(seat, 'f3')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="f4" value="f4"
												<c:if test="${fn:contains(seat, 'f4')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="f5" value="f5"
												<c:if test="${fn:contains(seat, 'f5')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="f6" value="f6"
												<c:if test="${fn:contains(seat, 'f6')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> &nbsp;&nbsp;&nbsp; <input
												type="checkbox" name="seats" id="f7" value="f7"
												<c:if test="${fn:contains(seat, 'f7')}"> disabled </c:if>
												onclick="fn_aa(this.value)"> <input type="checkbox"
												name="seats" id="f8" value="f8"
												<c:if test="${fn:contains(seat, 'f8')}"> disabled </c:if>
												onclick="fn_aa(this.value)"></th>
										<tr>
											<input type="hidden" value="${v.mvlocation }" id="mvlocation"
												name="mvlocation">
											<input type="hidden" value="${v.mvtitle }" id="mvtitle"
												name="mvtitle">
											<input type="hidden" value="${v.mvroom }" id="mvroom"
												name="mvroom">
											<input type="hidden" value="${v.mvgrade }" id="mvgrade"
												name="mvgrade">
											<input type="hidden" value="${v.mvvolume }" id="mvvolume"
												name="mvvolume">
											<input type="hidden" value="${v.mvschedule }" id="mvschedule"
												name="mvschedule">
											<input type="hidden" value="${v.mvdate }" id="mvdate"
												name="mvdate">
											<input type="hidden" value="${v.mvpost}" id="mvpost"
												name="mvpost">
											<input type="hidden" value="${v.unq }" id="unq" name="unq">
											<input type="hidden" value="" id="totalPrice"
												name="totalPrice">
											</ul>
											</th>
										</tr>
									</table>
								</th>
							</tr>
						</table>
					</div>
					<br> <br> <br>
					<table width="1120" style="color: white;">
						<tr>
							<td align="left"><button type="button" class="seat_case1"
									disabled=""></button>&nbsp;선택좌석&nbsp;&nbsp;
								<button type="button" class="seat_case2" disabled=""></button>&nbsp;선택가능&nbsp;&nbsp;
								<button type="button" class="seat_case3" disabled=""></button>&nbsp;예매완료
							</td>
						</tr>
					</table>
					<table width="1120" height="50" style="color: white;">
						<tr>
							<th align="left"><input type="text" class="pay3" value=""
								id="money" readonly></th>
							<th>
								<button class="pay1" type="button" id="button1">결제하기</button>
								<button class="pay2" type="button"
									onclick="location.href='/movieMain.do'">돌아가기</button>
							</th>
						</tr>
					</table>
					</form>

					<br>
		</section>

		<!-- 광고1 -->
		<aside></aside>

		<!-- 광고2 -->
		<article></article>

		<!-- 하단메뉴 -->
		<footer>
			<%@ include file="../../mvinclude/mvfooter.jsp"%>
		</footer>
	</div>
</body>
</html>