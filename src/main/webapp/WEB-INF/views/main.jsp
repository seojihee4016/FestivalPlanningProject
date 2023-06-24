<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 메인</title>
</head>
<body>
	<h1>임시 메인페이지</h1>
	<c:if test="${not empty sessionScope}">
		<p>${sessionScope.loginId} 님 환영합니다</p>
	</c:if>
	
</body>
</html>