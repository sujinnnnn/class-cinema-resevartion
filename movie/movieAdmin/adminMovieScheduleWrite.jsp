<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
<title>영화스케줄 등록</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
  /* 팝업 레이어 스타일 */
  .select-box-popup {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    padding: 5px;
    z-index: 1;
  }

  .toggleButton {
    cursor: pointer;
  }
  
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
    padding: 10px 20px;
    margin: 5px;
    background-color: red;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
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
$(function(){
    $("#button1").click(function(){
        var form = $("#frm").serialize();
        
        $.ajax({
            type: "POST",
            data: form,
            url: "/adminMovieScheduleWriteSave.do",
            datatype: "text",
            success: function(data){
                if (data == "ok0") {
                    alert("모두 저장완료");
                    location = "/adminMovieScheduleList.do";
                } else {
                	var cnt = 0;
                    for (var i = 1; i < 10; i++) {
                        if (data == "ok" + i) {
                            cnt=i;
                            
                            break;  // 중복된 경우를 찾았으면 반복문을 종료.
                        }
                    }
                    alert("등록완료");
                    location = "/adminMovieScheduleList.do";
                }
            },
            error: function(){
                alert("전송실패");
            }
        });
    });
});

</script>


<script>
  // 버튼 클릭 시 셀렉트 상자 팝업 표시/숨기기 처리
  $(document).ready(function() {
    $('.toggleButton').on('click', function() {
      var selectBoxPopup = $(this).next('.select-box-popup');
      if (selectBoxPopup.css('display') === 'none') {
        $('.select-box-popup').css('display', 'none'); // 모든 팝업 숨기기
        selectBoxPopup.css('display', 'block'); // 클릭한 버튼과 연결된 팝업 보이기
      } else {
        selectBoxPopup.css('display', 'none'); // 클릭한 버튼과 연결된 팝업 숨기기
      }
    });

    // 팝업 외부를 클릭하면 팝업 닫기
    $(document).on('click', function(event) {
      if (!$(event.target).closest('.select-box-popup, .toggleButton').length) {
        $('.select-box-popup').css('display', 'none');
      }
    });
  });
  
  $(document).ready(function() {						//////////////////////////////////// 첫번째날
	  
	  $(".select-box1").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u1t1").val()) == 0 &&
	    	Number($("#u1t2").val())==0 &&
	    	Number($("#u1t3").val())==0) {
	    	$("#u1t1").val(unixTime);
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_1").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u1t1").val()) != 0 &&
    			Number($("#u1t2").val())==0 &&
    			Number($("#u1t3").val())==0 &&
    			unixTime < Number($("#u1t1").val()) &&
    			unixTime + 10800 < Number($("#u1t1").val())){
	    	$("#u1t2").val($("#u1t1").val());
	    	$("#u1t2_1").val($("#u1t1_1").val());
	    	$("#u1t1").val(unixTime);
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_1").val($("#schedule1_1").val());
	    	$("#schedule1_1").val(value);
	    	
	    } else if (Number($("#u1t1").val()) != 0 &&
	    			Number($("#u1t2").val())==0 &&
	    			Number($("#u1t3").val())==0 &&
	    			unixTime < Number($("#u1t1").val()) &&
	    			unixTime + 10800 > Number($("#u1t1").val())) {
	    	$("#u1t1").val(unixTime);
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_1").val(value);
	      
	    	
	    } else if (Number($("#u1t1").val()) != 0 &&
    			Number($("#u1t2").val())==0 &&
    			Number($("#u1t3").val())==0 &&
    			unixTime > Number($("#u1t1").val()) &&
    			unixTime  < Number($("#u1t1").val())+ 10800) {
	    	$("#u1t1").val(unixTime);
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_1").val(value);
      
    	
   		 }  else if(Number($("#u1t1").val()) != 0 &&
		    		Number($("#u1t2").val())==0 &&
	    			Number($("#u1t3").val())==0 &&
	    		   unixTime > Number($("#u1t1").val()) + 10800){
	    	$("#u1t2").val(unixTime);
	    	$("#u1t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_1").val(value);
	      
	      
	    }else if(Number($("#u1t1").val()) != 0 &&
				Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())==0 &&
				unixTime < Number($("#u1t1").val()) &&
				unixTime < Number($("#u1t1").val()) -10800){
	   		$("#u1t3").val($("#u1t2").val());
	    	$("#u1t2").val($("#u1t1").val());
	    	$("#u1t1").val(unixTime);
	    	
	    	$("#u1t3_1").val($("#u1t2_1").val());
	    	$("#u1t2_1").val($("#u1t1_1").val());
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_1").val($("#schedule1_1").val());
	    	$("#schedule3_1").val($("#schedule2_1").val());
	    	$("#schedule1_1").val(value);
    	
    }
   		 
   		 else if(Number($("#u1t1").val()) != 0 &&
	    			Number($("#u1t2").val()) != 0 &&
	    			Number($("#u1t3").val())==0 &&
	    			unixTime < Number($("#u1t1").val())){	// 2칸일때
	    	$("#u1t1").val(unixTime);
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_1").val(value);
	    
	    }    else if(Number($("#u1t1").val()) != 0 &&
	    			Number($("#u1t2").val()) != 0 &&
	    			Number($("#u1t3").val())==0 &&
	    			unixTime > Number($("#u1t1").val()) &&
	    			unixTime < Number($("#u1t2").val()) &&
	    			unixTime > Number($("#u1t1").val()) +10800 &&
	    			unixTime < Number($("#u1t2").val())-10800){
	    	$("#u1t3").val($("#u1t2").val());
	    	$("#u1t2").val(unixTime);
	    	$("#u1t3_1").val($("#u1t2_1").val());
	    	$("#u1t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_1").val($("#schedule2_1").val());
	    	$("#schedule2_1").val(value);
	    	
	    }	else if(Number($("#u1t1").val()) != 0 &&
    			Number($("#u1t2").val()) != 0 &&
    			Number($("#u1t3").val())==0 &&
    			unixTime > Number($("#u1t1").val()) &&
    			unixTime < Number($("#u1t1").val()) +10800 &&
    			unixTime < Number($("#u1t2").val())-10800){
	    	$("#u1t1").val(unixTime);
	    	$("#u1t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_1").val(value);
    	
    	}
	    
	    	else if(Number($("#u1t1").val()) != 0 &&
	    			Number($("#u1t2").val()) != 0 &&
	    			Number($("#u1t3").val())==0 &&
	    			unixTime > Number($("#u1t1").val()) &&
	    			unixTime > Number($("#u1t2").val())-10800 &&
	    			unixTime < Number($("#u1t1").val())+10800 &&
	    			unixTime < Number($("#u1t2").val())){
    	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
    	return false;
    	
        } 	else if(Number($("#u1t1").val()) != 0 &&
	    			Number($("#u1t2").val()) != 0 &&
	    			Number($("#u1t3").val())==0 &&
	    			unixTime > Number($("#u1t2").val()) &&
	    			unixTime < Number($("#u1t2").val())+10800){
        	$("#u1t2").val(unixTime);
        	$("#u1t2_1").val(fn_unixhm(unixTime));
        	$("#schedule2_1").val(value);
        	
        	
        } 	else if(Number($("#u1t1").val()) != 0 &&
    			Number($("#u1t2").val()) != 0 &&
    			Number($("#u1t3").val())==0 &&
    			unixTime < Number($("#u1t2").val()) &&
    			unixTime > Number($("#u1t1").val())+10800){
    	$("#u1t2").val(unixTime);
    	$("#u1t2_1").val(fn_unixhm(unixTime));
    	$("#schedule2_1").val(value);
    	
    	
    }	else if(Number($("#u1t1").val()) != 0 &&
	    			Number($("#u1t2").val()) != 0 &&
	    			Number($("#u1t3").val())==0 &&
	    			unixTime > Number($("#u1t2").val()) &&
	    			unixTime > Number($("#u1t2").val())+10800){
        	$("#u1t3").val(unixTime);
        	$("#u1t3_1").val(fn_unixhm(unixTime));
        	$("#schedule3_1").val(value);
        	
        	
        	
        }	else if(Number($("#u1t1").val()) != 0 &&
    			Number($("#u1t2").val()) != 0 &&
    			Number($("#u1t3").val())!=0 &&
    			unixTime < Number($("#u1t1").val())){
    	$("#u1t1").val(unixTime);
    	$("#u1t1_1").val(fn_unixhm(unixTime));
    	$("#schedule1_1").val(value);
    	
    	
    	
       }	else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t1").val()) &&
				unixTime < Number($("#u1t2").val()) &&
				unixTime < Number($("#u1t2").val())-10800){
		$("#u1t1").val(unixTime);
		$("#u1t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_1").val(value);
	
		
       }	else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t1").val()) &&
				unixTime < Number($("#u1t2").val()) &&
				unixTime > Number($("#u1t2").val())-10800 &&
				unixTime > Number($("#u1t1").val())+10800){
    	   
		$("#u1t2").val(unixTime);
		$("#u1t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_1").val(value);
	
       }	else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t1").val()) &&
				unixTime < Number($("#u1t2").val()) &&
				unixTime > Number($("#u1t2").val())-10800 &&
				unixTime < Number($("#u1t1").val())+10800){
    	   
    	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
      	 	return false;
    	   
    	   
       }	else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t2").val()) &&
				unixTime < Number($("#u1t3").val()) &&
				unixTime < Number($("#u1t3").val())-10800 &&
				unixTime > Number($("#u1t1").val())+10800){
    	   
    	    $("#u1t2").val(unixTime);
	   		$("#u1t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_1").val(value);
    	   
    	   
       }else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t2").val()) &&
				unixTime < Number($("#u1t3").val()) &&
				unixTime > Number($("#u1t3").val())-10800 &&
				unixTime < Number($("#u1t2").val())+10800){
    	   
    	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
     	 	return false;
    	   
    	   
       }	else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t2").val()) &&
				unixTime < Number($("#u1t3").val()) &&
				unixTime > Number($("#u1t3").val())-10800 &&
				unixTime > Number($("#u1t2").val())+10800){
    	   
    	   $("#u1t3").val(unixTime);
	   		$("#u1t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_1").val(value);
    	   
    	   
       }	else if(Number($("#u1t1").val()) != 0 &&
	   			Number($("#u1t2").val()) != 0 &&
				Number($("#u1t3").val())!=0 &&
				unixTime > Number($("#u1t3").val())){
    	   
    	    $("#u1t3").val(unixTime);
	   		$("#u1t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_1").val(value);
    	   
    	   
       }
	  });
	  
	  
	});
  
