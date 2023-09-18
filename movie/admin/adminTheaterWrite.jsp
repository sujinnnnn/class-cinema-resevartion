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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 관리</title>
      <link rel="stylesheet" href="../../css/adminStyle.css">
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



.board1 textarea {
   width:500px;
   height:200px;
   font-size:12px;
   color:#555555;
   font-family:맑은고딕;
}
</style>

 <script>
var id = $("#id").val();
 function fn_action(no,branch,theater,seats,useyn) { // 수정 처리
      
      $("#branch").val(branch); 
      $("#theater").val(theater);
      $("#seats").val(seats);
      $("#no").val(no);   
      $("#submit_button").text("수정");
      if(useyn == "Y"){
         $("#useyn").val("Y").prop("selected",true); // 값이 Y면 useyn이 Y가 selected 
      } else {
         $("#useyn").val("N").prop("selected",true);
      }
   }


function fn_delete(no,id,theater,branch) {
confirm = confirm("삭제하시겠습니까?");
 if(confirm == false) {
    location="/adminTheater.do";
 } else if(confirm == true) {    
    
    var sendData = "no="+no+"&theater="+theater+"&branch="+branch;

   $.ajax({
      type: "post",
      url : "theaterDelete.do",
      data: sendData,
      
      datatype:"text",
      success :function(data){
         if(data=="ok"){   
            alert("삭제완료");
            location="/adminTheaterWrite.do";
         } else if(data=="ok2"){
            alert("삭제 완료");
            location="/adminTheaterWrite.do";
         } else if(data=="4"){
            alert("상영중인 스케줄이 있습니다.");
            location="/adminTheaterWrite.do";
         } else {
            alert("삭제실패");
         }
      },error : function() {
         alert("전송실패");
      }   
      
   });
 }
} 

$(function(){
   $("#submit_button").click(function(){
      
      let branch     = $.trim($("#branch").val());
      let theater  = $.trim($("#theater").val());
      let seats     = $.trim($("#seats").val());
      let no       = $("#no").val();
      let useyn     = $("#useyn").val();      
      
      if(branch == "" ) {
         alert("영업점을 입력해주세요.");
         $("#branch").focus();
         return false;
      }
      if(theater == "" ) {
         alert("상영관이름을 입력해주세요.");
         $("#theater").focus();
         return false;
      }
      if(seats == "" ) {
         alert("좌석수를 입력해주세요.");
         $("#seats").focus();
         return false;
      }
      
      let form = $("#frm").serialize();
      
      $.ajax({
         type: "post",
         url : "adminTheaterRegister.do",
         data: form,
            /* {"branch":branch,"no":no,"theater":theater,"seats":seats,"useyn":useyn,"id":id}, */
         
         datatype:"text",
         success :function(data){
            if(data=="ok"){               
               location="/adminTheaterWrite.do";
            } else {
               alert("저장실패");
            }
         },error : function() {
            alert("전송실패");
         }   
         
      });
   });
});

</script>

<body>

<div class="d1" style="position:absolute; left:50%; transform:translateX(-50%);">
   <nav>
      <%@ include file="../../mvinclude/mvadminnav.jsp" %> 
   </nav>
   
로그인 아이디 : ${sessionScope.SessionAdminID }&nbsp;&nbsp;
${vo.branch }
<section>
   <!-- 섹션 S -->

   <!-- 섹션 E -->
</section>

<div class="content_area">

<form id="frm"> 
   <input type="hidden" id="id" name="id" value="${sessionScope.SessionAdminID }">   
   <input type="hidden" name="no" id="no">
   <table class="board1" align="center">
      <colgroup>
         <col width="20%"/>
         <col width="*"/>
      </colgroup>      
      <tr>      
         <th>영화관 정보 등록</th>         
         <td>
            <input type="text" name="branch" id="branch" style="width:50px;" readonly placeholder="영업점"  value="${vo.branch }">
            <input type="text" name="theater" id="theater" style="width:150px;" placeholder="상영관이름 ex)1관">
            <input type="text" name="seats" id="seats" style="width:50px;" placeholder="좌석수">
            <select name="useyn" id="useyn">
               <option value="Y"  selected>사용</option>
               <option value="N">미사용</option>
            </select>            
            <button type="submit" id="submit_button" onclick="return false;">저장</button>
            <button type="button" onclick="location='/adminTheater.do'" class="button2">새로고침</button>
         </td>
      </tr>

   </table>
</form>
</div>

<div class="page_number_area" style="margin-top:30px;">
   <table class="board1" align="center">
      <tr>
         <th width="10%%">번호</th>
         <th width="*%">영업점</th>
         <th width="30%">상영관</th>
         <th width="10%">좌석수</th>
         <th width="10%">사용여부</th>
         <th width="10%">옵션</th>
      </tr>
      <c:forEach var="list" items="${list }"> <!-- items 실제 데이터값 -->
      <tr align="center">
         <td><input type="text" name="no" id="no" value="${list.no }" style="width:30px; text-align:right;"></td>
         <td><a href="javascript:fn_action('${list.no }','${list.branch }','${list.theater }','${list.seats }','${list.useyn }')">${list.branch }</a></td>
         <td>${list.theater }</td>
         <td>${list.seats }</td>
         <td>
            <c:if test="${list.useyn=='Y' }">사용</c:if>
            <c:if test="${list.useyn=='N' }">미사용</c:if>
         </td>
         <td><a href="javascript:fn_delete('${list.no }','${sessionScope.SessionAdminID }','${list.theater }','${list.branch }')"> DEL </a></td>
      </tr>
      </c:forEach>
   </table>
</div>

<div style="height:100px; width:750px; text-align:right; margin-top:10px;">
   <!-- <button type="button" id="fn_nochange()">출력 순서 변경</button> -->
</div>

<div>
   <button type="button" onclick="location='adminMain.do'">관리자메인으로 이동</button>
</div>
</div>


</body>
</html>