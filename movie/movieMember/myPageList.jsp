<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매목록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   
<style>

   
  a.mvtitle {
        text-decoration: underline double green;
  
  }   
  
  .table1 {
     background-color: white;
    width: 98%;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 10px;
    border-collapse: collapse;
  }
  
  .th1, .td1 {
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
  
    .button1 {
    padding: 5px 10px;
    margin: 2px;
    background-color: red;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
  }
  
 
hearder {

}

nav {
   width:1200px;
}
section {
   width:1200px;
   text-align:center;
   background-color:black;
}

aside {
   margin-top:25px;
   text-align:center;
}

article {
   margin-top:25px;
   text-align:center;
}

body {
   font-size:12px;
   text-align:center;
}

a {
   text-decoration:none;
   color:black;
}

div.d1 {
   width:1200px;
   text-align:center;
}

div.outline {
   width:1200px;
   text-align:center;
}

div.main {
   width:1200px;
   text-align:center;
   align:center;
   item-align:center;
   border-collapse:collapse;
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
    width: 190px;
    height: 255px;
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
            margin-bottom:470px;
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

    <div class="header">
        <h1 class="title"><i class="fas fa-film"></i> 예매목록</h1>
    </div>

    <div class="container">
        <table class="table1">
            <thead>
                <tr>
                    <th>영화제목</th>
                    <th>연령제한</th>
                    <th>상영시간</th>
                    <th>상영날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${resultList}">
                    <tr>
                        <td>
                           <a href="/mbreserveDetail.do?mvtitle=${list.mvtitle}&mvschedule=${list.mvschedule}&mvdate=${list.mvdate}&userid=${sessionScope.SessionUserID}&seats=${list.seats}" class="mvtitle">${list.mvtitle}</a>
                                                
                        </td>
                        <td>${list.mvgrade}</td>
                        <td>${list.mvschedule}</td>
                        <td>${list.mvdate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
        <footer>
            <%@ include file="../../mvinclude/mvfooter.jsp" %>
        </footer>
    </div>
   
</div>
</body>
</html>