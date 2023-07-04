<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h3>관리자 페이지</h3>
		

		<table class="table">
			<tbody class="table-group-divider">
				<tr>
					<th scope="row">번호</th>
					<th>축제 이름</th>
					<th>운영 기관</th>
					<th>축제 시작 일자</th>
					<th>축제 종료 일자</th>
					<th>모집 공고</th>
					<th>배치도</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td scope="row">${list.fno}</td>
						<td>${list.festivalName}</td>
						<td>${list.commissioningAgency}</td>
						<td>${list.startDate.split(' ')[0]}</td>
						<td>${list.endDate.split(' ')[0]}</td>
						<td><a href="/staffRecruitment_form?fno=${list.fno}" class="custom-button">업로드</a>
						</td>
						<td><a href="/blockPlan?fno=${list.fno}" class="custom-button">만들기</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>





</body>
</html>