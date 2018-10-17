<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel="stylesheet" href="css/nav.css">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="js/nav.js"></script>
   <style type="text/css">
      .courseDiv {
         padding-bottom: 70px;
         margin-left: 100px;
         margin-right: 100px;
      }
      .courseDiv div {
         border: 1px dotted #e8b4b4; 
         display: inline-block; 
         width: 300px; 
         height:200px;
         padding: 10px
      }
   </style>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
      $( function() {
           $( "#myCourse" ).sortable({
            revert: true
           });
           
           $( "#myCourse div" ).disableSelection();
        
           $('.saveBtn').click(function () {
              window.open("courseRegister.jsp?id=yun"/* + ${sessionScope.vo.id} */, "Window Title", "width=850, height=450, top=100, left=400");
            window.opener();
            });
         } );
   </script>
</head>
<body>
   <%@include file="nav.jsp" %>
   <div style="height: 120px"></div>
   <div>
      <h3 style="margin-left: 100px">Recommended Course</h3><br>
      <div class="courseDiv" style="border-bottom: 1px solid lightgray; margin-bottom: 70px">
         <br>
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
      
      <h3 style="margin-left: 100px">My Course</h3><br>
      <div class="courseDiv" id="myCourse">
         <div id="my1" style="margin-right: 20px; margin-left: 25px">
            <img alt="chicago" src="img/chicago.jpg" class="ui-state-default" width="100%" height="100%" style="float: left">
         </div>
         <div id="my2" style="margin-right: 20px;">
            <img alt="chicago" src="img/domul.jpg" class="ui-state-default" width="100%" height="100%" style="float: left">
         </div>
         <div id="my3" style="margin-right: 20px;">
            <img alt="chicago" src="img/la.jpg" class="ui-state-default" width="100%" height="100%" style="float: left">
         </div>
         <div id="my4" style="margin-right: 20px;">
            <img alt="chicago" src="img/ny.jpg" class="ui-state-default" width="100%" height="100%" style="float: left">
         </div>
         <div id="my5" style="margin-right: 20px;">
         </div>
      </div>
      
      <div align="center">   
         <a href="#" class="saveBtn"><img alt="save" src="img/recommendedCourse.png" style="width: 120px; margin-right: 20px"></a>
         <a href="#" class="saveBtn"><img alt="save" src="img/myCourse.png" style="width: 120px"></a>
      </div>
   </div>
</body>
</html>