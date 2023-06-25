<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집 리스트</title>
<link href="${path}/css/staff.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h1>staffRecruitmentList</h1>
	
	<p>한 줄 공지사항(누르면 팝업?)</p>
	
	<div class="list_container">
		<c:forEach var="item" items="${staffRecruitmentList}">
			<a href="staffRecruitment?festivalName=${item.festivalName}">
				<div class="list_area">
					<p>${item.festivalName}</p>
					<p>${item.startDate}</p>
					<p>~ ${item.endDate}</p>
				</div>
			</a>
		</c:forEach>
	</div>
</body>
</html>