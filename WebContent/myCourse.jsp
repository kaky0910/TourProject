<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      }
      
      .courseDiv div {
         border: 1px dotted #e8b4b4; 
         display: inline-block; 
         width: 300px; 
         height:200px;
         padding: 10px
      }
   </style>
</head>
<body>
   <%@include file="nav.jsp" %>
   <div style="height: 120px"></div>
   <h1 align="center">My Course</h1>
   
   <c:forEach items="${mcourse.list}" var="mList">
      <div align="center" class="col-sm-12">
         <a href="detailCourse.do?courseNum=${mList.courseNum}"><h4 style="margin-left: 100px; margin-top: 20px" align="left">${mList.courseName}</h4></a><br>
         <div class="courseDiv" style="border-bottom: 1px solid lightgray; margin-bottom: 40px">
            <br>
            <c:forEach items="${mList.map}" var="entry"
               varStatus="status">
               <div id="${status}" style="margin-right: 20px; margin-left: 25px">
                  <img src="${entry.value.mainImage}" class="ui-state-default"
                     width="100%" height="100%" style="float: left">
               </div>
            </c:forEach>
         </div>
      </div>
   </c:forEach>
   
   <br><br>
   
   <div align="center" class="col-sm-12">  
      <c:set var="pb" value="${mcourse.pb}"></c:set>
      <c:if test="${pb.previousPageGroup}">
         <ul class="pagination pagination-sm">
             <li><a href="myCourse.do?id=${vo.id}&&pageNo=${pb.startPageOfPageGroup-1}">&#60;</a></li>
           </ul>
      </c:if>
      
      <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
         <c:choose>
            <c:when test="${pb.nowPage!=i}">
               <ul class="pagination">
                   <li><a href="myCourse.do?id=${vo.id}&&pageNo=${i}">${i}</a></li>
                </ul>
            </c:when>
            <c:otherwise>
               <ul class="pagination">
                   <li><a href="#">${i}</a></li>
                </ul>
            </c:otherwise>
         </c:choose>
         &nbsp;
      </c:forEach>
      
      <c:if test="${pb.nextPageGroup}">
         <ul class="pagination pagination-sm">
             <li><a href="myCourse.do?id=${vo.id}&&pageNo=${pb.endPageOfPageGroup+1}">&#62;</a></li>
           </ul>
      </c:if>   
   </div>         
</body>
</html>