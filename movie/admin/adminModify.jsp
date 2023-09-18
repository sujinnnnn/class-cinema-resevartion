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
<title>관리자 수정하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> <!-- jquery 연결 -->
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<script>

$(function(){
   
   $("#button1").click(function(){
      var adminid = $.trim($("#adminid").val());
      var adminpw   = $.trim($("#adminpw").val());
      var branch   = $.trim($("#branch").val());

      adminid  = adminid.replace(" ","");
      adminpw   = adminpw.replace(" ",""); /// 12 33
      branch     = branch.replace(" ","");
      
      $("#adminid").val(adminid);
      $("#adminpw").val(adminpw);
      $("#branch").val(branch);
      
      

      if( adminid.length < 2 || adminid.length > 13 ) {
         alert("아이디는 2~13자로 입력해주세요.");
         $("#adminid").focus();
         return false;
      }
      if( adminpw.length < 4 || adminpw.length > 20 ) {
         alert("암호는 4~20자로 입력해주세요.");
         $("#adminpw").focus();
         return false;
      }
      if( branch == "" ) {
         alert("영업점 입력해주세요.");
         $("#branch").focus();
         return false;
      }

            
      var form = $("#frm").serialize();
      
      $.ajax({  
         type : "POST",
         data : form,
         url  : "/adminModifySave.do",
         
         datatype:"text", //json 형식도 있음
         success :function(data){
            
            if(data=="ok"){
               alert("수정완료");
               location="/adminList.do";
               
               window.opener.location.reload();
               window.close();
               
               
            } else if(data == "fail") {
               alert("암호가 일치하지 않습니다.");
            }
         },error : function() {
            alert("전송실패");
         }
      });
   });
   
});

   
      
</script>
<body>

<form name="frm" id="frm">

<table border="0" width="350">
   <tr>
      <th>아이디</th>
      <td><input type="text" name="adminid" id="adminid" value="${vo.adminid}" readonly></td>
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" name="adminpw" id="adminpw" value="${vo.adminpw }"></td>
   </tr>
   <tr>
      <th>영업점</th>
      <td><input type="text" name="branch" id="branch" value="${vo.branch }"></td>
   </tr>
</table>
<div style="width:600px; margin-top:5px;">
   <button type="button" id="button1">저장</button>
   <button type="reset">취소</button>
</div>
</form>
</body>
</html>