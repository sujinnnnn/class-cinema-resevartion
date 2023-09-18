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
<title>영화스케줄목록</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>

   body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }

  section {
    background-color: white;
    width: 800px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ddd;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
  }

  h2 {
    margin: 0;
    padding-bottom: 10px;
    border-bottom: 1px solid #ddd;
  }

  table {
  background-color: white;
    width: 100%;
    margin-top: 20px;
    margin-bottom: 20px;
    border-collapse: collapse;
  }

  th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  select, input[type="text"], input[type="date"], input[type="file"] {
    width: 98%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
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

  button:hover {
    background-color: darkred;
  }

  a {
    text-decoration: none;
    color: #007bff;
  }

  a:hover {
    text-decoration: underline;
  }


</style>
<script>
function fn_delete(unq) {
	  const userConfirmation = confirm("정말로 삭제하시겠습니까?");
	  if (userConfirmation) {
	    location= "/adminMovieScheduleDelete.do?unq="+unq;
	  } else {
		  return false;
	  }
	}

function btn_title(mvtitle) {   
	   location="/adminMovieScheduleList2.do?mvtitle="+mvtitle;
	}

</script>
<body>

<section style="background-color:white; width:1200px; height:1000px; text-align:center;">
로그인 아이디 : ${sessionScope.SessionAdminID }

<form id="frm">
<table border="1">	
	<colgroup>
		<col width="*">
		<col width="15%">
		<col width="10%">
		<col width="20%">
		<col width="15%">
		<col width="10%">
	</colgroup>
	<tr>
		<th>영화제목</th>
		<th>영업점</th>
		<th>상영관</th>
		<th>상영날짜</th>
		<th>상영시간</th>
<!-- 		<th>수정</th> -->
		<th>삭제</th>
	</tr>
	<div style="text-align:left;">
	<c:forEach var="title2" items="${title}">	
			<button type="button" onclick="btn_title('${title2.mvtitle}')">${title2.mvtitle }</button>		
	</c:forEach>
	</div>
	<c:forEach var="result2" items="${resultList2}">
					<input type="hidden" name="unq" id="unq" value="${result2.unq }">
					<tr>
						<td>${result2.mvtitle }</td>
						<td>${result2.mvlocation}</td>
						<td>${result2.mvroom}</td>
						<td>${result2.mvdate}</td>
						<td>${result2.mvschedule}</td>
						<%-- <td><button type="button" onclick="location='/adminMovieScheduleModify.do?unq=${result2.unq }'">수정</button></td> --%>
						<td><button type="button" onclick="fn_delete('${result2.unq }')">삭제</button></td>
					</tr>
				</c:forEach>
	
</table>
<div>
<button type="button" onclick="location='adminMovieInfoList.do'">상영영화 리스트로 이동</button>
<button type="button" onclick="location='adminMain.do'">메인으로 이동</button>
</div>
</from>
</body>
</section>
</html>