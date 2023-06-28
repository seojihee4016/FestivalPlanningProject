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
<style>
.container {
	border: 1px solid black;
	width: 550px;
	height: 300px;
}

.login-form {
	margin-top:50px;
}
</style>

</head>
<body>
	<h1>로그인 페이지</h1>
	<br>

	<div class="container">
		<c:if test="${login == null}">
			<form action="${cpath}/login.do" method="POST" class="login-form">
				아이디 <input type='text' name="loginId" class="form-control" /><br>
				비밀번호 <input type='password' name="loginPw" class="form-control" /><br>

				<button type="submit" class="btn btn-primary">로그인</button>
			</form>
		</c:if>
	</div>
</body>
</html>