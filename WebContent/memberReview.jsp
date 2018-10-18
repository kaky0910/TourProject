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
</head>
<body>
   		<%@include file="nav.jsp" %>

   	<div style="height: 150px"></div>
	<h1 align="center">${param.id}'s Review</h1><br><br>
	
	<c:forEach items="${lvo.list}" var="rList">
		
			<div align="center" class="col-sm-4">
				<hr>
				${rList.date}<br>
				<a href="checkReview.do?num=${rList.reviewNum}"><img src="${rList.mainImage}" width="350" height="200"></a><br><br>
				<a href="checkReview.do?num=${rList.reviewNum}">${rList.title}</a>
				<hr><br><br>
			</div>
		
	</c:forEach>
	
	<br><br>
	
	<div align="center" class="col-sm-12">  
		<c:set var="pb" value="${lvo.pb}"></c:set>
		<c:if test="${pb.previousPageGroup}">
			<ul class="pagination pagination-sm">
	    		<li><a href="memberreview.do?id=${sessionScope.vo.id}&&pageNo=${pb.startPageOfPageGroup-1}">&#60;</a></li>
	  		</ul>
		</c:if>
		
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<ul class="pagination">
		    			<li><a href="memberreview.do?id=${sessionScope.vo.id}&&pageNo=${i}">${i}</a></li>
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
	    		<li><a href="memberreview.do?id=${sessionScope.vo.id}&&pageNo=${pb.endPageOfPageGroup+1}">&#62;</a></li>
	  		</ul>
		</c:if>	
	</div>
</body>
</html>