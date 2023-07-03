<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h3>스탭 모집 공고 페이지</h3>
		
		<h4>< 한 줄 공지사항(필요하면 팝업식으로) ></h4>
		
		<div class="list_container">
			<c:forEach var="item" items="${activeStaffFormList}">
				<a href="staffRecruitment?fno=${item.fno}">
					<div class="list_area">
						<p>${item.festivalName}</p>
						<p>
							<!-- 문자열에서 Date 형변환 -->
						<fmt:parseDate var="startDate" value="${item.startDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:parseDate var="endDate" value="${item.endDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<!-- Date 객체를 원하는 형식의 문자열로 변환 -->
						<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
						<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />

						${formattedStartDate} ~ ${formattedEndDate}
						</p>
						<p>접수 기간 ${item.applicationPeriod} 까지</p>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>