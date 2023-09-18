<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화스케줄수정</title>
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
</style>

<script>
$(function(){
	
	$("#button1").click(function(){
		
		
		
		var form = $("#frm").serialize();	//serialize : 폼안의 데이터 값들을 한번에 전송가능 상태로 만듬 - 방식1
		
		
		$.ajax({
			type : "POST",					
			data : form,					//var form		 
			url	 :"/adminMovieScheduleWriteSave.do",
			datatype: "text",				//json : ?????
			success : function(data){		//function(data) : data 값을 전달받음
				if(data=="ok"){
				alert("저장완료");
				location="/adminMovieScheduleList.do"
				}  else {
					alert("저장실패");
				}
			},
			error : function(){
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
  
  $(document).ready(function() {
	  $(".select-box").on("change", function() {
	    var value = $(this).val();			//체인지한 셀렉상자 값
	    
	    
	    const [datePart, timePart] = value.split(" ");
	    const [ year,month,day] = datePart.split("-").map(Number);
	    const [hour, minute] = timePart.split(":").map(Number);
	    const dateObj = new Date(year, month - 1, day, hour, minute);
	    const unixTimeInSeconds = Math.floor(dateObj.getTime() / 1000);
	    alert(value+"유닉스타임:"+unixTimeInSeconds);
	    
	    if (Number($("#t1").val())!=0&&unixTimeInSeconds > Number($("#t1").val()) + 10000) {
	        $("#t2").val(unixTimeInSeconds);
	      } else{
	    	  $("#t1").val(unixTimeInSeconds);
	      }
	    
	  });
	});
</script>

<body>

<form name="frm" id="frm" method="get" action="adminMovieScheduleWriteSave.do">
  <table border="1" width="500">
    <colgroup>
      <col width="50%" />
      <col width="50%" />
    </colgroup>
    <tr>
      <th>담당자</th>
      <td><input type="text" name="mvlocation" id="mvlocation" value="${vo.mvlocation }"></td>
    </tr>
    <tr>
      <th>이름</th>
      <td><input type="text" name="mvtitle" id="mvtitle" value="${vo.mvtitle }"></td>
    </tr>
    <tr>
      <th>상영관</th>
      <td><input type="text" name="mvroom" id="mvroom" value="${vo.mvroom }"></td>
    </tr>
    <tr>
      <th>등급</th>
      <td><input type="text" name="mvgrade" id="mvgrade" value="${vo.mvgrade }"></td>
    </tr>
    <tr>
      <th>상영기간</th>
      <td><input type="text" name="startday" id="startday" value="${vo.startday }">~<input type="text" name="lastday" id="lastday" value="${vo.lastday }"></td>
    </tr>
    <tr>
      <th>영화볼륨</th>
      <td><input type="text" name="mvvolume" id="mvvolume" value="1"></td>
    </tr>
  </table>

  <table border="1" width="500">
    <% for (int j = 1; j < 5; j++) { %>
    <tr>
      <td colspan="16"><%= j %>일</td>
    </tr>
    <tr>
      <% for (int z = 9; z <= 24; z++) { %>
      <td>
        <span class="toggleButton"><%= z %></span>
        <div class="select-box-popup">
          <select name="mvtimes" class="select-box">
          <option value="선택" selected>선택</option>
          <% for (int i = 0; i < 56; i=i+5) {%>
            <option value="2023/07/<%=j %> <%=z %>:<%=i%>"><%=i %>분</option>
          <% } %>
          </select>
        </div>
      </td>
      <% } %>
    </tr>
    <tr>
    	<td colspan="16">
    		<input type="text" value="0" name="t1" id="t1">
			<input type="text" value="0" name="t2" id="t2">
			<input type="text" value="0" name="t3" id="t3">
			<input type="text" value="0" name="t4" id="t4">
			<input type="text" value="0" name="t5" id="t5">
    	</td>
    </tr>
    <% } %>
  </table>
  <div>
    <button type="submit">저장</button>
    <button type="reset">취소</button>
  </div>
</form>


</body>
</html>