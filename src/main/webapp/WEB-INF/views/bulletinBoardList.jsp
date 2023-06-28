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
			<h1>문의 게시판</h1>
		</header>

		<section id="container">
			<form role="form" method="post" action="selectBulletinBoardList">

				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>수정</th>
					</tr>

					<c:forEach items="${selectBulletinBoardList}" var="selectBulletinBoardList">
						<tr>
							<td><c:out value="${selectBulletinBoardList.bno}" /></td>
							<td><c:out value="${selectBulletinBoardList.title}" /></td>
							<td><c:out value="${selectBulletinBoardList.writer}" /></td>
							<td><fmt:formatDate value="${selectBulletinBoardList.regdate}"
									pattern="yyyy-MM-dd" /></td>
							<td><a href="/BulletinBoardPocess?bno=${selectBulletinBoardList.bno}"
								class="custom-button">수정</a></td>
						</tr>
					</c:forEach>

				</table>
			</form>

			<div class="container">
				<button class="button" style="vertical-align: middle"
					onclick="location.href='${path}/BulletinBoard'">
					<span>글 쓰기</span>
				</button>
			</div>
		</section>
	</div>


</body>
</html>
