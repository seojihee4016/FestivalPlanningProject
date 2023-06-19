<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집 리스트</title>
</head>
<body>
	<h1>staffRecruitmentList</h1>
	
	<c:forEach var="item" items="${staffRecruitmentList}">
		<a href="staffRecruitment?festivalName=${item.festivalName}">
			<p>축제명 : ${item.festivalName}</p>
			<p>지원기간 : ${item.supportPeriod}</p>
			<br>
		</a>
	</c:forEach>
	
</body>
</html>