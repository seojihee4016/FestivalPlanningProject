<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<title>게시판</title>
<link href="${path}/css/board.css" rel="stylesheet" type="text/css">
<!--테일윈드-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.17/tailwind.min.css">
<!--폰트어썸-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>신청 양식으로 변경</nav>
		<hr />

		<section id="container">
			<form role="form" method="post" action="write">
				<table class="board-table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>

					<c:forEach items="${list}" var="list" varStatus="loop">
						<tr>
							<!-- 번호로 조회해서 글 보기 -->
							<td><c:out value="${list.bno}" /></td>
							<td><a href="/readView?bno=${list.bno}"><c:out
										value="${list.title}" /></a></td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate value="${list.regdate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<c:if test="${!loop.last}">
							<tr>
								<td colspan="4">
									<hr />
								</td>
							</tr>
						</c:if>
					</c:forEach>

				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>
