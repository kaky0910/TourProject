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
  /* background-image: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%); */
 /* background-image: linear-gradient(to top, #99ccff 0%, #fff 100%); */
 background-image: linear-gradient(to top, #d299c2 0%, #fef9d7 100%);
}
.title{
text-align : right;

}
/* Style the header */
.header {
    
    padding: 20px;
    text-align: center;
}

/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    
}
.topnav2{
    overflow: hidden;
    
    text-align:center;

}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    
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
.img{
width:450px;

height:400px;


}

/* Style the footer */
.footer {
    
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
<h1>${rvo.title}</h1>
<h3 class="title">글번호 :: ${rvo.reviewNum}</h3>
</div>
<hr>
 작성자::${rvo.id}  작성일시::${rvo.date} 좋아요::${rvo.like}
<hr>
<div class="row">
  <div class="main">
 ${rvo.content}
 <br>
   	<c:forEach  items="${rvo.images}" var="vo" >
   		<img src="${vo}" class="img">
   	</c:forEach>
 <br>
    곱창전골은 전골류의 한국 요리로, 소나 돼지의 내장과 여러가지 채소를 육수와 함께 끓여낸 음식이다. <br>
    곱창이란 소나 돼지의 작은 창자를 의미한다. 곱창전골은 곱창이 주재료이지만, 다른 부위의 내장도 많이 사용되어 내장<br>
     특유의 쫄깃한 식감으로 곱창전골의 맛을 더욱 풍부하게 한다.
    
    
  </div>
  </div>

 	<input type="button" name="scrap" value="스크랩">
 	<input type="button" name="like" value="좋아요">
 <hr>
 <div class="row">
 <h3>댓글</h3><hr>
 <c:forEach items="${rvo.comments}" var="cvo">
작성자:: ${cvo.id}    |  ${cvo.comment}<hr><br>
</c:forEach>

 </div>
<div class="footer">
  <p>관련글(카테고리)</p>
  <p>관련글(카테고리)</p>
  <p>관련글(카테고리)</p>

  
</div>
  </div>
</body>
</html>