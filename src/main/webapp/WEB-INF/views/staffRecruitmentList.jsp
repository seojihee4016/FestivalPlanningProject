<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집 리스트</title>
<link href="${path}/css/staffFormList.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container">
		<h1>스탭 모집 공고 페이지</h1>
		
		<h4>< 한 줄 공지사항(필요하면 팝업식으로) ></h4>
		
		<div class="list_container">
			<c:forEach var="item" items="${staffFormList}">
				<a href="staffRecruitment?fno=${item.fno}">
					<div class="list_area">
						<p>${item.festivalName}</p>
						<p>${item.startDate} ~ ${item.endDate}</p>
						<p>접수 기간 ${item.applicationPeriod} 까지</p>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>