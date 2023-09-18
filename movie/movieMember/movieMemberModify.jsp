<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 기본 css -->
<style>
hearder {

}

nav {

}

section {
	width:1200px;
	text-align:center;
/* 	background-color:gray; */
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
}

table.t3 {
	width:900px;
	margin-top:5spx; 
	margin-bottom:5px;
}

table.t3 td {
	text-align:left;
}

table.t3 input,select,textarea {
	width:95%;
}
</style>

<!-- 회원가입 css -->
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
	
	$("#button1").click(function(){
		
	
		if($("#username").val() =="") {
			alert("이름을 입력해주세요.");
			$("#username").focus();
			return false;
		}
		if($("#gender").val() =="") {
			alert("성별을 선택해주세요.");
			$("#gender").focus();
			return false;
		}
		if($("#birth").val() =="") {
			alert("생년월일을 입력해주세요.");
			$("#birth").focus();
			return false;
		}
		if($("#phone1").val() =="") {
			alert("휴대폰 번호를 입력해주세요.");
			$("#phone2").focus();
			return false;
		}
		if($("#phone2").val() =="") {
			alert("휴대폰 번호를 입력해주세요.");
			$("#phone2").focus();
			return false;
		}
		if($("#phone3").val() =="") {
			alert("휴대폰 번호를 입력해주세요.");
			$("#phone2").focus();
			return false;
		}
		if($("#email").val() =="") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if($("#sample6_postcode").val() =="") {
			alert("우편번호를 입력해주세요.");			
			return false;
		}			
		if($("#sample6_detailAddress").val() =="") {
			alert("주소를 입력해주세요.");
			$("#addr2").focus();
			return false;
		} 
		
		var form = $("#frm").serialize();		
						
		$.ajax({
			type:"POST",
			data: form,
			url :"/movieMemberModifySave.do",
			
			datatype:"text",
			success :function(data){
				if(data=="ok"){
					alert("수정 완료");
					location="/movieMain.do";								
				} else {
					alert("수정 실패");
				}
			},error : function() {
				alert("전송실패");
			}
		});
	});
	
});
$(function() {
	
	$("#button2").click(function(){
		location="history.back()"
		});	
	});	
	
function numberMaxLength(e){
	if(e.value.length > e.maxLength) {
		e.value = e.value.slice(0,e.maxLength);
	}
}

$(function() {
	
	$("#button3").click(function(){
		 var url = "/pwCheck.do";
	        window.open(url,"popup","width=600 height=300 top=150 left=300");
		});	
	});	
	
$(function() {
	
	$("#changepw").click(function(){
		 var url = "/changepw.do";
	        window.open(url,"popup","width=600 height=300 top=150 left=300");
		});	
	});

