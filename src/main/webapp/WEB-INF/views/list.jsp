<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container">
			<form role="form" method="post" action="/write">
				<table>
					<tr>
						<td>번호
						<th>축제 이름</th>
						<th>담당자 성함</th>
						<th>장소 구분</th>
						<th>축제 장소</th>
						<th>예상 인원수</th>
						<th>운반 난이도</th>
						<th>예상 금액</th>
						<th>운영 기관</th>
						<th>시작 일자</th>
						<th>종료 일자</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.fno}" /></td>

							<td><a href="/updateView?fno=${list.fno}"><c:out
										value="${list.festivalName}" /></a></td>
							<td><c:out value="${list.name}" /></td>
							<td><c:out value="${list.place}" /></td>
							<td><c:out value="${list.addressEvent}" /></td>
							<td><c:out value="${list.numberOfPeople}" /></td>
							<td><c:out value="${list.carryingDifficulty}" /></td>
							<td><c:out value="${list.budgetRange}" /></td>
							<td><c:out value="${list.commissioningAgency}" /></td>
							<td><c:out value="${list.startDate}" /></td>
							<td><c:out value="${list.endDate}" /></td>
						</tr>
					</c:forEach>

				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>
