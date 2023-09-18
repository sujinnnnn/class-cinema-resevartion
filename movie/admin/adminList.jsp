<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  

<!DOCTYPE html>
<html>




<head>       
<meta charset="UTF-8">
<title>관리자 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<style>

.table1 {
     background-color: white;
    width: 50%;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 10px;
    border-collapse: collapse;
    align:center;
   width:98%;
   border-top:2px solid #555;
   border-bottom:1px solid #ccc;
   border-collapse:collapse;
   margin-top:30px;
   margin-left:5px;
   font-size:12px;
  }  

.table1 th {
   border-top:1px solid #cccccc;
   padding:5px;
   height:25px;
}
.table1 td {
   text-align:center;
   border-top:1px solid #cccccc;
   padding:5px;
   height:25px;
}
  .bb:hover{
     background-color:lightsalmon;     
  }
  .aa:hover {
     background-color:white;
     color:black;
  }
  
    select, input[type="text"], input[type="date"], input[type="file"] {
    width: 100px;
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
.button2 {
   padding: 5px 10px;
   margin: 2px;
   background-color: grey;
   border: none;
   border-radius: 4px;
   color: white;
   cursor: pointer;
}
.list{
   text-align:center; 
   width:800px; 
   
   position:relative;
   left:200px;
}
.list2{
   text-align:center; 
   width:800px;    
   position:relative;
   left:300px;
}
a:hover{
   color:white;
   cursor:pointer;
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
<script>

function fn_popup(adminid) {   
   let url = "/adminModify.do?adminid="+adminid;
   window.open(url,"아프리카","width=500,height=350");
}


function fn_delete(adminid,branch) {   
   if(confirm("지점에 등록된 모든 정보가 삭제됩니다, 정말로 삭제 하시겠습니까?")){
      location="/adminDelete.do?adminid="+adminid+"&branch="+branch;     
   }
   
   
   
}

</script>


<body>
<div class="d1" style="position:absolute; left:50%; transform:translateX(-50%);">
   <nav>
      <%@ include file="../../mvinclude/mvadminnav.jsp" %> 
   </nav>

   
<div class="header">   
   <h1 class="title">관리자목록</h1>
</div>

<div>
<table class="table1" align="center">
   <tr>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>영업점</th>
      <th>수정/삭제</th>
   </tr>
   <c:forEach var="list" items="${resultList}" varStatus="status">
   <tr>
      <td>${list.adminid }</td>
      <td>${list.adminpw }</td>
      <td>${list.branch }</td>
      <td>
      <c:if test="${list.adminid=='root'}">
         &nbsp;
      </c:if>
      <c:if test="${list.adminid!='root'}">
         <button type="button" onclick="fn_popup('${list.adminid }')" class="button1">수정하기</button>
        <button type="button" onclick="fn_delete('${list.adminid }','${list.branch }')" class="button2">삭제</button>
      </c:if>
      </td>
        
   </tr>
   </c:forEach>
</table>
</div>
<div>
<button type="button" onclick="location='adminMain.do'">메인으로 이동</button>
</div>
</div>
   
</body>
</html>