</script>
<script>
$(function(){
	
	$("#agree_all").click(function() {    	
	var len = $("input[name='agree']").length;	/* name 값이 같아야 사용가능 같은name값은 배열로 봄*/
	var bool = true;    	
   	 if($("#agree_all").is(":checked")==false) bool= false; 	/*is함수 체크 여부 jquery함수 자바스크립x*/
   		for(var i=0; i<len; i++) {
   			$("input[name='agree']")[i].checked = bool;
   		}		   	     	
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


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}


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
	<div class="d1"  style="position:absolute; left:50%; transform:translateX(-50%);">

	<header>
		<img src=""> <!-- 광고?? -->
	</header>
	
	<!-- 탑메뉴 -->
	<nav>
		<%@ include file="../../mvinclude/mvnav.jsp" %>
	</nav>
	
	<!-- 내용 -->
	<section>
	<form name="frm" id="frm" method="post" action="memberWriteSave.do">
	<table style="width:1200px; border-top:1px solid black;">
		<tr>
			<th>
				<table class="write1">
				<captin><h1>정보수정</h1></captin>
				<colgroup>
					<col width="17%"/>
					<col width="*"/>		
				</colgroup>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" id="userid" value="${vo.userid }" readonly></td>
				</tr>
				<tr>
				<td>비밀번호</td>
					<td><button type="button" id="changepw" name="changepw">비밀번호 변경</button>
					</td>
				</tr>	
				<tr>
					<td>이름</td>
					<td><input type="text" name="username"  id="username" placeholder="이름을 입력해주세요" value="${vo.username }" readonly></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남<input type="radio" name="gender"  id="gender" value="M" <c:if test="${vo.gender == 'M' }">checked</c:if>>
						여<input type="radio" name="gender"  id="gender" value="F" <c:if test="${vo.gender == 'F' }">checked</c:if>>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" style="width:100px;
		               title="생년월일"
		               name="birth"
		               id="birth" 
		               class="datepicker"
		               autocomplete="off" 
		               value="${vo.birth}">
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>
						<select type="number" name="phonec"  id="phonec" class="phone_in">
							<option <c:if test="${vo.phonec == 'SKT' }">selected</c:if>>SKT</option>
							<option <c:if test="${vo.phonec == 'KT' }">selected</c:if>>KT</option>
							<option <c:if test="${vo.phonec == 'LGU' }">selected</c:if>>LGU+</option>
							<option <c:if test="${vo.phonec == 'SKT알뜰폰' }">selected</c:if>>SKT알뜰폰</option>
							<option <c:if test="${vo.phonec == 'KT알뜰폰' }">selected</c:if>>KT알뜰폰</option>
							<option <c:if test="${vo.phonec == 'LGU알뜰폰' }">selected</c:if>>LGU+알뜰폰</option>
							<option <c:if test="${vo.phonec == 'ETC' }">selected</c:if>>ETC</option>
						</select>
						<select type="number" name="phone1"  id="phone1" class="phone_in">
							<option <c:if test="${vo.phone1 == '010' }">selected</c:if>>010</option>
							<option <c:if test="${vo.phone1 == '011' }">selected</c:if>>011</option>
							<option <c:if test="${vo.phone1 == '016' }">selected</c:if>>016</option>
							<option <c:if test="${vo.phone1 == '017' }">selected</c:if>>017</option>
							<option <c:if test="${vo.phone1 == '018' }">selected</c:if>>018</option>
							<option <c:if test="${vo.phone1 == '019' }">selected</c:if>>019</option>					
						</select>
						<input type="number" name="phone2"  id="phone2" class="phone_in" maxlength="4" oninput="numberMaxLength(this)" value="${vo.phone2 }">
						<input type="number" name="phone3"  id="phone3" class="phone_in" maxlength="4" oninput="numberMaxLength(this)" value="${vo.phone3 }">
					</td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td><input type="email" name="email"  id="email" placeholder="이메일주소를 입력해주세요."  value="${vo.email }"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>			  
				      <input type="text" id="sample6_postcode" placeholder="우편번호" name="postno" autocomplete="off"  style="width:100px;" value="${vo.postno }">
				      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" autocomplete="off"><br>
				      <input type="text" id="sample6_address" placeholder="주소" name="addr1" autocomplete="off" value="${vo.addr1 }"><br>
				      <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" autocomplete="off" value="${vo.addr2 }">
				      <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr3" autocomplete="off" value="${vo.addr3 }">
			      	</td>
				</tr>				
			</table>
			<div style="width:1200px; margin-top:20px; text-align:center;">
				<button type="button" id="button1">수정</button>
				<button type="button" id="button2">이전</button>
				<button type="button" id="button3" class="btn_submit">회원탈퇴</button>
			</div>
		</th>
		</tr>
	</table>
		
	</form>
	</section>
	
	<!-- 광고1 -->
	<aside>
<%-- 		<%@ include file="../mvinclude/mvaside.jsp" %> --%>
	</aside>
	
	<!-- 광고2 -->
	<article>
<%-- 		<%@ include file="../mvinclude/mvarticle.jsp" %> --%>
	</article>
	
	<!-- 하단메뉴 -->
	<footer>
		<%@ include file="../../mvinclude/mvfooter.jsp" %>
	</footer>
</div>
</body>
</html>