$(document).ready(function() {						//////////////////////////////////// 두번째날
	  
	  $(".select-box2").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u2t1").val()) == 0 &&
	    	Number($("#u2t2").val())==0 &&
	    	Number($("#u2t3").val())==0) {
	    	$("#u2t1").val(unixTime);
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_2").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u2t1").val()) != 0 &&
    			Number($("#u2t2").val())==0 &&
    			Number($("#u2t3").val())==0 &&
    			unixTime < Number($("#u2t1").val()) &&
    			unixTime + 10800 < Number($("#u2t1").val())){
	    	$("#u2t2").val($("#u2t1").val());
	    	$("#u2t2_1").val($("#u2t1_1").val());
	    	$("#u2t1").val(unixTime);
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_2").val($("#schedule1_2").val());
	    	$("#schedule1_2").val(value);
	    	
	    } else if (Number($("#u2t1").val()) != 0 &&
	    			Number($("#u2t2").val())==0 &&
	    			Number($("#u2t3").val())==0 &&
	    			unixTime < Number($("#u2t1").val()) &&
	    			unixTime + 10800 > Number($("#u2t1").val())) {
	    	$("#u2t1").val(unixTime);
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_2").val(value);
	      
	    	
	    } else if (Number($("#u2t1").val()) != 0 &&
    			Number($("#u2t2").val())==0 &&
    			Number($("#u2t3").val())==0 &&
    			unixTime > Number($("#u2t1").val()) &&
    			unixTime  < Number($("#u2t1").val())+ 10800) {
	    	$("#u2t1").val(unixTime);
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_2").val(value);
      
    	
   		 }  else if(Number($("#u2t1").val()) != 0 &&
		    		Number($("#u2t2").val())==0 &&
	    			Number($("#u2t3").val())==0 &&
	    		   unixTime > Number($("#u2t1").val()) + 10800){
	    	$("#u2t2").val(unixTime);
	    	$("#u2t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_2").val(value);
	      
	      
	    }else if(Number($("#u2t1").val()) != 0 &&
				Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())==0 &&
				unixTime < Number($("#u2t1").val()) &&
				unixTime < Number($("#u2t1").val()) -10800){
	   		$("#u2t3").val($("#u2t2").val());
	    	$("#u2t2").val($("#u2t1").val());
	    	$("#u2t1").val(unixTime);
	    	
	    	$("#u2t3_1").val($("#u2t2_1").val());
	    	$("#u2t2_1").val($("#u2t1_1").val());
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_2").val($("#schedule1_2").val());
	    	$("#schedule3_2").val($("#schedule2_2").val());
	    	$("#schedule1_2").val(value);
    	
    }
   		 
   		 else if(Number($("#u2t1").val()) != 0 &&
	    			Number($("#u2t2").val()) != 0 &&
	    			Number($("#u2t3").val())==0 &&
	    			unixTime < Number($("#u2t1").val())){	// 2칸일때
	    	$("#u2t1").val(unixTime);
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_2").val(value);
	    
	    }    else if(Number($("#u2t1").val()) != 0 &&
	    			Number($("#u2t2").val()) != 0 &&
	    			Number($("#u2t3").val())==0 &&
	    			unixTime > Number($("#u2t1").val()) &&
	    			unixTime < Number($("#u2t2").val()) &&
	    			unixTime > Number($("#u2t1").val()) +10800 &&
	    			unixTime < Number($("#u2t2").val())-10800){
	    	$("#u2t3").val($("#u2t2").val());
	    	$("#u2t2").val(unixTime);
	    	$("#u2t3_1").val($("#u2t2_1").val());
	    	$("#u2t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_2").val($("#schedule2_2").val());
	    	$("#schedule2_2").val(value);
	    	
	    }	else if(Number($("#u2t1").val()) != 0 &&
    			Number($("#u2t2").val()) != 0 &&
    			Number($("#u2t3").val())==0 &&
    			unixTime > Number($("#u2t1").val()) &&
    			unixTime < Number($("#u2t1").val()) +10800 &&
    			unixTime < Number($("#u2t2").val())-10800){
	    	$("#u2t1").val(unixTime);
	    	$("#u2t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_2").val(value);
    	
    	}
	    
	    	else if(Number($("#u2t1").val()) != 0 &&
	    			Number($("#u2t2").val()) != 0 &&
	    			Number($("#u2t3").val())==0 &&
	    			unixTime > Number($("#u2t1").val()) &&
	    			unixTime > Number($("#u2t2").val())-10800 &&
	    			unixTime < Number($("#u2t1").val())+10800 &&
	    			unixTime < Number($("#u2t2").val())){
    	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
    	return false;
    	
        } 	else if(Number($("#u2t1").val()) != 0 &&
	    			Number($("#u2t2").val()) != 0 &&
	    			Number($("#u2t3").val())==0 &&
	    			unixTime > Number($("#u2t2").val()) &&
	    			unixTime < Number($("#u2t2").val())+10800){
        	$("#u2t2").val(unixTime);
        	$("#u2t2_1").val(fn_unixhm(unixTime));
        	$("#schedule2_2").val(value);
        	
        	
        } 	else if(Number($("#u2t1").val()) != 0 &&
    			Number($("#u2t2").val()) != 0 &&
    			Number($("#u2t3").val())==0 &&
    			unixTime < Number($("#u2t2").val()) &&
    			unixTime > Number($("#u2t1").val())+10800){
    	$("#u2t2").val(unixTime);
    	$("#u2t2_1").val(fn_unixhm(unixTime));
    	$("#schedule2_2").val(value);
    	
    	
    }	else if(Number($("#u2t1").val()) != 0 &&
	    			Number($("#u2t2").val()) != 0 &&
	    			Number($("#u2t3").val())==0 &&
	    			unixTime > Number($("#u2t2").val()) &&
	    			unixTime > Number($("#u2t2").val())+10800){
        	$("#u2t3").val(unixTime);
        	$("#u2t3_1").val(fn_unixhm(unixTime));
        	$("#schedule3_2").val(value);
        	
        	
        	
        }	else if(Number($("#u2t1").val()) != 0 &&
    			Number($("#u2t2").val()) != 0 &&
    			Number($("#u2t3").val())!=0 &&
    			unixTime < Number($("#u2t1").val())){
    	$("#u2t1").val(unixTime);
    	$("#u2t1_1").val(fn_unixhm(unixTime));
    	$("#schedule1_2").val(value);
    	
    	
    	
       }	else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t1").val()) &&
				unixTime < Number($("#u2t2").val()) &&
				unixTime < Number($("#u2t2").val())-10800){
		$("#u2t1").val(unixTime);
		$("#u2t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_2").val(value);
	
		
       }	else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t1").val()) &&
				unixTime < Number($("#u2t2").val()) &&
				unixTime > Number($("#u2t2").val())-10800 &&
				unixTime > Number($("#u2t1").val())+10800){
    	   
		$("#u2t2").val(unixTime);
		$("#u2t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_2").val(value);
	
       }	else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t1").val()) &&
				unixTime < Number($("#u2t2").val()) &&
				unixTime > Number($("#u2t2").val())-10800 &&
				unixTime < Number($("#u2t1").val())+10800){
    	   
    	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
      	 	return false;
    	   
    	   
       }	else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t2").val()) &&
				unixTime < Number($("#u2t3").val()) &&
				unixTime < Number($("#u2t3").val())-10800 &&
				unixTime > Number($("#u2t1").val())+10800){
    	   
    	    $("#u2t2").val(unixTime);
	   		$("#u2t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_2").val(value);
    	   
    	   
       }else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t2").val()) &&
				unixTime < Number($("#u2t3").val()) &&
				unixTime > Number($("#u2t3").val())-10800 &&
				unixTime < Number($("#u2t2").val())+10800){
    	   
    	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
     	 	return false;
    	   
    	   
       }	else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t2").val()) &&
				unixTime < Number($("#u2t3").val()) &&
				unixTime > Number($("#u2t3").val())-10800 &&
				unixTime > Number($("#u2t2").val())+10800){
    	   
    	   $("#u2t3").val(unixTime);
	   		$("#u2t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_2").val(value);
    	   
    	   
       }	else if(Number($("#u2t1").val()) != 0 &&
	   			Number($("#u2t2").val()) != 0 &&
				Number($("#u2t3").val())!=0 &&
				unixTime > Number($("#u2t3").val())){
    	   
    	    $("#u2t3").val(unixTime);
	   		$("#u2t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_2").val(value);
    	   
    	   
       }
	  });
	  
	  
	});
  
