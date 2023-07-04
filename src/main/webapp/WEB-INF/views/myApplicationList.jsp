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
				나의 견적 확인하기 <i class="bi bi-clipboard-check"></i>
			</h3>
		</header>

		<section id="container">
			<form role="form" method="get" action="list">

				<table>
					<tr>
						<th>번호</th>
						<th>축제명</th>
						<th>담당자 성함</th>
						<th>축제 장소</th>
						<th>운영 기관</th>
						<th>축제 시작 일자</th>
						<th>축제 종료 일자</th>
						<th>작성자</th>
						<th>수정</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<c:if test="${sessionScope.loginId == list.writer}">
							<tr>
								<td><c:out value="${list.fno}" /></td>
								<td><c:out value="${list.festivalName}" /></td>
								<td><c:out value="${list.name}" /></td>
								<td><c:out value="${list.addressEvent}" /></td>
								<td><c:out value="${list.commissioningAgency}" /></td>
								<td><c:out value="${list.startDate.split(' ')[0]}" /></td>
								<td><c:out value="${list.endDate.split(' ')[0]}" /></td>
								<td><c:out value="${list.writer}" /></td>

								<c:if test="${sessionScope.loginId == list.writer}">
									<td><a
										href="/updateView?fno=${list.fno}&page=${scri.page}
								&perPageNum=${scri.perPageNum}
								&searchType=${scri.searchType}
								&keyword=${scri.keyword}"
										class="custom-button">수정</a></td>
								</c:if>

							</tr>
						</c:if>
					</c:forEach>
				</table>

				<!-- 검색 기능 -->
				<div class="search">
					<select name="searchType" style="display:none;">

						
					</select> 

				</div>


				<!-- 페이지네이션 -->
				<div >
					<ul>
						<c:if test="${pageMaker.prev}">
							<li class= "li_class"><a
								href="myApplicationList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li class= "li_class"><a href="myApplicationList${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class= "li_class"><a
								href="myApplicationList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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

