<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link href="${path}/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<!-- header 추가한 뒤 간격 조정하기 -->
		<h1>관리자 페이지</h1>
		<div class="areaContainer">
			<div class="area">
				<h3>진행 중인 작업 리스트</h3>
				-
			</div>
			<div class="area">
				<h3>
					<a href="list">
						▶ 신청 리스트로 이동
					</a>
				</h3>
				- 선입금(계좌이체) 확인
			</div>
		</div>
	</div>

</body>
</html>