<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	   
	   $("#userid").keyup(function(){ //keypress 함수o 
	      
	      var userid = $("#userid").val();
	      var result = 0;
	   
	      if( userid.length >=3 && userid.length <= 12){
	         result = fn_userid(userid);
	      }
	      $("#id_usable").val("N");
	      if(result == 0){
	         msg  = "<font color='red'> 아이디는 3~12자 사이로 해주세요</font>";
	      } else if(result == 1){
	         msg  = "<font color='green'> 사용가능한 아이디입니다</font>";
	         $("#id_usable").val("Y"); // id_usable 값에 Y를 넣는다
	      } else if(result == 2){
	         msg  = "<font color='red'>이미 사용중인 아이디입니다</font>";
	      } else if(result == 3){
	         msg  = "<font color='red'>형식에 맞지 않는 아이디입니다.</font>";
	      }
	      $("#msg_userid").html(msg); //text:html을 인식 못함
	   });
	   
	   $("#button1").click(function(){
	      
	      var userid     = $.trim($("#userid").val());
	      var userpw     = $.trim($("#userpw").val());
	      var checkpw  = $.trim($("#checkpw").val());
	      var username = $.trim($("#username").val());
	      var gender     = $.trim($("#gender").val());
	      var birth     = $.trim($("#birth").val());
	      var phone1     = $.trim($("#phone1").val());
	      var phone2     = $.trim($("#phone2").val());
	      var phone3     = $.trim($("#phone3").val());
	      var email     = $.trim($("#email").val());
	      var sample6_postcode       = $.trim($("#sample6_postcode").val());
	      var sample6_detailAddress = $.trim($("#sample6_detailAddress").val());
	      var id_usable= $("#id_usable").val();
	      
	      if(id_usable == "N") {
	         alert("아이디를 확인해주세요");
	         $("#id_usable").focus();
	         return false;
	      }
	      
	      if(userid =="") {
	         alert("아이디를 입력해주세요.");
	         $("#userid").focus();
	         return false;
	      }
	       if(userpw =="") {
	         alert("비빌번호를 입력해주세요.");
	         $("#userpw").focus();
	         return false;
	      }       
	       if( userpw != checkpw) {
	         swal("암호가 일치하지 않습니다.")
	         $("#checkpw").focus();
	         return false;
	         }       
	      if(username =="") {
	         alert("이름을 입력해주세요.");
	         $("#username").focus();
	         return false;
	      }
	      if(gender =="") {
	         alert("성별을 선택해주세요.");
	         $("#gender").focus();
	         return false;
	      }
	      if(birth =="") {
	         alert("생년월일을 입력해주세요.");
	         $("#birth").focus();
	         return false;
	      }
	      if(phone1 =="") {
	         alert("휴대폰 번호를 입력해주세요.");
	         $("#phone1").focus();
	         return false;
	      }
	      if(phone2 =="") {
	         alert("휴대폰 번호를 입력해주세요.");
	         $("#phone2").focus();
	         return false;
	      }
	      if(phone3 =="") {
	         alert("휴대폰 번호를 입력해주세요.");
	         $("#phone2").focus();
	         return false;
	      }
	      if(email =="") {
	         alert("이메일을 입력해주세요.");
	         $("#email").focus();
	         return false;
	      }
	      if(sample6_postcode =="") {
	         alert("우편번호를 입력해주세요.");
	         $("#sample6_postcode").focus();
	         return false;
	      }         
	      if(sample6_detailAddress =="") {
	         alert("주소를 입력해주세요.");
	         $("#sample6_detailAddress").focus();
	         return false;
	      } 
	      
	      var form = $("#frm").serialize();      
	                  
	      $.ajax({
	         type: "POST",
	         url : "/movieMemberWriteSave.do", //저장처리되는 경로
	         data: form,         
	         datatype: "json",
	         success :function(data){            
	            if(data=="1"){
	               alert("가입완료");
	               location="/movieMain.do";
	            } else if(data=="2"){
	               alert("사용중인 아이디입니다.");               
	            } else if(data=="5"){
	               alert("비밀번호가 형식에 맞지 않습니다.")
	            } else {            
	               alert("가입실패");
	            }
	         },error : function() {
	            alert("전송실패");
	         }
	      });
	   });
	   
	});

	$(function() {
	   
	   $("#button2").click(function(){
	      history.back()
	      });
	   });   
	   
	function numberMaxLength(e){
	   if(e.value.length > e.maxLength) {
	      e.value = e.value.slice(0,e.maxLength);
	   }
	}
	function fn_userid(userid) {
	   
	   var result = "";   
	   $.ajax({
	      type: "POST",
	      url : "/movieUserIdCheck.do", //저장처리되는 경로
	      data: "userid="+userid,      
	      async:false,   // 비동기방식을 동기방식으로 전환
	                  // 비동기방식 return x
	      datatype: "TEXT",      
	      success :function(data){
	         // ex) 1 : 사용가능  ,2 : 이미 사용중   
	         result = data;
	         
	      },error : function() {         
	         //return "2";
	      }
	      
	   });      
	   return result;
	   
	}

	</script>

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
              stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
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
				<captin><h1>회원가입</h1></captin>
				<colgroup>
					<col width="17%"/>
					<col width="*"/>		
				</colgroup>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요." maxlength="10"><span id="msg_userid"></span></td>
				</td>
				<tr>
					<td rowspan="2">비밀번호</td>
					<td  style="border-bottom:none;"><input type="password" name="userpw"  id="userpw" placeholder="비밀번호를 입력해주세요"></td>			
				</tr>
				<tr>			
					<td><input type="password" name="checkpw" id="checkpw" placeholder="입력하신 비밀번호를 다시 한번 입력해주세요"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="username"  id="username" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남<input type="radio" name="gender"  id="gender" value="M">
						여<input type="radio" name="gender"  id="gender" value="W">
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
		               value="">
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>
						<select type="number" name="phonec"  id="phonec" class="phone_in">
							<option>SKT</option>
							<option>KT</option>
							<option>LGU+</option>
							<option>SKT알뜰폰</option>
							<option>KT알뜰폰</option>
							<option>LGU+알뜰폰</option>
							<option>ETC</option>
						</select>
						<select type="number" name="phone1"  id="phone1" class="phone_in">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>					
						</select>
						<input type="number" name="phone2"  id="phone2" class="phone_in" maxlength="4" oninput="numberMaxLength(this)">
						<input type="number" name="phone3"  id="phone3" class="phone_in" maxlength="4" oninput="numberMaxLength(this)">
					</td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td><input type="email" name="email"  id="email" placeholder="이메일주소를 입력해주세요."></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>			  
				      <input type="text" id="sample6_postcode" placeholder="우편번호" name="postno" autocomplete="off"  style="width:100px;">
				      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" autocomplete="off"><br>
				      <input type="text" id="sample6_address" placeholder="주소" name="addr1" autocomplete="off"><br>
				      <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" autocomplete="off">
				      <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr3" autocomplete="off">
				      </td>
				</tr>				
			</table>
			<div style="width:1200px; margin-top:20px; text-align:center;">
				<button type="button" id="button1">저장</button>
				<button type="reset">취소</button>
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