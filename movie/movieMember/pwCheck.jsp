<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴 비밀번호 확인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
</head>

<style>
body { font-size:15px; }

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
		let userid = $("#userid").val();
	
		
		if(userpw == "") {
			swal("비밀번호를 입력해주세요.","","error");
			$("#userpw").focus();
			return false;
		}
		
		let datas = {"userid": userid,"userpw":userpw};
		
		$.ajax({
			url  : "/pwCheckSub.do",
			type : "post",
			data : datas,
			
			datatype : "text",
			success : function(data) {
				if( data == "4" ) {					
					swal("비밀번호가 일치하지 않습니다.","","error");
					$("#userpw").focus();
				} else if(data =="ok"){
					alert("회원 탈퇴 완료");
					window.close();	
					window.opener.document.location.href="logout.do";
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
	회원님의 정보보호를 위한 확인 절차 입니다.<br>
	비밀번호를 입력해 주세요. <br> <br>
	
	<div id="pw_area"> 비밀번호 <input type="password" name="userpw" id="userpw"> </div>
	 <br>	
	<div id="button_area">
		 <button type="submit" id="btn_pw" onclick="return false;">회원 탈퇴</button>
		 <button type="reset" id="btn_cancel">취소</button>
		<input type="hidden" id="userid" name="userid" value=" ${sessionScope.SessionUserID }">
    </div>    
    
</div>

</body>
</html>