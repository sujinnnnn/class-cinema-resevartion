<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

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
   
   $("#button1").click(function(){
      
      if($("#adminid").val() =="") {
            alert("아이디를 입력해주세요!");
              $("#adminid").focus();
            return false;
      }
       if($("#userpw").val() =="") {
            alert("비빌번호를 입력해주세요!");
            $("#userpw").focus();
            return false;
      }
       if($("#checkpw").val() =="") {
            alert("비밀번호를 다시한번 입력해주세요!");
            $("#checkpw").focus();
            return false;
      } 
       if($("#branch").val() =="") {
            alert("영업점을 입력해주세요!");
            $("#branch").focus();
            return false;
      } 
      
       var form = new FormData(document.getElementById('frm'));     
         
         $.ajax({
            type:"POST",
            data: form,
            url :"/adminMemberWriteSave.do",
            processData: false, // 파일이 전송되는 경우의 설정
            contentType: false, // 파일이 전송되는 경우의 설정
            
            datatype:"text",
            success :function(data){
               if(data=="ok"){
                  alert("등록 완료");
                  location="/adminList.do";                        
               } else {
                  alert("등록 실패");
               }
            },error : function() {
               alert("에러");
            }
         });
      });
      
   });
$(function() {
   
   $("#button3").click(function(){
      location="/adminMain.do"
      });
   });   
   
$(function() {
      
      $("#button2").click(function(){
         location="/adminList.do"
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
<fieldset>
<legend>[ 관리자 등록 ]</legend>
<form name="frm" id="frm" enctype="multipart/form-data">
   <table class="write1">
   <colgroup>
      <col width="17%"/>
      <col width="*"/>      
   </colgroup>
      <tr>
         <td>아이디</td>
         <td><input type="text" name="adminid" id="adminid" placeholder="한글 또는 영문으로 입력해주세요." maxlength="13" autofocus></td>
      </td>
      <tr>
         <td rowspan="2">비밀번호</td>
         <td  style="border-bottom:none;"><input type="password" name="adminpw"  id="adminpw" placeholder="비밀번호를 입력해주세요"></td>         
      </tr>
      <tr>         
         <td><input type="password" name="checkpw" id="checkpw" placeholder="입력하신 비밀번호를 다시 한번 입력해주세요"></td>
      </tr>
      <tr>
         <td>영업점</td>
         <td><input type="text" name="branch" id="branch" placeholder="영업점을 입력해주세요. EX)서울점"></td>
      </tr>
      <tr>
         <td>사진</td>
         <td><input type="file" name="file1" id="file1" accept="image/jpg,image/jpeg,image/png"><input type="hidden" name="adminpic" id="adminpic"></td>
      </td>
      <tr>
         <td>주소</td>
         <td>        
            <input type="text" id="sample6_postcode" placeholder="우편번호" name="postno" autocomplete="off"  style="width:100px;">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" autocomplete="off"><br>
            <input type="text" id="sample6_address" placeholder="주소" name="addr1" autocomplete="off"><br>
            <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" autocomplete="off">
            <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr3" autocomplete="off">
         </td>
      </td>
      <tr>
         <td>전화번호</td>
         <td><input type="text" name="adminphone" id="adminphone" placeholder="000-000-000형식으로 입력해주세요" maxlength="13" autofocus></td>
      </td>
      
   
      </table>
      
   
      <button type="button" id="button1" >저장</button>
      <button type="button" id="button2" >직원목록으로</button>
      <button type="button" id="button3" >메인으로</button>
   </div>
</fieldset>
</form> 

</body>
</html>