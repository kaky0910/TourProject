<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CSS Website Layout</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

body {
  margin: 0;
}

/* Style the header */
.header {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
}

/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    background-color: #333;
}
.topnav2{
    overflow: hidden;
    background-color: #fff;
    text-align:center;

}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

/* Create three unequal columns that floats next to each other */
.column {
    float: left;
    padding: 10px;
}

/* Left and right column */
.column.side {
    width: 15%;
}

/* Middle column */
.column.middle {
    width: 50%;
}

/* Clear floats after the columns */
.row:before {
    content: "";
    display: table;
    clear: both;
   padding-top: 30px;
}
.row:after {
    content: "";
    display: table;
    clear: both;
    padding-top: 30px;
 
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .column.side, .column.middle {
        width: 100%;
    }
}

.main {
    width: 100%;
    float: left;
    box-sizing: border-box;
}
.maincontent{

    width: 70%;
    float: left;
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
    margin-left:15%;
    margin-right:15%;
    box-sizing: border-box;


}
/* Style the footer */
.footer {
    background-color: #f1f1f1;
    padding: 10px;
    text-align: center;
}
</style>
</head>
<body>

<div class="header">
  <h1>Header</h1>
</div>
<div class="maincontent">
<div class="topnav2">
<h1>Title</h1>
<h1>${rvo.title}</h1>
</div>
<hr>
<%-- ${rvo.writer} ${rvo.timeposted} ${rvo.hits}
<hr> 나중에 다시 입력--%>
<div class="row">
  <div class="main">
  <%-- <c:forEach items="${rvo}" var="rvo" > 나중에 다시 입력--%>
    
    dfdfafdfadfaf<br>
    dfafafaf<br>
    afadfafaf<br>
    afadfd<br>
    dfdfafdfadfaf<br>
    dfafafaf<br>
    afadfafaf<br>
    afadfd<br>
    dfdfafdfadfaf<br>
    dfafafaf<br>
    afadfafaf<br>
    afadfd<br>
    
    
    
    
  
<%--  </c:forEach> --%>
  </div>
  </div>

 	<input type="button" name="scrap" value="스크랩">
 	<input type="button" name="like" value="좋아요">
 
<div class="footer">
  <p>관련글(카테고리)</p>
  <p>관련글(카테고리)</p>
  <p>관련글(카테고리)</p>

  
</div>
  </div>
</body>
</html>