$(document).ready(function() {						//////////////////////////////////// 세번째날
	  
	  $(".select-box3").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u3t1").val()) == 0 &&
	    	Number($("#u3t2").val())==0 &&
	    	Number($("#u3t3").val())==0) {
	    	$("#u3t1").val(unixTime);
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_3").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u3t1").val()) != 0 &&
  			Number($("#u3t2").val())==0 &&
  			Number($("#u3t3").val())==0 &&
  			unixTime < Number($("#u3t1").val()) &&
  			unixTime + 10800 < Number($("#u3t1").val())){
	    	$("#u3t2").val($("#u3t1").val());
	    	$("#u3t2_1").val($("#u3t1_1").val());
	    	$("#u3t1").val(unixTime);
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_3").val($("#schedule1_3").val());
	    	$("#schedule1_3").val(value);
	    	
	    } else if (Number($("#u3t1").val()) != 0 &&
	    			Number($("#u3t2").val())==0 &&
	    			Number($("#u3t3").val())==0 &&
	    			unixTime < Number($("#u3t1").val()) &&
	    			unixTime + 10800 > Number($("#u3t1").val())) {
	    	$("#u3t1").val(unixTime);
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule3_1").val(value);
	      
	    	
	    } else if (Number($("#u3t1").val()) != 0 &&
  			Number($("#u3t2").val())==0 &&
  			Number($("#u3t3").val())==0 &&
  			unixTime > Number($("#u3t1").val()) &&
  			unixTime  < Number($("#u3t1").val())+ 10800) {
	    	$("#u3t1").val(unixTime);
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_3").val(value);
    
  	
 		 }  else if(Number($("#u3t1").val()) != 0 &&
		    		Number($("#u3t2").val())==0 &&
	    			Number($("#u3t3").val())==0 &&
	    		   unixTime > Number($("#u3t1").val()) + 10800){
	    	$("#u3t2").val(unixTime);
	    	$("#u3t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_3").val(value);
	      
	      
	    }else if(Number($("#u3t1").val()) != 0 &&
				Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())==0 &&
				unixTime < Number($("#u3t1").val()) &&
				unixTime < Number($("#u3t1").val()) -10800){
	   		$("#u3t3").val($("#u3t2").val());
	    	$("#u3t2").val($("#u3t1").val());
	    	$("#u3t1").val(unixTime);
	    	
	    	$("#u3t3_1").val($("#u3t2_1").val());
	    	$("#u3t2_1").val($("#u3t1_1").val());
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_3").val($("#schedule1_3").val());
	    	$("#schedule3_3").val($("#schedule2_3").val());
	    	$("#schedule1_3").val(value);
  	
  }
 		 
 		 else if(Number($("#u3t1").val()) != 0 &&
	    			Number($("#u3t2").val()) != 0 &&
	    			Number($("#u3t3").val())==0 &&
	    			unixTime < Number($("#u3t1").val())){	// 2칸일때
	    	$("#u3t1").val(unixTime);
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_3").val(value);
	    
	    }    else if(Number($("#u3t1").val()) != 0 &&
	    			Number($("#u3t2").val()) != 0 &&
	    			Number($("#u3t3").val())==0 &&
	    			unixTime > Number($("#u3t1").val()) &&
	    			unixTime < Number($("#u3t2").val()) &&
	    			unixTime > Number($("#u3t1").val()) +10800 &&
	    			unixTime < Number($("#u3t2").val())-10800){
	    	$("#u3t3").val($("#u3t2").val());
	    	$("#u3t2").val(unixTime);
	    	$("#u3t3_1").val($("#u3t2_1").val());
	    	$("#u3t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_3").val($("#schedule2_3").val());
	    	$("#schedule2_3").val(value);
	    	
	    }	else if(Number($("#u3t1").val()) != 0 &&
  			Number($("#u3t2").val()) != 0 &&
  			Number($("#u3t3").val())==0 &&
  			unixTime > Number($("#u3t1").val()) &&
  			unixTime < Number($("#u3t1").val()) +10800 &&
  			unixTime < Number($("#u3t2").val())-10800){
	    	$("#u3t1").val(unixTime);
	    	$("#u3t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_3").val(value);
  	
  	}
	    
	    	else if(Number($("#u3t1").val()) != 0 &&
	    			Number($("#u3t2").val()) != 0 &&
	    			Number($("#u3t3").val())==0 &&
	    			unixTime > Number($("#u3t1").val()) &&
	    			unixTime > Number($("#u3t2").val())-10800 &&
	    			unixTime < Number($("#u3t1").val())+10800 &&
	    			unixTime < Number($("#u3t2").val())){
  	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
  	return false;
  	
      } 	else if(Number($("#u3t1").val()) != 0 &&
	    			Number($("#u3t2").val()) != 0 &&
	    			Number($("#u3t3").val())==0 &&
	    			unixTime > Number($("#u3t2").val()) &&
	    			unixTime < Number($("#u3t2").val())+10800){
      	$("#u3t2").val(unixTime);
      	$("#u3t2_1").val(fn_unixhm(unixTime));
      	$("#schedule2_3").val(value);
      	
      	
      } 	else if(Number($("#u3t1").val()) != 0 &&
  			Number($("#u3t2").val()) != 0 &&
  			Number($("#u3t3").val())==0 &&
  			unixTime < Number($("#u3t2").val()) &&
  			unixTime > Number($("#u3t1").val())+10800){
  	$("#u3t2").val(unixTime);
  	$("#u3t2_1").val(fn_unixhm(unixTime));
  	$("#schedule2_3").val(value);
  	
  	
  }	else if(Number($("#u3t1").val()) != 0 &&
	    			Number($("#u3t2").val()) != 0 &&
	    			Number($("#u3t3").val())==0 &&
	    			unixTime > Number($("#u3t2").val()) &&
	    			unixTime > Number($("#u3t2").val())+10800){
      	$("#u3t3").val(unixTime);
      	$("#u3t3_1").val(fn_unixhm(unixTime));
      	$("#schedule3_3").val(value);
      	
      	
      	
      }	else if(Number($("#u3t1").val()) != 0 &&
  			Number($("#u3t2").val()) != 0 &&
  			Number($("#u3t3").val())!=0 &&
  			unixTime < Number($("#u3t1").val())){
  	$("#u3t1").val(unixTime);
  	$("#u3t1_1").val(fn_unixhm(unixTime));
  	$("#schedule1_3").val(value);
  	
  	
  	
     }	else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t1").val()) &&
				unixTime < Number($("#u3t2").val()) &&
				unixTime < Number($("#u3t2").val())-10800){
		$("#u3t1").val(unixTime);
		$("#u3t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_3").val(value);
	
		
     }	else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t1").val()) &&
				unixTime < Number($("#u3t2").val()) &&
				unixTime > Number($("#u3t2").val())-10800 &&
				unixTime > Number($("#u3t1").val())+10800){
  	   
		$("#u3t2").val(unixTime);
		$("#u3t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_3").val(value);
	
     }	else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t1").val()) &&
				unixTime < Number($("#u3t2").val()) &&
				unixTime > Number($("#u3t2").val())-10800 &&
				unixTime < Number($("#u3t1").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
    	 	return false;
  	   
  	   
     }	else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t2").val()) &&
				unixTime < Number($("#u3t3").val()) &&
				unixTime < Number($("#u3t3").val())-10800 &&
				unixTime > Number($("#u3t1").val())+10800){
  	   
  	    $("#u3t2").val(unixTime);
	   		$("#u3t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_3").val(value);
  	   
  	   
     }else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t2").val()) &&
				unixTime < Number($("#u3t3").val()) &&
				unixTime > Number($("#u3t3").val())-10800 &&
				unixTime < Number($("#u3t2").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
   	 	return false;
  	   
  	   
     }	else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t2").val()) &&
				unixTime < Number($("#u3t3").val()) &&
				unixTime > Number($("#u3t3").val())-10800 &&
				unixTime > Number($("#u3t2").val())+10800){
  	   
  	   $("#u3t3").val(unixTime);
	   		$("#u3t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_3").val(value);
  	   
  	   
     }	else if(Number($("#u3t1").val()) != 0 &&
	   			Number($("#u3t2").val()) != 0 &&
				Number($("#u3t3").val())!=0 &&
				unixTime > Number($("#u3t3").val())){
  	   
  	    $("#u3t3").val(unixTime);
	   		$("#u3t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_3").val(value);
  	   
  	   
     }
	  });
	  
	  
	});
	
	
