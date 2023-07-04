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
			<h3>
				견적 신청 <i class="bi bi-clipboard-check"></i>
			</h3>
		</header>

		<section id="container">
			<form role="form" method="get" action="list">

				<table>
					<tr>
						<th>번호</th>
						<th>축제명</th>
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

						

						</tr>
					</c:forEach>
				</table>

				<!-- 검색 기능 -->
				<div class="search">
					<select name="searchType">

						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색할
							목록을 선택하세요</option>
						<option value="f"
							<c:out value="${scri.searchType eq 'f' ? 'selected' : ''}"/>>축제명</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>운영
							기관</option>
						<option value="w"
							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="fc"
							<c:out value="${scri.searchType eq 'fc' ? 'selected' : ''}"/>>축제이름
							+ 담당기관</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" />
					<button id="searchBtnForm" type="button">
						<i class="bi bi-search"></i>
					</button>
					<script>
						$(function() {
							$('#searchBtnForm').click(
											function(e) {
												self.location = "list"
														+ '${pageMaker.makeQuery(1)}'
														+ "&searchType="
														+ $(
																"select option:selected")
																.val()
														+ "&keyword="
														+ encodeURIComponent($(
																'#keywordInput')
																.val());
											});
						});
						

					</script>	



				</div>


				<!-- 페이지네이션 -->
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>

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

