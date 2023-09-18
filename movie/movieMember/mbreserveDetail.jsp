<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
        // 현재 날짜 객체 생성
        Date currentDate = new Date();
        
        // 날짜 형식 지정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        // 포맷팅된 현재 날짜 문자열 가져오기
        String formattedDate = sdf.format(currentDate);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>



<style>

body {
   font-size:12px;
   text-align:center;
}

a {
   text-decoration:none;
   color:black;
}


/* 상단메뉴 */
table.mainmenu2 {
   width:1200px;
   text-align:center;
   border-collapse:collapse;
   margin-top:10px;
   margin-bottom:5px;
}

table.mainmenu2 th{
   text-align:center;
   font-size:20px;
   padding:5px;
}


/* 하단메뉴 */
table.downmenu {
   width:1200px;
   text-align:center;
}

table.downmenu td {
   border-right:1px solid black;
}

table.t1 {
   width:1200px;
   text-align:center;
   border-collapse:collapse;
   margin-top:10px;
   margin-bottom:5px;
}

table.t2 {
   width:1000px;
   text-align:center;
   position:relative;
   left:103px;
   color:white;
}

table.t3 {
   width:900px;
   margin-top:5spx; 
   margin-bottom:5px;
}

table.t3 td {
   text-align:left;
}

table.t3 input,textarea {
   width:95%;
}
</style>

<style>
.movieimage {
    width: 150px;
    height: 200px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}

img.grade {
   width:20px;
   height:20px;
   background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    position:relative;
    top:4.5px;
    right:4px;
}

img.link1 {
   width:15px;
   height:15px;
   background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    position:relative;
    top:2.5px;
    right:2px;
}

button.ticket {
   width:100px;
   height:35px;
   border-radius:0px;
   border:1px solid white;
   cursor:pointer;
   color:black;
   background-color: #000000;
    background-color: rgba( 0, 0, 0, 0.5 );
}
table.ticket {
   background-color: #000000;
    background-color: rgba( 0, 0, 0, 0.5 );
}
</style>
<style>
        body {
           font-family: 'Arial', sans-serif;

            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .title {
            margin: 0;
        }

        .container {
            margin: 30px auto;
            width: 80%;
        }

        .table1 {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom:400px;
            font-size: 14px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .table1 th, .table1 td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .table1 th {
            background-color: #f7f7f7;
        }

        .table1 tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .fa-film {
            color: #e74c3c;
        }
        
        
    </style>
    <style>
    
    body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #White;
}

.container {
    margin: 20px auto;
    width: 80%;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    
}

.container h1 {
    margin: 0;
    padding: 10px;
    font-size: 24px;
    color: #333;
    background-color: #f7f7f7;
    border-radius: 4px;
    box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.1);
}

.container table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    margin-bottom: 20px;
    font-size: 14px;
}

.container th, .container td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.container th {
    background-color: #f7f7f7;
}

.container tr:nth-child(even) {
    background-color: #f2f2f2;
}

.container button {
    padding: 5px 10px;
    margin: 2px;
    background-color: red;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
}

</style>
</head>

<body>

<div class="d1"  style="position:absolute; left:50%; transform:translateX(-50%);">
 
    <header>
      <img src=""> <!-- 광고?? -->
   </header>
    <!-- 탑메뉴 -->
    <nav>
        <%@ include file="../../mvinclude/mvnav.jsp" %>
    </nav>




<script>

function fn_delete(title,schedule,date,seats) {   
      if(confirm("예매를 취소하시겠습니까?")){
         location="/mbrDelete.do?mvtitle="+title+"&mvschedule="+schedule+"&mvdate="+date+"&seats="+seats;
}
      
}      

</script>

<body>
    <header>
        <h1>MyPage</h1>       
    </header>
    <div class="container">
    <br>
   <div class="">
      <section>
      <c:if test="${vo.str!=1}">
      <form action="/" method="post">
            <table>
            
                <tr>
                    <th width="25%"><font color="red">*</font> 영화</th>
                    <td width="60%">${vo.mvtitle }</td>
                    <td width="*" rowspan="6"><div class="movieimage" 
					style="background-image:url(../mvimages/moviePoster/${vo.mvpost})"></div></td>
                </tr>
                <tr>
                    <th><font color="red">*</font> 등급</th>
                    <td>${vo.mvgrade }</td>
                </tr>
                <tr>
                    <th><font color="red">*</font> 상영시간</th>
                    <td>${vo.mvschedule }</td>
                </tr>
                <tr>
                    <th><font color="red">*</font> 상영날짜</th>
                    <td>${vo.mvdate }</td>
                </tr>
                <tr>
                    <th><font color="red">*</font> 영업점</th>
                    <td>${vo.mvlocation }</td>
                </tr>
                <tr>
                    <th><font color="red">*</font> 좌석</th>
                    <td>${vo.seats }</td>
                </tr>
                <tr>
                	<c:if test="${vo.booking < vo.today }">
                	</c:if>
                	<c:if test="${vo.booking >= vo.today }">            	
                	<td colspan="3" align="right">
                        <button type="button" onclick="fn_delete('${vo.mvtitle}','${vo.mvschedule}','${vo.mvdate}','${vo.seats}')">예매취소</button>
                    </td>
                    </c:if>         
                </tr>
            </table>
        </form>
      </c:if>      
      
   </div>
   <br>
</section>
   </div>
   <footer>
            <%@ include file="../../mvinclude/mvfooter.jsp" %>
     </footer>
     
     </div>
</body>
</html>