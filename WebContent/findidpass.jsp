<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID,비밀번호 찾기</title>
<!-- Website Font style -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body {
	background: #f8f8f8;
	padding: 30px 0;
}

#findidpassFrm {
	padding-left: 25px;
	padding-right: 25px;
}
</style>
<body>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="text-center">아이디 및 비밀번호 찾기</h2>
			</div>
			<div class="modal-body">
				<p>이름, 주민등록번호(앞6자리), 전화번호를 입력해주세요.</p>
				<form class="form-horizontal" action="findidpass.do"
					name="findidpassFrm" id="findidpassFrm" method="post">
					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">이름</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users"></i></span>
								<input type="text" class="form-control" id="username"
									name="username" placeholder="이름을 입력하세요." required="required">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="ssn" class="cols-sm-2 control-label">주민등록번호(앞자리
							6자리)</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fas fa-id-card"></i></span>
								<input type="text" class="form-control" id="ssn" name="ssn"
									placeholder="주민등록번호 앞6자리를 입력하세요." required="required">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="cols-sm-2 control-label">전화번호</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fas fa-phone"></i></span>
								<input type="text" class="form-control" id="tel" name="tel"
									placeholder="전화번호를 입력하세요." required="required">
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="submit"
							class="btn btn-primary btn-lg btn-block login-button" value="찾기">
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${check == 'ok'}">
			<script type="text/javascript">
				alert("아이디: " + "${rvo.id}" + " // " + "비밀번호: " + "${rvo.password}");
				window.document.location.href = "login.jsp";
			</script>
		</c:when>
		<c:when test="${check == 'fail'}">
			<script type="text/javascript">
				alert("입력하신 정보에 해당하는 아이디와 비밀번호가 없습니다.");
			</script>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</body>
</html>