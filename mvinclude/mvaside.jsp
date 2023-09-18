<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.subMenu_area {
	width:100%;
	height:30px;
	text-align:center;
	background:skyblue;
	line-height:2.5;
	margin-bottom:30px;
}
.content_area {
	width:100%;
	text-align:center; 
}
.page_number_area {
	width:100%;
	text-align:center;
	padding-top:20px;
} 
.board1 {
	width:900px;
	border-top:2px solid #474747;
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
}
.board1 th {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	height:30px;
}
.board1 td {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	text-align:center;
	height:20px;
}
div {
	width:900px;
}
.adimage {
    width: 290px;
    height: 350px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
function fn_page(pageIndex) {
	
	$("#pageIndex").val(pageIndex);
	$("#searchFrm").submit();
	
// 	document.searchFrm.pageIndex.value = indexPage;
// 	document.searchFrm.submit();
}
</script>
<div width="900">
	<div class="topMenu_area">
	<div style="height:30px;">&nbsp;</div>
	<div>
	<caption><h1>공지사항</h1></caption>
    	<table class="board1">
			<colgroup>
				<col width="10%"/>
				<col width="*"/>
				<col width="15%"/>
				<col width="10%"/>
			</colgroup>	
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
			</tr>
			<tr>
				<th>1</th>
				<th><a href="#"><font color="red">롯데시네마 영상정보처리기기 운영 및 관리방침 개정 안내</font></a></th>
				<th>관리자</th>
				<th>2023-06-08</th>
			</tr>
			<tr>
				<th>2</th>
				<th><a href="#">L.PAY 한국씨티카드 시스템 작업 안내</a></th>
				<th>관리자</th>
				<th>2023-08-04</th>
			</tr>
			<tr>
				<th>3</th>
				<th><a href="#">롯데시네마 개인정보처리방침 개정 안내</a></th>
				<th>관리자</th>
				<th>2023-07-27</th>
			</tr>
			<tr>
				<th>4</th>
				<th><a href="#">롯데컬쳐웍스 개인정보 이용내역 안내</a></th>
				<th>관리자</th>
				<th>2023-07-07</th>
			</tr>
			<tr>
				<th>5</th>
				<th><a href="#">결제수단 "네이버페이" 시스템 점검으로 인한 일시 중단 안내</a></th>
				<th>관리자</th>
				<th>2023-07-01</th>
			</tr>
			<tr>
				<th>6</th>
				<th><a href="#">영화관람료 소득공제 시행 안내</a></th>
				<th>관리자</th>
				<th>2023-06-29</th>
			</tr>
		</table>
		<div width="300" style="position:absolute; left:604px; bottom:655px;">
			<a href="#"><img class="adimage" src="../mvimages/asideAD.jpg"></a>
		</div>
 	</div>
</div>
