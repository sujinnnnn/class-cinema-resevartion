<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
</head>

<style>
body { font-size:12px; }

#wrap {
	width:100%px;
	height:290px;
	padding:5px;
	border:1px solid #cccccc;
}
#pw_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#button_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
	text-align:center;
}

input[type="password"] {
    width: 250px; /*가로크기*/
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
 #btn_pw { 
   display: block;
   width: 80px;
   padding: 5px;
   background-color: #FA5858;
   color: #FFF;
   border: 1px solid #FA5858;
   border-radius: 3px;
   cursor: pointer;
   float:left;
   margin-left:10px;
 }
  #btn_cancel { 
   display: block;
   width: 80px;
   padding: 5px;
   background-color: #FFF;
   color: #FA5858;
   border: 1px solid #FA5858;
   border-radius: 3px;
   cursor: pointer; 
   float:left;
   margin-left:10px;
 }
 swal{
 	width:100px;
 	height:70px;
 }
</style>

<script>
$(function(){ 
	
	$("#btn_pw").click(function(){
		
		let userpw = $.trim($("#userpw").val());	
		let npw1   = $.trim($("#npw1").val());	
		let npw2   = $.trim($("#npw2").val());	
		let userid = $("#userid").val();
	
		
		if(userpw == "") {
			alert("현재 비밀번호를 입력해주세요.");
			$("#userpw").focus();
			return false;
		}
		if(npw1 == "") {
			alert("새로운 비밀번호를 입력해주세요.");
			$("#npw1").focus();
			return false;
		}
		if(npw2 == "") {
			alert("새로운 비밀번호 확인을 입력해주세요.");
			$("#npw2").focus();
			return false;
		}
		if( npw1 != npw2) {
			alert("새로운 암호와 암호 확인이 일치하지 않습니다.")
			$("#npw2").focus();
			return false;
			}	
		
		let datas = {"userid": userid,"userpw":userpw,"npw1":npw1};
		
		$.ajax({
			url  : "/changepwSub.do",
			type : "post",
			data : datas,
			
			datatype : "text",
			success : function(data) {
				if( data == "4" ) {					
					alert("현재 비밀번호가 일치하지 않습니다.");
					$("#userpw").focus();
				} else if(data =="ok"){
					alert("비밀번호 변경 완료");
					window.close();						
					window.opener.document.location.href="movieMain.do";					
				} 
			},
			error : function() {
				 alert("전송실패");
			}
		});	
	});
	
	$("#btn_cancel").click(function(){
		window.close();
	});
});
</script>




<body>
<div id="wrap">
 <br>
	<span style="font-size:15px;">비밀번호 변경</span> <br> <br>
	
	<div id="pw_area"> 
	<table>
	<colgrup>
		<col width="25%">
		<col width="*%">
	<tr>
		<td>현재 비밀번호</td>
		<td><input type="password" name="userpw" id="userpw"> </td>
	</tr>
	<tr>
		<td>새로운 비밀번호</td>
		<td><input type="password" name="npw1" id="npw1"> </td>
	</tr>
	<tr>
		<td>새로운 비밀번호 확인</td>
		<td><input type="password" name="npw2" id="npw2"> </td>
	</tr>		
	</table>
	</div>
	 <br>	
	<div id="button_area">
		 <button type="submit" id="btn_pw" onclick="return false;">변경</button>
		 <button type="reset" id="btn_cancel">취소</button>
		<input type="hidden" id="userid" name="userid" value=" ${sessionScope.SessionUserID }">
    </div>    
    
</div>

</body>
</html>