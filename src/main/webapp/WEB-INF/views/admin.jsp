<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link href="${path}/css/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h1>admin</h1>
	
	<div class="area">
	<h3>진행 중인 작업 리스트</h3>
	<hr/>
	- 
	</div>
	
	<div class="area">
	<h3>신규 신청 리스트</h3>
	<hr/>
	- 선입금(계좌이체) 확인
	</div>

	<div class="area">
	<h3>스탭 모집하기</h3>
	<hr/>
	<button onclick="location.href='staffRecruitment_form'">스탭 모집 공고 올리기</button>
	- 관리자 페이지(스탭 모집 버튼) → 작업 페이지 → 스탭 모집 페이지에 결과 띄우기
	</div>
	
	
</body>
</html>