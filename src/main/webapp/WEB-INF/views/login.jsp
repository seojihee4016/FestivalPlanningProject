<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">
		<c:if test="${login == null}">
			<h1>Piñata</h1>
			<form action="${cpath}/login" method="POST" class="login-form">
				<div class="input-box">
					<img src="images/pinata.png">
				</div>
				<br>
				<div>
					<input type='text' name="loginId" class="form-control mb-4"
						placeholder="아이디" /> <input type='password' name="loginPw"
						class="form-control" placeholder="비밀번호" />
				</div>
				<br>

				<button type="submit" class="btn btn-primary login-btn">로그인</button>
			</form>
		</c:if>
	</div>
</body>
</html>