<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function content_submit(){
	var f=document.connect_form;
	//이동할 페이지로 폼값을 가지고 전송됨
	f.submit();
}
</script>
</head>
<body>
<form action="getAttraction.do" method="post" name="connect_form">
<input type=hidden name="spotName" value="hp education">고고 
<input type=hidden name="city" value ="고양">
<!-- <input type=hidden name="address" value ="보성">
<input type=hidden name="location" value ="22"> -->
<input type=button value="전송" onclick="content_submit()">
</form>
</body>
</html>