$(document).ready(function() {						//////////////////////////////////// 네번째날
	  
	  $(".select-box4").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u4t1").val()) == 0 &&
	    	Number($("#u4t2").val())==0 &&
	    	Number($("#u4t3").val())==0) {
	    	$("#u4t1").val(unixTime);
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_4").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u4t1").val()) != 0 &&
  			Number($("#u4t2").val())==0 &&
  			Number($("#u4t3").val())==0 &&
  			unixTime < Number($("#u4t1").val()) &&
  			unixTime + 10800 < Number($("#u4t1").val())){
	    	$("#u4t2").val($("#u4t1").val());
	    	$("#u4t2_1").val($("#u4t1_1").val());
	    	$("#u4t1").val(unixTime);
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_4").val($("#schedule1_4").val());
	    	$("#schedule1_4").val(value);
	    	
	    } else if (Number($("#u4t1").val()) != 0 &&
	    			Number($("#u4t2").val())==0 &&
	    			Number($("#u4t3").val())==0 &&
	    			unixTime < Number($("#u4t1").val()) &&
	    			unixTime + 10800 > Number($("#u4t1").val())) {
	    	$("#u4t1").val(unixTime);
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_4").val(value);
	      
	    	
	    } else if (Number($("#u4t1").val()) != 0 &&
  			Number($("#u4t2").val())==0 &&
  			Number($("#u4t3").val())==0 &&
  			unixTime > Number($("#u4t1").val()) &&
  			unixTime  < Number($("#u4t1").val())+ 10800) {
	    	$("#u4t1").val(unixTime);
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_4").val(value);
    
  	
 		 }  else if(Number($("#u4t1").val()) != 0 &&
		    		Number($("#u4t2").val())==0 &&
	    			Number($("#u4t3").val())==0 &&
	    		   unixTime > Number($("#u4t1").val()) + 10800){
	    	$("#u4t2").val(unixTime);
	    	$("#u4t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_4").val(value);
	      
	      
	    }else if(Number($("#u4t1").val()) != 0 &&
				Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())==0 &&
				unixTime < Number($("#u4t1").val()) &&
				unixTime < Number($("#u4t1").val()) -10800){
	   		$("#u4t3").val($("#u4t2").val());
	    	$("#u4t2").val($("#u4t1").val());
	    	$("#u4t1").val(unixTime);
	    	
	    	$("#u4t3_1").val($("#u4t2_1").val());
	    	$("#u4t2_1").val($("#u4t1_1").val());
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_4").val($("#schedule1_4").val());
	    	$("#schedule3_4").val($("#schedule2_4").val());
	    	$("#schedule1_4").val(value);
  	
  }
 		 
 		 else if(Number($("#u4t1").val()) != 0 &&
	    			Number($("#u4t2").val()) != 0 &&
	    			Number($("#u4t3").val())==0 &&
	    			unixTime < Number($("#u4t1").val())){	// 2칸일때
	    	$("#u4t1").val(unixTime);
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_4").val(value);
	    
	    }    else if(Number($("#u4t1").val()) != 0 &&
	    			Number($("#u4t2").val()) != 0 &&
	    			Number($("#u4t3").val())==0 &&
	    			unixTime > Number($("#u4t1").val()) &&
	    			unixTime < Number($("#u4t2").val()) &&
	    			unixTime > Number($("#u4t1").val()) +10800 &&
	    			unixTime < Number($("#u4t2").val())-10800){
	    	$("#u4t3").val($("#u4t2").val());
	    	$("#u4t2").val(unixTime);
	    	$("#u4t3_1").val($("#u4t2_1").val());
	    	$("#u4t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_4").val($("#schedule2_4").val());
	    	$("#schedule2_4").val(value);
	    	
	    }	else if(Number($("#u4t1").val()) != 0 &&
  			Number($("#u4t2").val()) != 0 &&
  			Number($("#u4t3").val())==0 &&
  			unixTime > Number($("#u4t1").val()) &&
  			unixTime < Number($("#u4t1").val()) +10800 &&
  			unixTime < Number($("#u4t2").val())-10800){
	    	$("#u4t1").val(unixTime);
	    	$("#u4t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_4").val(value);
  	
  	}
	    
	    	else if(Number($("#u4t1").val()) != 0 &&
	    			Number($("#u4t2").val()) != 0 &&
	    			Number($("#u4t3").val())==0 &&
	    			unixTime > Number($("#u4t1").val()) &&
	    			unixTime > Number($("#u4t2").val())-10800 &&
	    			unixTime < Number($("#u4t1").val())+10800 &&
	    			unixTime < Number($("#u4t2").val())){
  	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
  	return false;
  	
      } 	else if(Number($("#u4t1").val()) != 0 &&
	    			Number($("#u4t2").val()) != 0 &&
	    			Number($("#u4t3").val())==0 &&
	    			unixTime > Number($("#u4t2").val()) &&
	    			unixTime < Number($("#u4t2").val())+10800){
      	$("#u4t2").val(unixTime);
      	$("#u4t2_1").val(fn_unixhm(unixTime));
      	$("#schedule2_4").val(value);
      	
      	
      } 	else if(Number($("#u4t1").val()) != 0 &&
  			Number($("#u4t2").val()) != 0 &&
  			Number($("#u4t3").val())==0 &&
  			unixTime < Number($("#u4t2").val()) &&
  			unixTime > Number($("#u4t1").val())+10800){
  	$("#u4t2").val(unixTime);
  	$("#u4t2_1").val(fn_unixhm(unixTime));
  	$("#schedule2_4").val(value);
  	
  	
  }	else if(Number($("#u4t1").val()) != 0 &&
	    			Number($("#u4t2").val()) != 0 &&
	    			Number($("#u4t3").val())==0 &&
	    			unixTime > Number($("#u4t2").val()) &&
	    			unixTime > Number($("#u4t2").val())+10800){
      	$("#u4t3").val(unixTime);
      	$("#u4t3_1").val(fn_unixhm(unixTime));
      	$("#schedule3_4").val(value);
      	
      	
      	
      }	else if(Number($("#u4t1").val()) != 0 &&
  			Number($("#u4t2").val()) != 0 &&
  			Number($("#u4t3").val())!=0 &&
  			unixTime < Number($("#u4t1").val())){
  	$("#u4t1").val(unixTime);
  	$("#u4t1_1").val(fn_unixhm(unixTime));
  	$("#schedule1_4").val(value);
  	
  	
  	
     }	else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t1").val()) &&
				unixTime < Number($("#u4t2").val()) &&
				unixTime < Number($("#u4t2").val())-10800){
		$("#u4t1").val(unixTime);
		$("#u4t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_4").val(value);
	
		
     }	else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t1").val()) &&
				unixTime < Number($("#u4t2").val()) &&
				unixTime > Number($("#u4t2").val())-10800 &&
				unixTime > Number($("#u4t1").val())+10800){
  	   
		$("#u4t2").val(unixTime);
		$("#u4t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_4").val(value);
	
     }	else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t1").val()) &&
				unixTime < Number($("#u4t2").val()) &&
				unixTime > Number($("#u4t2").val())-10800 &&
				unixTime < Number($("#u4t1").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
    	 	return false;
  	   
  	   
     }	else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t2").val()) &&
				unixTime < Number($("#u4t3").val()) &&
				unixTime < Number($("#u4t3").val())-10800 &&
				unixTime > Number($("#u4t1").val())+10800){
  	   
  	    $("#u4t2").val(unixTime);
	   		$("#u4t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_4").val(value);
  	   
  	   
     }else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t2").val()) &&
				unixTime < Number($("#u4t3").val()) &&
				unixTime > Number($("#u4t3").val())-10800 &&
				unixTime < Number($("#u4t2").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
   	 	return false;
  	   
  	   
     }	else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t2").val()) &&
				unixTime < Number($("#u4t3").val()) &&
				unixTime > Number($("#u4t3").val())-10800 &&
				unixTime > Number($("#u4t2").val())+10800){
  	   
  	   $("#u4t3").val(unixTime);
	   		$("#u4t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_4").val(value);
  	   
  	   
     }	else if(Number($("#u4t1").val()) != 0 &&
	   			Number($("#u4t2").val()) != 0 &&
				Number($("#u4t3").val())!=0 &&
				unixTime > Number($("#u4t3").val())){
  	   
  	    $("#u4t3").val(unixTime);
	   		$("#u4t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_4").val(value);
  	   
  	   
     }
	  });
	  
	  
	});
	
	
