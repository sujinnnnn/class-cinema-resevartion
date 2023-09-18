<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자로그인</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>

<script>

$(function(){
	/* $("#button2").click(function(){
		var url = "/idpwCheck.do";
		window.open(url,"popup","width=400 height=300");
	}); */
	
	$("#button1").click(function(){
		
		var adminid = $.trim($("#adminid").val());
		var adminpw = $.trim($("#adminpw").val());

		if(adminid == "") {
			alert("아이디를 입력해 주세요.");
			$("#adminid").focus();
			return false;
		}
		if(adminpw == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#adminpw").focus();
			return false;
		}
		
		$.ajax({
			type : "POST",
			data : "adminid="+adminid+"&adminpw="+adminpw,
			url : "adminLoginSub.do",
			dataType : "text",
			
			success : function(result) {
				if(result == "ok") {
					alert(adminid+"님 로그인 되었습니다.");
					location="/adminMain.do";
				} else {
					alert("로그인 정보를 다시 확인해 주세요.");
				}
			},
			error : function() {
				alert("오류");
			}
			
			
			
		});
		
		
	});
});



</script>

<style>
 header{
 	width:400px;
    display:flex;
    justify-content: center;
}
form{
	width:400px;
    padding:10px;
}
.input-box{
    position:relative;
    margin:10px 0;
}
.input-box > input{
    background:transparent;
    border:none;
    border-bottom: solid 1px #ccc;
    padding:20px 0px 5px 0px;
    font-size:14pt;
    width:100%;
}
input::placeholder{
    color:transparent;
}
input:placeholder-shown + label{
    color:#aaa;
    font-size:14pt;
    top:15px;

}
input:focus + label, label{
    color:#8aa1a1;
    font-size:10pt;
    pointer-events: none;
    position: absolute;
    left:0px;
    top:0px;
    transition: all 0.2s ease ;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown){
    border-bottom: solid 1px #8aa1a1;
    outline:none;
}
button {
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
    width:100%;
    height:35px;
    font-size: 14pt;
    margin-top:100px;
}
#button2{
    text-align: right;
    font-size:12pt;
    color:rgb(164, 164, 164);
    margin:10px 0px;
}


.center-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>


<body>






<div class="center-content">
<header>
    <h2>AdminLogin</h2>
</header>

<form name="frm" id="frm">


    <div class="input-box">
        <input id="adminid" type="text" name="adminid" placeholder="아이디">
        <label for="adminid">아이디</label>
    </div>

    <div class="input-box">
        <input id="adminpw" type="password" name="adminpw" placeholder="비밀번호">
        <label for="adminpw">비밀번호</label>
    </div>
    <button type="submit" id="button1" onclick="return false;">로그인</button>

</form>
</div>

</body>
</html>