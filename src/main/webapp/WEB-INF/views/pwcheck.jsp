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
<title>Insert title here</title>
<link href="css/pwcheck.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="pwcheck-box">
		<c:if test="${pwCheck == null}">
			<h1>비밀번호 확인</h1>
			<form action="" method="POST" class="login-form">
				<br>
				<div class="pwbox">
					<input type='password' name="loginPw" class="form-control"
						placeholder="비밀번호 입력" /> <input type="submit"
						class="btn pwCheckBtn" value="확인">
				</div>
				<br>
				<div class="advice-box">
					<p class="advice">▶ 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로 정기적인
						비밀번호 변경을 해주시길 바랍니다.</p><br>
					<div class="nextBtn-box">
						<a type="button" href="main" class="btn nextBtn">다음에 변경하기</a>
					</div>
				</div>
			</form>
		</c:if>
	</div>


</body>
</html>