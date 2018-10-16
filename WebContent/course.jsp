<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel="stylesheet" href="css/nav.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="js/nav.js"></script>
   <style type="text/css">
      .courseDiv {
         padding-bottom: 70px;
         margin-left: 100px;
         margin-right: 100px;
         padding-left: 25px;
      }
      .courseDiv div{
         border: 1px dotted #F9DEDE; 
         display: inline-block; 
         width: 300px; 
         height:200px;
      }
   </style>
</head>
<body>
   <%@include file="nav.jsp" %>
   <div style="height: 120px"></div>
   <div>
      <div class="courseDiv" style="border-bottom: 1px solid lightgray; margin-bottom: 70px">
         <h3>추천 코스</h3><br>
         <div id="my1" style="margin-right: 20px; margin-left: 25px">
         </div>
         <div id="my2" style="margin-right: 20px;">
         </div>
         <div id="my3" style="margin-right: 20px;">
         </div>
         <div id="my4" style="margin-right: 20px;">
         </div>
         <div id="my5" style="margin-right: 20px;">
         </div>
      </div>
      
      <div class="courseDiv" id="myCourse">
         <h3>나만의 코스</h3><br>
         <div id="my1" style="margin-right: 20px; margin-left: 25px">
         </div>
         <div id="my2" style="margin-right: 20px;">
         </div>
         <div id="my3" style="margin-right: 20px;">
         </div>
         <div id="my4" style="margin-right: 20px;">
         </div>
         <div id="my5" style="margin-right: 20px;">
         </div>
      </div>
      
      <div align="center">   
         <a href="#"><img alt="save" src="img/courseSave.png" style="width: 100px"></a>
      </div>
   </div>
</body>
</html>