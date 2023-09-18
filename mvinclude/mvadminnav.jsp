<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var = "s_userid" value="${sessionScope.SessionAdminID }"/>
<script>
function fn_logout(){
	$.ajax({
		type : "post",
		data : "",
		url : "/adminLogout.do",
		
		datatype:"text",
		success:function(data){		//function(data) : data 값을 전달받음
			if(data=="1"){
				alert("로그아웃 되었습니다.");
				location="/adminMain.do"
				 }
		         },

			error : function(){
				alert("전송실패");
			}
	});
}
</script>
<!DOCTYPE html>
<div class="d1">
		<table style="width:1200px;">
			<tr color="black">
				<td width="25%" align="left" style="position:relative; bottom:30px; font-size:14px;">	
					&nbsp;<a href="https://ko-kr.facebook.com/"><img class="link1" src="../mvimages/facebook.png">페이스북</a>
						  &nbsp;
						  <a href="https://www.youtube.com/"><img class="link1" src="../mvimages/youtube.png">유튜브</a> 
						  &nbsp;
						  <a href="https://www.instagram.com/"><img class="link1" src="../mvimages/instagram.png">인스타그램</a>
				</td>
				<th width="*">
					<a href="/adminMain.do"><img src="../mvimages/lattecinema.png"></a>
				</th>
				<td  width="25%" align="right" style="position:relative; bottom:30px; font-size:14px;">
					<c:if test="${s_userid==null }">
					<a href="/adminLogin.do">관리자로그인</a>
					</c:if>
					<c:if test="${s_userid!=null }">
					<a href="javascript:fn_logout()"><b>로그아웃</b></a>
					</c:if>
				</td>
			</tr>
		</table>
		<table class="mainmenu2">
			<tr>
				<td width="25%"></td>
				<th width="*" style="font-size:20px; border-top:1px solid black;">
				<c:if test="${s_userid=='root' }">
					<a href="/adminMovieInfoWrite.do">영화등록</a> <font size=2>|</font> 
				</c:if>
				<c:if test="${!empty s_userid}">
					<a href="/adminMovieInfoList.do">영화리스트</a> <font size=2>|</font>
				</c:if>
				<c:if test="${!empty s_userid && s_userid ne 'root'}">
					<a href="/adminMovieScheduleList.do">스케줄리스트</a> <font size=2>|</font> 
				</c:if>
				<c:if test="${s_userid == 'root'}">
					<a href="/adminStoreWrite.do">상품등록</a><font size=2> | </font>
				</c:if>
				<c:if test="${s_userid == 'root'}">
					<a href="/adminStore.do">상품리스트</a>
				</c:if>	
				<c:if test="${empty s_userid}">
					관리자 로그인시 메뉴가 활성화됩니다.<font size=2></font>
				</c:if>	
				</th>
				<td width="25%" align="right" style="font-size:14px;">
				<c:if test="${s_userid=='root'}">
					<a href="adminList.do"><img class="link1" src="../mvimages/member.png">직원목록</a>&nbsp;
				</c:if>
				<c:if test="${s_userid=='root'}">
					<a href="memberList.do"><img class="link1" src="../mvimages/member.png">회원목록</a>&nbsp;
				</c:if>
				<c:if test="${s_userid=='root'}">
					<a href="/adminMemberWrite.do"><img class="link1" src="../mvimages/member.png">직원등록</a>&nbsp;
				</c:if>
				<c:if test="${!empty s_userid && s_userid ne 'root'}">
					<a href="/adminTheaterWrite.do">상영관등록</a>
				</c:if>	
				</td>
			</tr>
		</table>
		</div>