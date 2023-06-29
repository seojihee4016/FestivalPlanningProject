<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<link href="${path}/css/applicationFormList.css?ver=3" rel="stylesheet"
	type="text/css" />
<title>게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>신청 양식 조회</h1>
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
						<th>수정</th>
						<th>모집 공고</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.fno}" /></td>
							<td><a href="/updateView?fno=${list.fno}"><c:out
										value="${list.festivalName}" /></a></td>
							<td><c:out value="${list.name}" /></td>
							<!--  <td><c:out value="${list.place}" /></td> -->
							<td><c:out value="${list.addressEvent}" /></td>
							<!-- <td><c:out value="${list.numberOfPeople}" /></td>
              <td><c:out value="${list.carryingDifficulty}" /></td>
              <td><c:out value="${list.budgetRange}" /></td> -->
							<td><c:out value="${list.commissioningAgency}" /></td>
							<td><c:out value="${list.startDate}" /></td>
							<td><c:out value="${list.endDate}" /></td>
							<td><a href="/updateView?fno=${list.fno}"
								class="custom-button">수정</a></td>
							<td><a href="/staffRecruitment_form?fno=${list.fno}"
								class="custom-button">올리기</a></td>

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

