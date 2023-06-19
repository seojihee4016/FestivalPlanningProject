<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집</title>
</head>
<body>
	<h1>staffRecruitment</h1>
	
	<c:forEach var="item" items="${staffRecruitmentListByFestivalName}">
		<p>축제명 : ${item.festivalName}</p>
		<p>지원기간 : ${item.supportPeriod}</p>
		<p>모집인원 : ${item.recruitmentTO}</p>
		<p>모집분야 : ${item.recruitmentField}</p>
		<p>우대사항 : ${item.preferentialTreatment}</p>
		<p>접수기간 : ${item.applicationPeriod}</p>
	</c:forEach>
</body>
</html>