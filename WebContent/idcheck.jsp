<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input[type=button]').click(function() {
			var of = window.opener.document.registerFrm;
			if(${flag==true}){ 
				of.id.value = "";
				of.id.focus();
			} else{
				of.password.focus();
				of.flag.value = of.id.value; 
				of.id.readOnly = true;
			}
			window.close();
		});
	});
</script>
<style>
body {
	margin: 10px
}

.btn {
	background: #DE6262;
	color: #fff;
	font-weight: 600;
}
</style>
</head>
<c:set var="message" value="해당 ID는 이미 사용중입니다." />
<c:if test="${flag == false}">
	<c:set var="message" value="해당 ID는 사용 가능합니다." />
</c:if>
<body>
	<div>
		<br> <b>${param.id}</b>, ${message}<br> <br> <span class="float-right"><input
			type="button" class="btn" value="확인"  ></span>
		<!-- String 으로 값을 넘겨야한다. 인자값으로 넘어가기 때문에 타입을 지정할 수 없다. -->
	</div>
</body>
</html>