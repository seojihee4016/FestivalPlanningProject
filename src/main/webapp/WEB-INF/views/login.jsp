<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Piñata</title>
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
				<div class="id-pwbox">
					<input type='text' name="loginId" class="form-control mb-4"
						placeholder="아이디" /> <input type='password' name="loginPw"
						class="form-control" placeholder="비밀번호" />
				</div>
				<br>
				<div class="login-btnbox">
					<input type="submit" class="btn login-btn" value="로그인">
				</div>
				<br>
				<div class="advice-box">
					<span class="advice">▶ 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로
						정기적인 비밀번호 변경을 해주시길 바랍니다.</span>
					<p class="advice">▶ Piñata 홈페이지는 Internet Explorer 9.0 이상,
						Chrome 브라우저에 최적화 되어있습니다.</p>
				</div>

			</form>
		</c:if>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>