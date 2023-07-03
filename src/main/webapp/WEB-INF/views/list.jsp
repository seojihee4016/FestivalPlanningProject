<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<link href="${path}/css/applicationFormList.css?ver=3" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h3>견적 신청 <i class="bi bi-clipboard-check"></i></h3>
		</header>

		<section id="container">
			<form role="form" method="post" action="list">
				<table>
					<tr>
						<th>번호</th>
						<th>축제 이름</th>
						<th>담당자 성함</th>
						<!-- <th>장소 구분</th>  -->
						<th>축제 장소</th>
						<!-- <th>예상 인원수</th>
            <th>운반 난이도</th>
            <th>예상 금액</th> -->
						<th>운영 기관</th>
						<th>축제 시작 일자</th>
						<th>축제 종료 일자</th>


						<th>작성자</th>
						<c:if test="${sessionScope.loginId == list[0].writer}">
							<th>수정</th>
						</c:if>

					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.fno}" /></td>
							<td><c:out value="${list.festivalName}" /></td>
							<td><c:out value="${list.name}" /></td>
							<!--  <td><c:out value="${list.place}" /></td> -->
							<td><c:out value="${list.addressEvent}" /></td>
							<!-- <td><c:out value="${list.numberOfPeople}" /></td>
              <td><c:out value="${list.carryingDifficulty}" /></td>
              <td><c:out value="${list.budgetRange}" /></td> -->
							<td><c:out value="${list.commissioningAgency}" /></td>

							<td><c:out value="${list.startDate.split(' ')[0]}" /></td>
							<td><c:out value="${list.endDate.split(' ')[0]}" /></td>
							<td><c:out value="${list.writer}" /></td>

							<c:if test="${sessionScope.loginId == list.writer}">
								<td><a href="/updateView?fno=${list.fno}"
									class="custom-button">수정</a></td>
							</c:if>


						</tr>
					</c:forEach>
				</table>
			</form>

			<div class="container">
				<button class="button" style="vertical-align: middle"
					onclick="location.href='${path}/applicationForm'">
					<span>신청하기</span>
				</button>
			</div>
		</section>
	</div>


</body>
</html>