$(document).ready(function() {						//////////////////////////////////// 다섯번째날
	  
	  $(".select-box5").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u5t1").val()) == 0 &&
	    	Number($("#u5t2").val())==0 &&
	    	Number($("#u5t3").val())==0) {
	    	$("#u5t1").val(unixTime);
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_5").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u5t1").val()) != 0 &&
  			Number($("#u5t2").val())==0 &&
  			Number($("#u5t3").val())==0 &&
  			unixTime < Number($("#u5t1").val()) &&
  			unixTime + 10800 < Number($("#u5t1").val())){
	    	$("#u5t2").val($("#u5t1").val());
	    	$("#u5t2_1").val($("#u5t1_1").val());
	    	$("#u5t1").val(unixTime);
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_5").val($("#schedule1_5").val());
	    	$("#schedule1_5").val(value);
	    	
	    } else if (Number($("#u5t1").val()) != 0 &&
	    			Number($("#u5t2").val())==0 &&
	    			Number($("#u5t3").val())==0 &&
	    			unixTime < Number($("#u5t1").val()) &&
	    			unixTime + 10800 > Number($("#u5t1").val())) {
	    	$("#u5t1").val(unixTime);
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_5").val(value);
	      
	    	
	    } else if (Number($("#u5t1").val()) != 0 &&
  			Number($("#u5t2").val())==0 &&
  			Number($("#u5t3").val())==0 &&
  			unixTime > Number($("#u5t1").val()) &&
  			unixTime  < Number($("#u5t1").val())+ 10800) {
	    	$("#u5t1").val(unixTime);
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_5").val(value);
    
  	
 		 }  else if(Number($("#u5t1").val()) != 0 &&
		    		Number($("#u5t2").val())==0 &&
	    			Number($("#u5t3").val())==0 &&
	    		   unixTime > Number($("#u5t1").val()) + 10800){
	    	$("#u5t2").val(unixTime);
	    	$("#u5t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_5").val(value);
	      
	      
	    }else if(Number($("#u5t1").val()) != 0 &&
				Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())==0 &&
				unixTime < Number($("#u5t1").val()) &&
				unixTime < Number($("#u5t1").val()) -10800){
	   		$("#u5t3").val($("#u5t2").val());
	    	$("#u5t2").val($("#u5t1").val());
	    	$("#u5t1").val(unixTime);
	    	
	    	$("#u5t3_1").val($("#u5t2_1").val());
	    	$("#u5t2_1").val($("#u5t1_1").val());
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_5").val($("#schedule1_5").val());
	    	$("#schedule3_5").val($("#schedule2_5").val());
	    	$("#schedule1_5").val(value);
  	
  }
 		 
 		 else if(Number($("#u5t1").val()) != 0 &&
	    			Number($("#u5t2").val()) != 0 &&
	    			Number($("#u5t3").val())==0 &&
	    			unixTime < Number($("#u5t1").val())){	// 2칸일때
	    	$("#u5t1").val(unixTime);
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_5").val(value);
	    
	    }    else if(Number($("#u5t1").val()) != 0 &&
	    			Number($("#u5t2").val()) != 0 &&
	    			Number($("#u5t3").val())==0 &&
	    			unixTime > Number($("#u5t1").val()) &&
	    			unixTime < Number($("#u5t2").val()) &&
	    			unixTime > Number($("#u5t1").val()) +10800 &&
	    			unixTime < Number($("#u5t2").val())-10800){
	    	$("#u5t3").val($("#u5t2").val());
	    	$("#u5t2").val(unixTime);
	    	$("#u5t3_1").val($("#u5t2_1").val());
	    	$("#u5t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_5").val($("#schedule2_5").val());
	    	$("#schedule2_5").val(value);
	    	
	    }	else if(Number($("#u5t1").val()) != 0 &&
  			Number($("#u5t2").val()) != 0 &&
  			Number($("#u5t3").val())==0 &&
  			unixTime > Number($("#u5t1").val()) &&
  			unixTime < Number($("#u5t1").val()) +10800 &&
  			unixTime < Number($("#u5t2").val())-10800){
	    	$("#u5t1").val(unixTime);
	    	$("#u5t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_5").val(value);
  	
  	}
	    
	    	else if(Number($("#u5t1").val()) != 0 &&
	    			Number($("#u5t2").val()) != 0 &&
	    			Number($("#u5t3").val())==0 &&
	    			unixTime > Number($("#u5t1").val()) &&
	    			unixTime > Number($("#u5t2").val())-10800 &&
	    			unixTime < Number($("#u5t1").val())+10800 &&
	    			unixTime < Number($("#u5t2").val())){
  	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
  	return false;
  	
      } 	else if(Number($("#u5t1").val()) != 0 &&
	    			Number($("#u5t2").val()) != 0 &&
	    			Number($("#u5t3").val())==0 &&
	    			unixTime > Number($("#u5t2").val()) &&
	    			unixTime < Number($("#u5t2").val())+10800){
      	$("#u5t2").val(unixTime);
      	$("#u5t2_1").val(fn_unixhm(unixTime));
      	$("#schedule2_5").val(value);
      	
      	
      } 	else if(Number($("#u5t1").val()) != 0 &&
  			Number($("#u5t2").val()) != 0 &&
  			Number($("#u5t3").val())==0 &&
  			unixTime < Number($("#u5t2").val()) &&
  			unixTime > Number($("#u5t1").val())+10800){
  	$("#u5t2").val(unixTime);
  	$("#u5t2_1").val(fn_unixhm(unixTime));
  	$("#schedule2_5").val(value);
  	
  	
  }	else if(Number($("#u5t1").val()) != 0 &&
	    			Number($("#u5t2").val()) != 0 &&
	    			Number($("#u5t3").val())==0 &&
	    			unixTime > Number($("#u5t2").val()) &&
	    			unixTime > Number($("#u5t2").val())+10800){
      	$("#u5t3").val(unixTime);
      	$("#u5t3_1").val(fn_unixhm(unixTime));
      	$("#schedule3_5").val(value);
      	
      	
      	
      }	else if(Number($("#u5t1").val()) != 0 &&
  			Number($("#u5t2").val()) != 0 &&
  			Number($("#u5t3").val())!=0 &&
  			unixTime < Number($("#u5t1").val())){
  	$("#u5t1").val(unixTime);
  	$("#u5t1_1").val(fn_unixhm(unixTime));
  	$("#schedule1_5").val(value);
  	
  	
  	
     }	else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t1").val()) &&
				unixTime < Number($("#u5t2").val()) &&
				unixTime < Number($("#u5t2").val())-10800){
		$("#u5t1").val(unixTime);
		$("#u5t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_5").val(value);
	
		
     }	else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t1").val()) &&
				unixTime < Number($("#u5t2").val()) &&
				unixTime > Number($("#u5t2").val())-10800 &&
				unixTime > Number($("#u5t1").val())+10800){
  	   
		$("#u5t2").val(unixTime);
		$("#u5t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_5").val(value);
	
     }	else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t1").val()) &&
				unixTime < Number($("#u5t2").val()) &&
				unixTime > Number($("#u5t2").val())-10800 &&
				unixTime < Number($("#u5t1").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
    	 	return false;
  	   
  	   
     }	else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t2").val()) &&
				unixTime < Number($("#u5t3").val()) &&
				unixTime < Number($("#u5t3").val())-10800 &&
				unixTime > Number($("#u5t1").val())+10800){
  	   
  	    $("#u5t2").val(unixTime);
	   		$("#u5t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_5").val(value);
  	   
  	   
     }else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t2").val()) &&
				unixTime < Number($("#u5t3").val()) &&
				unixTime > Number($("#u5t3").val())-10800 &&
				unixTime < Number($("#u5t2").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
   	 	return false;
  	   
  	   
     }	else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t2").val()) &&
				unixTime < Number($("#u5t3").val()) &&
				unixTime > Number($("#u5t3").val())-10800 &&
				unixTime > Number($("#u5t2").val())+10800){
  	   
  	   $("#u5t3").val(unixTime);
	   		$("#u5t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_5").val(value);
  	   
  	   
     }	else if(Number($("#u5t1").val()) != 0 &&
	   			Number($("#u5t2").val()) != 0 &&
				Number($("#u5t3").val())!=0 &&
				unixTime > Number($("#u5t3").val())){
  	   
  	    $("#u5t3").val(unixTime);
	   		$("#u5t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_5").val(value);
  	   
  	   
     }
	  });
	  
	  
	});
	
	
