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
<link href="css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="card-box">
		<div class="card update">
			<h5 class="card-header">회원정보 수정</h5>
			<div class="card-body">
				<h5 class="card-title">Special title treatment</h5>
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
				<a href="userupdate" class="btn btn-primary">회원정보 수정</a>
			</div>
		</div>

		<div class="card delete">
			<h5 class="card-header">회원탈퇴</h5>
			<div class="card-body">
				<h5 class="card-title">Special title treatment</h5>
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
				<a href="#" class="btn btn-primary">회원탈퇴</a>
			</div>
		</div>
	</div>

</body>
</html>
<%@ include file="footer.jsp"%>