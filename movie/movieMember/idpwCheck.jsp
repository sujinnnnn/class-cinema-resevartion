<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>(아이디/패스워드)찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>



<script>
$(function(){ 	
	$("#idpw1").click(function(){
		$("#id_area").css('display','none');
	});
	$("#idpw2").click(function(){
		$("#id_area").css('display','block');
	});
	
	$("#button1").click(function(){
		
		let userid   = $.trim($("#userid").val());
		let email 	 = $.trim($("#email").val());
		
		if( $("#idpw1").is(":checked") == false &&
			$("#idpw2").is(":checked") == false ) {
			alert("아이디 또는 패스워드를 체크해주세요.");
			return false;
		}
		if ( $("#idpw2").is(":checked") == true ) { // 패스워드찾기를 선택했을 경우
			if(userid == "") {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
		}
		if(email == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		
		let datas = {"userid":userid,"email":email};
		$.ajax({
			url  : "/idpwCheckSub.do",
			type : "post",
			data : datas,
			
			datatype : "text",
			success : function(data) {
				if( data == "4" ) {
					alert("정보가 일치하지 않습니다.");
					$("#email").focus();
				} else {
					$("#result_text").html("<font color='red'><b>"+data+"</b></font>");
				}
			},
			error : function() {
				 alert("전송실패");
			}
		});
	});
});
</script>

<style>
body { font-size:12px; }

#wrap {
	width:100%px;
	height:290px;
	padding:5px;
	border:1px solid #cccccc;
}
#id_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#nick_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#email_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#radio_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#button_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
#result_area {
	width:94%;
	padding:6px;
	margin-bottom:3px;
}
</style>


<body>
<div id="wrap">
	<div id="id_area"> 아이디 <input type="text" name="userid" id="userid"> </div>
	<div id="email_area"> 이메일 <input type="text" name="email" id="email"> </div>
	<div id="radio_area">
		<input type="radio" name="idpw" value="1" id="idpw1"> 아이디찾기 /  
	 	<input type="radio" name="idpw" value="2" id="idpw2"> 패스워드찾기
	</div>
	<div id="button_area">
		 <button type="submit" id="button1" onclick="return false;">전송</button>
		 <button type="reset">취소</button>
    </div>
    <div id="result_area">결과 : <span id="result_text"></span> </div>
    
</div>

</body>
</html>