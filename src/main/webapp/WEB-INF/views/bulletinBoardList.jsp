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
			<h1>
				Q <i class="bi bi-chat-dots"></i> A
			</h1>
		</header>

		<section id="container">
			<form role="form" method="get" action="">

				<table>
					<tr>
						<th>번호</th>
						<th>문의 종류</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>등록일</th>
						<c:if
							test="${selectBulletinBoardList[0].writer == sessionScope.loginId || 'admin' == sessionScope.loginId}">
							<th>수정</th>
						</c:if>
					</tr>

					<c:forEach items="${selectBulletinBoardList}"
						var="selectBulletinBoardList">
						<tr>
							<td><c:out value="${selectBulletinBoardList.bno}" /></td>
							<td><c:out value="${selectBulletinBoardList.typeOfInquiry}" /></td>
							<td><c:out value="${selectBulletinBoardList.title}" /></td>
							<td><c:out value="${selectBulletinBoardList.content}" /></td>
							<td><c:out value="${selectBulletinBoardList.writer}" /></td>
							<td><fmt:formatDate
									value="${selectBulletinBoardList.regdate}" pattern="yyyy-MM-dd" /></td>
							<c:if
								test="${sessionScope.loginId == selectBulletinBoardList.writer || sessionScope.loginId == 'admin'}">
								<td><a
									href="/bulletinBoardProcess?bno=${selectBulletinBoardList.bno}&page=${scri.page}
								&perPageNum=${scri.perPageNum}
								&searchType=${scri.searchType}
								&keyword=${scri.keyword}"
									class="custom-button">수정</a></td>
							</c:if>

						</tr>
					</c:forEach>

				</table>

				<!-- 검색 기능 -->
				<div class="search">
					<select name="searchType">

						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색할
							목록을 선택하세요</option>
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="w"
							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" />
					<button id="searchBtn" type="button">
						<i class="bi bi-search"></i>
					</button>
					<script>
						$(function() {
							$('#searchBtn')
									.click(
											function() {
												self.location = "bulletinBoardList"
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
								href="bulletinBoardList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="bulletinBoardList${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="bulletinBoardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>

			<div class="container">
				<button class="button" style="vertical-align: middle;"
					onclick="location.href='${path}/BulletinBoard'">
					<span>글 쓰기</span>
				</button>
			</div>
		</section>
	</div>

</body>
</html>