$(document).ready(function() {						//////////////////////////////////// 여섯번째날
	  
	  $(".select-box6").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u6t1").val()) == 0 &&
	    	Number($("#u6t2").val())==0 &&
	    	Number($("#u6t3").val())==0) {
	    	$("#u6t1").val(unixTime);
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_6").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u6t1").val()) != 0 &&
  			Number($("#u6t2").val())==0 &&
  			Number($("#u6t3").val())==0 &&
  			unixTime < Number($("#u6t1").val()) &&
  			unixTime + 10800 < Number($("#u6t1").val())){
	    	$("#u6t2").val($("#u6t1").val());
	    	$("#u6t2_1").val($("#u6t1_1").val());
	    	$("#u6t1").val(unixTime);
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_6").val($("#schedule1_6").val());
	    	$("#schedule1_6").val(value);
	    	
	    } else if (Number($("#u6t1").val()) != 0 &&
	    			Number($("#u6t2").val())==0 &&
	    			Number($("#u6t3").val())==0 &&
	    			unixTime < Number($("#u6t1").val()) &&
	    			unixTime + 10800 > Number($("#u6t1").val())) {
	    	$("#u6t1").val(unixTime);
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_6").val(value);
	      
	    	
	    } else if (Number($("#u6t1").val()) != 0 &&
  			Number($("#u6t2").val())==0 &&
  			Number($("#u6t3").val())==0 &&
  			unixTime > Number($("#u6t1").val()) &&
  			unixTime  < Number($("#u6t1").val())+ 10800) {
	    	$("#u6t1").val(unixTime);
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_6").val(value);
    
  	
 		 }  else if(Number($("#u6t1").val()) != 0 &&
		    		Number($("#u6t2").val())==0 &&
	    			Number($("#u6t3").val())==0 &&
	    		   unixTime > Number($("#u6t1").val()) + 10800){
	    	$("#u6t2").val(unixTime);
	    	$("#u6t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_6").val(value);
	      
	      
	    }else if(Number($("#u6t1").val()) != 0 &&
				Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())==0 &&
				unixTime < Number($("#u6t1").val()) &&
				unixTime < Number($("#u6t1").val()) -10800){
	   		$("#u6t3").val($("#u6t2").val());
	    	$("#u6t2").val($("#u6t1").val());
	    	$("#u6t1").val(unixTime);
	    	
	    	$("#u6t3_1").val($("#u6t2_1").val());
	    	$("#u6t2_1").val($("#u6t1_1").val());
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_6").val($("#schedule1_6").val());
	    	$("#schedule3_6").val($("#schedule2_6").val());
	    	$("#schedule1_6").val(value);
  	
  }
 		 
 		 else if(Number($("#u6t1").val()) != 0 &&
	    			Number($("#u6t2").val()) != 0 &&
	    			Number($("#u6t3").val())==0 &&
	    			unixTime < Number($("#u6t1").val())){	// 2칸일때
	    	$("#u6t1").val(unixTime);
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_6").val(value);
	    
	    }    else if(Number($("#u6t1").val()) != 0 &&
	    			Number($("#u6t2").val()) != 0 &&
	    			Number($("#u6t3").val())==0 &&
	    			unixTime > Number($("#u6t1").val()) &&
	    			unixTime < Number($("#u6t2").val()) &&
	    			unixTime > Number($("#u6t1").val()) +10800 &&
	    			unixTime < Number($("#u6t2").val())-10800){
	    	$("#u6t3").val($("#u6t2").val());
	    	$("#u6t2").val(unixTime);
	    	$("#u6t3_1").val($("#u6t2_1").val());
	    	$("#u6t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_6").val($("#schedule2_6").val());
	    	$("#schedule2_6").val(value);
	    	
	    }	else if(Number($("#u6t1").val()) != 0 &&
  			Number($("#u6t2").val()) != 0 &&
  			Number($("#u6t3").val())==0 &&
  			unixTime > Number($("#u6t1").val()) &&
  			unixTime < Number($("#u6t1").val()) +10800 &&
  			unixTime < Number($("#u6t2").val())-10800){
	    	$("#u6t1").val(unixTime);
	    	$("#u6t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_6").val(value);
  	
  	}
	    
	    	else if(Number($("#u6t1").val()) != 0 &&
	    			Number($("#u6t2").val()) != 0 &&
	    			Number($("#u6t3").val())==0 &&
	    			unixTime > Number($("#u6t1").val()) &&
	    			unixTime > Number($("#u6t2").val())-10800 &&
	    			unixTime < Number($("#u6t1").val())+10800 &&
	    			unixTime < Number($("#u6t2").val())){
  	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
  	return false;
  	
      } 	else if(Number($("#u6t1").val()) != 0 &&
	    			Number($("#u6t2").val()) != 0 &&
	    			Number($("#u6t3").val())==0 &&
	    			unixTime > Number($("#u6t2").val()) &&
	    			unixTime < Number($("#u6t2").val())+10800){
      	$("#u6t2").val(unixTime);
      	$("#u6t2_1").val(fn_unixhm(unixTime));
      	$("#schedule2_6").val(value);
      	
      	
      } 	else if(Number($("#u6t1").val()) != 0 &&
  			Number($("#u6t2").val()) != 0 &&
  			Number($("#u6t3").val())==0 &&
  			unixTime < Number($("#u6t2").val()) &&
  			unixTime > Number($("#u6t1").val())+10800){
  	$("#u6t2").val(unixTime);
  	$("#u6t2_1").val(fn_unixhm(unixTime));
  	$("#schedule2_6").val(value);
  	
  	
  }	else if(Number($("#u6t1").val()) != 0 &&
	    			Number($("#u6t2").val()) != 0 &&
	    			Number($("#u6t3").val())==0 &&
	    			unixTime > Number($("#u6t2").val()) &&
	    			unixTime > Number($("#u6t2").val())+10800){
      	$("#u6t3").val(unixTime);
      	$("#u6t3_1").val(fn_unixhm(unixTime));
      	$("#schedule3_6").val(value);
      	
      	
      	
      }	else if(Number($("#u6t1").val()) != 0 &&
  			Number($("#u6t2").val()) != 0 &&
  			Number($("#u6t3").val())!=0 &&
  			unixTime < Number($("#u6t1").val())){
  	$("#u6t1").val(unixTime);
  	$("#u6t1_1").val(fn_unixhm(unixTime));
  	$("#schedule1_6").val(value);
  	
  	
  	
     }	else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t1").val()) &&
				unixTime < Number($("#u6t2").val()) &&
				unixTime < Number($("#u6t2").val())-10800){
		$("#u6t1").val(unixTime);
		$("#u6t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_6").val(value);
	
		
     }	else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t1").val()) &&
				unixTime < Number($("#u6t2").val()) &&
				unixTime > Number($("#u6t2").val())-10800 &&
				unixTime > Number($("#u6t1").val())+10800){
  	   
		$("#u6t2").val(unixTime);
		$("#u6t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_6").val(value);
	
     }	else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t1").val()) &&
				unixTime < Number($("#u6t2").val()) &&
				unixTime > Number($("#u6t2").val())-10800 &&
				unixTime < Number($("#u6t1").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
    	 	return false;
  	   
  	   
     }	else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t2").val()) &&
				unixTime < Number($("#u6t3").val()) &&
				unixTime < Number($("#u6t3").val())-10800 &&
				unixTime > Number($("#u6t1").val())+10800){
  	   
  	    $("#u6t2").val(unixTime);
	   		$("#u6t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_6").val(value);
  	   
  	   
     }else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t2").val()) &&
				unixTime < Number($("#u6t3").val()) &&
				unixTime > Number($("#u6t3").val())-10800 &&
				unixTime < Number($("#u6t2").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
   	 	return false;
  	   
  	   
     }	else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t2").val()) &&
				unixTime < Number($("#u6t3").val()) &&
				unixTime > Number($("#u6t3").val())-10800 &&
				unixTime > Number($("#u6t2").val())+10800){
  	   
  	   $("#u6t3").val(unixTime);
	   		$("#u6t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_6").val(value);
  	   
  	   
     }	else if(Number($("#u6t1").val()) != 0 &&
	   			Number($("#u6t2").val()) != 0 &&
				Number($("#u6t3").val())!=0 &&
				unixTime > Number($("#u6t3").val())){
  	   
  	    $("#u6t3").val(unixTime);
	   		$("#u6t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_6").val(value);
  	   
  	   
     }
	  });
	  
	  
	});
	
	
