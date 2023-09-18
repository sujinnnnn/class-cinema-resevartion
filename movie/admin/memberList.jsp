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
<title>회원 목록</title>
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
  
  .table1 th, .table1 td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .bb:hover{
  	background-color:lightsalmon;  	
  }
  .aa:hover {
  	background-color:white;
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
	width:100px;
	height:35px;
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

function fn_action(userid,state) { // 수정 처리
		
		$("#userid1").val(userid); 		
		$("#submit_button").text("수정");
		if(state == "1"){
			$("#state1").val("1").prop("selected",true); // 값이 Y면 useyn이 Y가 selected 
		} else if(state=="2") {
			$("#state1").val("2").prop("selected",true);
		} else {
			$("#state1").val("3").prop("selected",true);
		}
	}
	
$(function(){
	$("#submit_button").click(function(){
		
		let userid 	 = $.trim($("#userid1").val());		
		let state 	 = $("#state1").val();		
		
		if(userid == "" ) {
			alert("아이디를 확인해주세요.");
			$("#userid1").focus();
			return false;
		}	
		
		let datas = {"userid": userid,"state":state};
		
		$.ajax({
			type: "post",
			url : "memberStateModify.do",
			data: datas,
				
			datatype:"text",
			success :function(data){
				if(data=="ok"){	
					alert("아이디 "+userid+" "+"이 변경되었습니다.")
					location="/memberList.do";
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
<!-- 탑메뉴 -->
	<nav>
		<%@ include file="../../mvinclude/mvadminnav.jsp" %> 
	</nav>
   
<div class="header">   
   <h1 class="title">회원 목록</h1>
</div>

<div class="list">
<form name="searchFrm" id="searchFrm"  method="post" action="/memberList.do">
		<input type="hidden" name="pageIndex" id="pageIndex" value="1">
		<select name="searchCondition">
			<option value="userid" 
				<c:if test="${MovieMemberVO.searchCondition=='userid' }">selected</c:if>>아이디</option>			
		</select>
		<input type="text" name="searchKeyword" value="${MovieMemberVO.searchKeyword }" placeholder="아이디를 입력하세요." style="width:200px;">
		<button type="submit" class="button1" >검색</button>
		
	</form>
</div>

<div class="list">
<form id="frm">
<table align="center" style="width:700px;">
	<tr>
		<td>
			<input type="text" name="userid1" id="userid1" style="width:200px;" readonly placeholder="아이디"  >			
			<select name="state1" id="state1">
				<option value="1"  selected>정상</option>
				<option value="2">정지</option>
				<option value="3">탈퇴</option>
			</select>				
			<button type="submit" id="submit_button" onclick="return false;" class="button2">수정</button>
			
		</td>
	</tr>
</table>
</form>

</div>


<div class="list2">
<table class="table1" align="center" style="width:700px;">
<colgroup>
	<col width="40%">
	<col width="30%">
	<col width="30%">
</colgroup>
   <tr class="aa">
      <th>아이디</th>
      <th>이름</th>
      <th>상태</th>
   </tr>
   <c:forEach var="list" items="${resultList}" varStatus="status">
   <tr class="bb">
   	  
      <td><a href="javascript:fn_action('${list.userid }','${list.state }')">${list.userid }</a></td>
      <td>${list.username }</td>     
      <td>
       <c:if test="${list.state=='1'}">
          <span><font color="black">정상</font></span>
       </c:if> 
       <c:if test="${list.state=='2' }">
          <span><font color="red">정지</font></span>
       </c:if> 
       <c:if test="${list.state=='3' }">
          <span><font color="blue">탈퇴</font></span>
       </c:if>  
       </td>            
   </tr>
   </c:forEach>
</table>
</div>
<div style="width:600px; text-align:center; margin-top:10px; margin-left:310px;">

	<c:set var="page" value="${pageIndex3}" />
		<c:forEach var="i" begin="1" end="${movieMemberVO.lastPage3}">
		    <c:choose>
		        <c:when test="${i == page}">
		            <a href="/memberList.do?pageIndex3=${i}" style="color: blue; font-weight: bold; font-size:19px;">${i}</a>
		        </c:when>
		        <c:otherwise>
		            <a href="/memberList.do?pageIndex3=${i}">${i}</a>
		        </c:otherwise>
		    </c:choose>
		</c:forEach>

</div>
</div>
   
</body>
</html>