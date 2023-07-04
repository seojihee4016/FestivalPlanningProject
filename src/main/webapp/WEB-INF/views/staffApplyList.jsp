<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 신청 내역</title>
<link href="${path}/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<!-- header 추가한 뒤 간격 조정하기 -->
		<h3>스탭 신청 내역</h3>
		

		<table class="table">
			<tbody class="table-group-divider">
				<tr>
					<th scope="row">축제 이름</th>
					<th>주소</th>
					<th>지원 기간</th>
					<th>지원 분야</th>
					<th>수정</th>
				</tr>
					<c:forEach items="${list}" var="staffApplyList">
					<c:if test="${sessionScope.loginId == list.id}">
					<tr>
						<td scope="row">${list.festivalName}</td>
						<td>${list.place}</td>
						<td>${list.supportPeriodStart} ~ ${list.supportPeriodEnd}</td>
						<td>${list.codeName}</td>
						<td><a href="#" class="custom-button">수정</a></td>
					</tr>
					</c:if>
					</c:forEach>

			</tbody>
		</table>
	</div>



</body>
</html>