$(document).ready(function() {						//////////////////////////////////// 일곱번째날
	  
	  $(".select-box7").on("change", function() {
	    var value = $(this).val();  // 체인지한 셀렉상자 값
	    
	    const [datePart, timePart] = value.split(" ");
	    const [year, month, day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTime = Math.floor(dateObj.getTime() / 1000);
	    
	    //처음상태
	    if (Number($("#u7t1").val()) == 0 &&
	    	Number($("#u7t2").val())==0 &&
	    	Number($("#u7t3").val())==0) {
	    	$("#u7t1").val(unixTime);
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_7").val(value);
	      
	    	//첫탐있고 둘탐없고 현선택값 첫탐보다 작음
	    } else if(Number($("#u7t1").val()) != 0 &&
  			Number($("#u7t2").val())==0 &&
  			Number($("#u7t3").val())==0 &&
  			unixTime < Number($("#u7t1").val()) &&
  			unixTime + 10800 < Number($("#u7t1").val())){
	    	$("#u7t2").val($("#u7t1").val());
	    	$("#u7t2_1").val($("#u7t1_1").val());
	    	$("#u7t1").val(unixTime);
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_7").val($("#schedule1_7").val());
	    	$("#schedule1_7").val(value);
	    	
	    } else if (Number($("#u7t1").val()) != 0 &&
	    			Number($("#u7t2").val())==0 &&
	    			Number($("#u7t3").val())==0 &&
	    			unixTime < Number($("#u7t1").val()) &&
	    			unixTime + 10800 > Number($("#u7t1").val())) {
	    	$("#u7t1").val(unixTime);
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_7").val(value);
	      
	    	
	    } else if (Number($("#u7t1").val()) != 0 &&
  			Number($("#u7t2").val())==0 &&
  			Number($("#u7t3").val())==0 &&
  			unixTime > Number($("#u7t1").val()) &&
  			unixTime  < Number($("#u7t1").val())+ 10800) {
	    	$("#u7t1").val(unixTime);
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_7").val(value);
    
  	
 		 }  else if(Number($("#u7t1").val()) != 0 &&
		    		Number($("#u7t2").val())==0 &&
	    			Number($("#u7t3").val())==0 &&
	    		   unixTime > Number($("#u7t1").val()) + 10800){
	    	$("#u7t2").val(unixTime);
	    	$("#u7t2_1").val(fn_unixhm(unixTime));
	    	$("#schedule2_7").val(value);
	      
	      
	    }else if(Number($("#u7t1").val()) != 0 &&
				Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())==0 &&
				unixTime < Number($("#u7t1").val()) &&
				unixTime < Number($("#u7t1").val()) -10800){
	   		$("#u7t3").val($("#u7t2").val());
	    	$("#u7t2").val($("#u7t1").val());
	    	$("#u7t1").val(unixTime);
	    	
	    	$("#u7t3_1").val($("#u7t2_1").val());
	    	$("#u7t2_1").val($("#u7t1_1").val());
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule2_7").val($("#schedule1_7").val());
	    	$("#schedule3_7").val($("#schedule2_7").val());
	    	$("#schedule1_7").val(value);
  	
  }
 		 
 		 else if(Number($("#u7t1").val()) != 0 &&
	    			Number($("#u7t2").val()) != 0 &&
	    			Number($("#u7t3").val())==0 &&
	    			unixTime < Number($("#u7t1").val())){	// 2칸일때
	    	$("#u7t1").val(unixTime);
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_7").val(value);
	    
	    }    else if(Number($("#u7t1").val()) != 0 &&
	    			Number($("#u7t2").val()) != 0 &&
	    			Number($("#u7t3").val())==0 &&
	    			unixTime > Number($("#u7t1").val()) &&
	    			unixTime < Number($("#u7t2").val()) &&
	    			unixTime > Number($("#u7t1").val()) +10800 &&
	    			unixTime < Number($("#u7t2").val())-10800){
	    	$("#u7t3").val($("#u7t2").val());
	    	$("#u7t2").val(unixTime);
	    	$("#u7t3_1").val($("#u7t2_1").val());
	    	$("#u7t2_1").val(fn_unixhm(unixTime));
	    	
	    	$("#schedule3_7").val($("#schedule2_7").val());
	    	$("#schedule2_7").val(value);
	    	
	    }	else if(Number($("#u7t1").val()) != 0 &&
  			Number($("#u7t2").val()) != 0 &&
  			Number($("#u7t3").val())==0 &&
  			unixTime > Number($("#u7t1").val()) &&
  			unixTime < Number($("#u7t1").val()) +10800 &&
  			unixTime < Number($("#u7t2").val())-10800){
	    	$("#u7t1").val(unixTime);
	    	$("#u7t1_1").val(fn_unixhm(unixTime));
	    	$("#schedule1_7").val(value);
  	
  	}
	    
	    	else if(Number($("#u7t1").val()) != 0 &&
	    			Number($("#u7t2").val()) != 0 &&
	    			Number($("#u7t3").val())==0 &&
	    			unixTime > Number($("#u7t1").val()) &&
	    			unixTime > Number($("#u7t2").val())-10800 &&
	    			unixTime < Number($("#u7t1").val())+10800 &&
	    			unixTime < Number($("#u7t2").val())){
  	alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.")
  	return false;
  	
      } 	else if(Number($("#u7t1").val()) != 0 &&
	    			Number($("#u7t2").val()) != 0 &&
	    			Number($("#u7t3").val())==0 &&
	    			unixTime > Number($("#u7t2").val()) &&
	    			unixTime < Number($("#u7t2").val())+10800){
      	$("#u7t2").val(unixTime);
      	$("#u7t2_1").val(fn_unixhm(unixTime));
      	$("#schedule2_7").val(value);
      	
      	
      } 	else if(Number($("#u7t1").val()) != 0 &&
  			Number($("#u7t2").val()) != 0 &&
  			Number($("#u7t3").val())==0 &&
  			unixTime < Number($("#u7t2").val()) &&
  			unixTime > Number($("#u7t1").val())+10800){
  	$("#u7t2").val(unixTime);
  	$("#u7t2_1").val(fn_unixhm(unixTime));
  	$("#schedule2_7").val(value);
  	
  	
  }	else if(Number($("#u7t1").val()) != 0 &&
	    			Number($("#u7t2").val()) != 0 &&
	    			Number($("#u7t3").val())==0 &&
	    			unixTime > Number($("#u7t2").val()) &&
	    			unixTime > Number($("#u7t2").val())+10800){
      	$("#u7t3").val(unixTime);
      	$("#u7t3_1").val(fn_unixhm(unixTime));
      	$("#schedule3_7").val(value);
      	
      	
      	
      }	else if(Number($("#u7t1").val()) != 0 &&
  			Number($("#u7t2").val()) != 0 &&
  			Number($("#u7t3").val())!=0 &&
  			unixTime < Number($("#u7t1").val())){
  	$("#u7t1").val(unixTime);
  	$("#u7t1_1").val(fn_unixhm(unixTime));
  	$("#schedule1_7").val(value);
  	
  	
  	
     }	else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t1").val()) &&
				unixTime < Number($("#u7t2").val()) &&
				unixTime < Number($("#u7t2").val())-10800){
		$("#u7t1").val(unixTime);
		$("#u7t1_1").val(fn_unixhm(unixTime));
		$("#schedule1_7").val(value);
	
		
     }	else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t1").val()) &&
				unixTime < Number($("#u7t2").val()) &&
				unixTime > Number($("#u7t2").val())-10800 &&
				unixTime > Number($("#u7t1").val())+10800){
  	   
		$("#u7t2").val(unixTime);
		$("#u7t2_1").val(fn_unixhm(unixTime));
		$("#schedule2_7").val(value);
	
     }	else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t1").val()) &&
				unixTime < Number($("#u7t2").val()) &&
				unixTime > Number($("#u7t2").val())-10800 &&
				unixTime < Number($("#u7t1").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
    	 	return false;
  	   
  	   
     }	else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t2").val()) &&
				unixTime < Number($("#u7t3").val()) &&
				unixTime < Number($("#u7t3").val())-10800 &&
				unixTime > Number($("#u7t1").val())+10800){
  	   
  	    $("#u7t2").val(unixTime);
	   		$("#u7t2_1").val(fn_unixhm(unixTime));
	   		$("#schedule2_7").val(value);
  	   
  	   
     }else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t2").val()) &&
				unixTime < Number($("#u7t3").val()) &&
				unixTime > Number($("#u7t3").val())-10800 &&
				unixTime < Number($("#u7t2").val())+10800){
  	   
  	   alert("상영시간은 각각 3시간 이상의 시차가 필요합니다.");
   	 	return false;
  	   
  	   
     }	else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t2").val()) &&
				unixTime < Number($("#u7t3").val()) &&
				unixTime > Number($("#u7t3").val())-10800 &&
				unixTime > Number($("#u7t2").val())+10800){
  	   
  	   $("#u7t3").val(unixTime);
	   		$("#u7t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_7").val(value);
  	   
  	   
     }	else if(Number($("#u7t1").val()) != 0 &&
	   			Number($("#u7t2").val()) != 0 &&
				Number($("#u7t3").val())!=0 &&
				unixTime > Number($("#u7t3").val())){
  	   
  	    $("#u7t3").val(unixTime);
	   		$("#u7t3_1").val(fn_unixhm(unixTime));
	   		$("#schedule3_7").val(value);
  	   
  	   
     }
	  });
	  
	  
	});
  
  
  
  function fn_unixhm(unixTime){
	  const dateObj = new Date(unixTime * 1000);
	    const hours = String(dateObj.getHours()).padStart(2, '0'); // 시간을 문자열로 변환하고 2자리로 맞춤
	    const minutes = String(dateObj.getMinutes()).padStart(2, '0'); // 분을 문자열로 변환하고 2자리로 맞춤
	    const hm = hours + ":" + minutes;
	    return hm;
  }
