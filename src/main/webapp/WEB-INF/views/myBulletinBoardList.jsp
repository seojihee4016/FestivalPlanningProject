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
						<th>수정</th>
					</tr>

					<c:forEach items="${selectBulletinBoardList}"
						var="selectBulletinBoardList">

						<c:if
							test="${sessionScope.loginId == selectBulletinBoardList.writer }">
							<tr>
								<td><c:out value="${selectBulletinBoardList.bno}" /></td>
								<td><c:out value="${selectBulletinBoardList.typeOfInquiry}" /></td>
								<td><c:out value="${selectBulletinBoardList.title}" /></td>
								<td><c:out value="${selectBulletinBoardList.content}" /></td>
								<td><c:out value="${selectBulletinBoardList.writer}" /></td>
								<td><fmt:formatDate
										value="${selectBulletinBoardList.regdate}"
										pattern="yyyy-MM-dd" /></td>
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
						</c:if>
					</c:forEach>

				</table>

				<div class="search">
					<select name="searchType"  style="display:none;">
					</select>
				</div>


				<!-- 페이지네이션 -->
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="myBulletinBoardList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a
								href="myBulletinBoardList${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="myBulletinBoardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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
