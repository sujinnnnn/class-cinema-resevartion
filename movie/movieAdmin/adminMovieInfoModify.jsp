<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
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
<title>영화수정</title>
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
        // 영화제목 입력 검사
        if ($("#mvtitle").val() == "") {
            alert("제목을 입력해주세요");
            $("#mvtitle").focus();
            return false;
        }

        // 영화등급 선택 검사
        if ($("#mvgrade").val() == "") {
            alert("영화등급을 선택해주세요");
            $("#mvgrade").focus();
            return false;
        }

        // 영화포스터 선택 검사
        if ($("#file1").val() == "") {
            alert("영화포스터를 등록해주세요");
            $("#file1").focus();
            return false;
        }

        // 영화상영시작 날짜 선택 검사
        if ($("#startday").val() == "") {
            alert("상영시작 날짜를 선택해주세요");
            $("#startday").focus();
            return false;
        }

        // 영화상영종료 날짜 선택 검사
        if ($("#lastday").val() == "") {
            alert("상영종료 날짜를 선택해주세요");
            $("#lastday").focus();
            return false;
        }

        // 영화감독 입력 검사
        if ($("#mvdirector").val() == "") {
            alert("감독명을 입력해주세요");
            $("#mvdirector").focus();
            return false;
        }

        // 영화장르 입력 검사
        if ($("#mvgenre").val() == "") {
            alert("장르를 입력해주세요");
            $("#mvgenre").focus();
            return false;
        }

        // 영화줄거리 입력 검사
        if ($("#mvinfo").val() == "") {
            alert("줄거리를 입력해주세요");
            $("#mvinfo").focus();
            return false;
        }

        // 영화예고편 선택 검사
        if ($("#file2").val() == "") {
            alert("영화예고편을 등록해주세요");
            $("#file2").focus();
            return false;
        }

        // 영화길이 입력 검사
        if ($("#mvvolume").val() == "") {
            alert("영화길이를 입력해주세요");
            $("#mvvolume").focus();
            return false;
        }

        var form = new FormData(document.getElementById('frm'));

        $.ajax({
            type: "POST",
            data: form,
            url: "/adminMovieInfoModifySave.do",
            processData: false, // 파일이 전송되는 경우의 설정
            contentType: false, // 파일이 전송되는 경우의 설정
            datatype: "text",
            success: function(data) {
                if (data != "") {
                    alert("수정완료");
                    location = "/adminMovieInfoList.do"
                } else {
                    alert("수정실패");
                }
            },
            error: function() {
                alert("전송실패");
            }
        });
    });
});

</script>
<script type="text/javascript">
    $(document).ready(function() {
 
        $(".datepicker").datepicker({
  
              showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
              buttonImage: "../mvimages/whitebutton.png", // 버튼 이미지
              buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
              changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
              changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
              minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
              nextText: '다음 달', // next 아이콘의 툴팁.
              prevText: '이전 달', // prev 아이콘의 툴팁.
              numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
              stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
              yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
              showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. ( ...으로 표시되는부분이다.) 
              currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
              closeText: '닫기',  // 닫기 버튼 패널
              dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
              showAnim: "slide", //애니메이션을 적용한다.  
              showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
              dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
              monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
 
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
	<div>
		<form  id="frm" enctype="multipart/form-data">
		<table class="write1">
			<caption><h2>상영영화등록(담당자 ver)</h2></caption>
			<tr>
				<th width="15%">영화이름</th>
				<td><input type="text" name="mvtitle" id="mvtitle" value="${vo.mvtitle }" readonly></td>
			</tr>
			<tr>
				<th width="5%">영화등급</th>
				<td>
					<select name="mvgrade">
						<option value="ALL" <c:if test="${vo.mvgrade == 'ALL' }"> selected </c:if> >ALL</option>
						<option value="12" <c:if test="${vo.mvgrade == '12' }"> selected </c:if>>12</option>
						<option value="15" <c:if test="${vo.mvgrade == '15' }"> selected </c:if>>15</option>
						<option value="18" <c:if test="${vo.mvgrade == '18' }"> selected </c:if>>18</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="15%">영화포스터</th>
				<td><input type="file" name="file1" id="file1" accept="image/jpg,image/jpeg,image/png"><input type="hidden" name="mvpost" id="mvpost" value="${vo.mvpost }" ></td>
			</tr>
			<tr>
				<th width="15%">영화상영시작</th>
				<td><input type="date" name="startday" id="startday" value="${vo.startday }"></td>
			</tr>
			<tr>
				<th width="15%">영화상영종료</th>
				<td><input type="date" name="lastday" id="lastday" value="${vo.lastday }"></td>
			</tr>
			<th width="15%">영화감독</th>
				<td><input type="text" name="mvdirector" id="mvdirector" value="${vo.mvdirector }"></td>
			</tr>
			<tr>
				<th width="15%">영화장르</th>
				<td><input type="text" name="mvgenre" id="mvgenre" value="${vo.mvgenre }"></td>
			</tr>
			<tr>
				<th width="25%">영화줄거리</th>
				<td><input type="text" name="mvinfo" id="mvinfo" value="${vo.mvinfo }"></td>
			</tr>
			<tr>
				<th width="10%">영화예고편</th>
				<td><input type="file" name="file2" id="file2" accept="video/mp4,video/avi"><input type="hidden" name="mvprev" id="mvprev" value="${vo.mvprev }"></td>
			</tr>
		</table>
		<table class="writetable" cellpadding="5" cellspacing="1">
			<tr>
				<th>
					<button type="button" id="button1">저장</button>
					<button type="reset">다시쓰기</button>
					<button type="button" onclick="location='/adminMovieInfoList.do'">목록으로</button>
				</th>
			</tr>
		</table>
		</form>
	</div>
	</section>
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