</script>

<body>
<section style="background-color:white; width:1000px; height:1000px; text-align:center;">
<form name="frm" id="frm">
  <table border="1" width="500">
    <colgroup>
      <col width="30%" />
      <col width="70%" />
    </colgroup>
    <tr>
      <th>영업점</th>
      <td>
      	<input type="text" name="mvlocation" name="mvlocation" id="mvlocation" value="${v.branch }" readonly>
      </td>
    </tr>
    <tr>
      <th>이름</th>
      <td><input type="text" name="mvtitle" id="mvtitle" value="${vo.mvtitle }" readonly></td>
    </tr>
    <tr>
      <th>상영관</th>
      <td>
     	 <select name="mvroom" id="mvroom">
     	 	<c:forEach var="list" items="${list }">
		 	 <option value="${list.theater }/${list.seats }">${list.theater } (좌석수:${list.seats })</option>
		 	 </c:forEach>
		</select>
      </td>
    </tr>
    <tr>
      <th>등급</th>
      <td><input type="text" name="mvgrade" id="mvgrade" value="${vo.mvgrade }" readonly></td>
    </tr>
    <tr>
      <th>상영기간</th>
      <td><input style="width:40%;" type="text" name="startday" id="startday" value="${vo.startday }" readonly>&nbsp~&nbsp<input style="width:40%;" type="text" name="lastday" id="lastday" value="${vo.lastday }" readonly></td>
    </tr>
    <tr>
      <th>영화볼륨</th>
      <td><input type="text" name="mvvolume" id="mvvolume" value="${vo.mvvolume}" readonly></td>
    </tr>
    	<input type="hidden" name="mvpost" id="mvpost" value="${vo.mvpost }">
  </table>

  <table border="1" width="500">
  <c:set var="sday" value="${vo.sday}"/>
  <c:set var="lday" value="${vo.lday}"/>
  <c:set var="lastDayOfMonth" value="${vo.lastDayOfMonth}"/>
    <% 
    
    int sday = (int) pageContext.getAttribute("sday");
    int lday = (int) pageContext.getAttribute("lday");
    int lastDayOfMonth = (int) pageContext.getAttribute("lastDayOfMonth");
    int cnt = 1;
    if(sday<lday){
    	
    
    
    for (int j = sday; j <= lday; j++) { 
    	
    %>
    <tr>
      <td colspan="16"><%= j %>일</td>
    </tr>
    <tr>
      <% for (int z = 9; z <= 23; z++) { %>
      <td>
        <span class="toggleButton"><%= z %></span>
        <div class="select-box-popup">
          <select name="mvtimes" class="select-box<%=cnt%>">
          <option value="선택" selected>선택</option>
          <% for (int i = 0; i < 56; i=i+5) {%>
            <option value="${vo.syear}-${vo.smonth }-<%=j %> <%=z %>:<%=i%>"><%=i %>분</option>
          <% } %>
          </select>
        </div>
      </td>
      <% } %>
    </tr>
    <tr>
    	<td colspan="15">
    		<input type="hidden" value="0" id="u<%=cnt%>t1" name="u<%=cnt%>t1">
			<input type="hidden" value="0" id="u<%=cnt%>t2" name="u<%=cnt%>t2">
			<input type="hidden" value="0" id="u<%=cnt%>t3" name="u<%=cnt%>t3">
			<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t1_1" readonly>
			<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t2_1" readonly>
			<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t3_1" readonly>
			<input type="hidden" value="0" name="schedule1_<%=cnt%>" id="schedule1_<%=cnt%>">
			<input type="hidden" value="0" name="schedule2_<%=cnt%>" id="schedule2_<%=cnt%>">
			<input type="hidden" value="0" name="schedule3_<%=cnt%>" id="schedule3_<%=cnt%>">
    	</td>
    </tr>
    
    <% cnt++; } %>
    </table>
    <%
    }else {
    	
    	
    	 for (int j = sday; j <= lastDayOfMonth; j++) { 
    	    	
    		    %>
    		    <tr>
    		      <td colspan="16"><%= j %>일</td>
    		    </tr>
    		    <tr>
    		      <% for (int z = 9; z <= 23; z++) { %>
    		      <td>
    		        <span class="toggleButton"><%= z %></span>
    		        <div class="select-box-popup">
    		          <select name="mvtimes" class="select-box<%=cnt%>">
    		          <option value="선택" selected>선택</option>
    		          <% for (int i = 0; i < 56; i=i+5) {%>
    		            <option value="${vo.syear}-${vo.smonth }-<%=j %> <%=z %>:<%=i%>"><%=i %>분</option>
    		          <% } %>
    		          </select>
    		        </div>
    		      </td>
    		      <% } %>
    		    </tr>
    		    <tr>
    		    	<td colspan="15">
    		    		<input type="hidden" value="0" id="u<%=cnt%>t1" name="u<%=cnt%>t1">
    					<input type="hidden" value="0" id="u<%=cnt%>t2" name="u<%=cnt%>t2">
    					<input type="hidden" value="0" id="u<%=cnt%>t3" name="u<%=cnt%>t3">
    					<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t1_1" readonly>
    					<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t2_1" readonly>
    					<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t3_1" readonly>
    					<input type="hidden" value="0" name="schedule1_<%=cnt%>" id="schedule1_<%=cnt%>">
    					<input type="hidden" value="0" name="schedule2_<%=cnt%>" id="schedule2_<%=cnt%>">
    					<input type="hidden" value="0" name="schedule3_<%=cnt%>" id="schedule3_<%=cnt%>">
    		    	</td>
    		    </tr>
    		    <% cnt++; } 
    	
    	 for (int j = 1; j <= lday; j++) { 
 	    	
 		    %>
 		    <tr>
 		      <td colspan="16"><%= j %>일</td>
 		    </tr>
 		    <tr>
 		      <% for (int z = 9; z <= 23; z++) { %>
 		      <td>
 		        <span class="toggleButton"><%= z %></span>
 		        <div class="select-box-popup">
 		          <select name="mvtimes" class="select-box<%=cnt%>">
 		          <option value="선택" selected>선택</option>
 		          <% for (int i = 0; i < 56; i=i+5) {%>
 		            <option value="${vo.syear}-${vo.lmonth }-<%=j %> <%=z %>:<%=i%>"><%=i %>분</option>
 		          <% } %>
 		          </select>
 		        </div>
 		      </td>
 		      <% } %>
 		    </tr>
 		    <tr>
 		    	<td colspan="15">
 		    		<input type="hidden" value="0" id="u<%=cnt%>t1" name="u<%=cnt%>t1">
 					<input type="hidden" value="0" id="u<%=cnt%>t2" name="u<%=cnt%>t2">
 					<input type="hidden" value="0" id="u<%=cnt%>t3" name="u<%=cnt%>t3">
 					<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t1_1" readonly>
 					<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t2_1" readonly>
 					<input style="width:30%;" type="text" value="0" id="u<%=cnt%>t3_1" readonly>
 					<input type="hidden" value="0" name="schedule1_<%=cnt%>" id="schedule1_<%=cnt%>">
 					<input type="hidden" value="0" name="schedule2_<%=cnt%>" id="schedule2_<%=cnt%>">
 					<input type="hidden" value="0" name="schedule3_<%=cnt%>" id="schedule3_<%=cnt%>">
 		    	</td>
 		    </tr>
 		    <% cnt++; } 
    	 
    	 
    	 %></table><%
    }%>
    
    
  <div>
    <button type="submit" id="button1" onclick="return false;">저장</button>
    <button type="reset">다시 작성하기</button>
    <button type="button" onclick="location='adminMovieInfoList.do'">영화리스트로</button>
  </div>
</form>
</section>

</body>
</html>

