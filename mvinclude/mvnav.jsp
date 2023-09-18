<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var = "s_userid" value="${sessionScope.SessionUserID }"/>
<!DOCTYPE html>
<script>
function fn_logout(){
	$.ajax({
		type : "post",
		data : "",
		url : "/logout.do",
		
		datatype:"text",
		success:function(data){		//function(data) : data 값을 전달받음
			if(data=="1"){
				alert("로그아웃 되었습니다.");
				location="/"
				 }
		         },

			error : function(){
				alert("전송실패");
			}
	});
}
</script>
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
					<a href="/movieMain.do"><img src="../mvimages/lattecinema.png"></a>
				</th>
				<td  width="25%" align="right" style="position:relative; bottom:30px; font-size:14px;">
					<c:if test="${s_userid==null }">
					<a href="/memberLogin.do">로그인</a>
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
					<a href="/ticketingSchedule.do">예매</a> <font size=2>|</font> 
					<a href="/movieMain.do">영화</a> <font size=2>|</font> 
					<a href="/branchInfo.do">영화관</a> <font size=2>|</font> 
					<a href="/store.do">스토어</a>
				</th>
				<td width="25%" align="right" style="font-size:14px;">
				<c:if test="${s_userid!=null }">
				<a href="/myPageList.do">예매내역</a>&nbsp;
				<a href="/movieMemberModify.do"><img class="link1" src="../mvimages/member.png">회원수정</a>&nbsp;
				</c:if>
				<c:if test="${s_userid==null }">
					<a href="/memberJoinWrite.do"><img class="link1" src="../mvimages/member.png">회원가입</a>
					&nbsp;
				</c:if>
					<a href="/ticketingSchedule.do"><img class="link1" src="../mvimages/ticket.png">바로예매</a> <a href="#">〓</a>
				</td>
			</tr>
		</table>
		</div>