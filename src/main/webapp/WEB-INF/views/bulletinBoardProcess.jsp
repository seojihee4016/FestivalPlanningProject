<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>BulletinBoard</title>
<style>
/*게시판*/
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

form {
	text-align: center;
}

#root {
	width: 600px;
	margin: 0 auto;
}

header {
	text-align: center;
	padding: 20px 0;
}

h1 {
	font-size: 24px;
	color: #333;
}

hr {
	border: none;
	border-top: 1px solid #ccc;
	margin-bottom: 20px;
}

#container {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

label {
	font-weight: bold;
}

input[type="text"], textarea {
	width: 800px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button[type="submit"], button[type="button"] {
	display: inline-block;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	background-color: #333;
	color: #fff;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
}

.cancel-btn {
	background-color: #ccc;
}

button[type="submit"]:hover, button[type="button"]:hover {
	background-color: #222;
}

button[type="submit"]:focus, button[type="button"]:focus {
	outline: none;
}
/*작성된 댓글 보이는 부분*/
a {
	text-decoration: none;
}

ol {
	list-style: none;
}

.admin .textbox {
	position: relative;
	height: auto;
	max-width: 80%;
	background-color: #F4EEED;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 10px;
	text-align: right;
	float: right;
	clear: both;
	border-radius: 10px
}

.wrap .admin .textbox::after {
	position: absolute;
	display: block;
	top: 0;
	font-size: 1.5rem;
	left: 170px;
	content: "▶";
	color: #F4EEED;
}

.user .textbox {
	position: relative;
	height: auto;
	max-width: 80%;
	background-color: #F4EEED;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 10px;
	text-align: left;
	float: left;
	clear: both;
}

.wrap .user .textbox::after {
	position: absolute;
	display: block;
	top: 0;
	font-size: 1.5rem;
	left: -15px;
	content: "◀";
	color: #F4EEED;
}
</style>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<section id="container">
			<form role="form" method="post" action="" id="updateBulletinBoard"
				onsubmit="return validateForm()">

				<!-- 페이징 -->
				<!-- cri값을 보관하기위해 form태그안에 타입 hidden으로 input태그를 추가 -->
				<input type="hidden" id="bno" name="bno"
					value="${updateBulletinBoard.bno}" /> <input type="hidden"
					id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

				<!-- 게시글 작성 -->
				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="title" value="${updateBulletinBoard.title}" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label> <textarea id="content"
									name="content"><c:out
										value="${updateBulletinBoard.content}" /></textarea></td>
						</tr>

					</tbody>
				</table>

				<c:if test="${sessionScope.loginId == updateBulletinBoard.writer}">
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
				</c:if>
				<button type="button" class="cancel-btn" onclick="history.back();">취소</button>
				<button type="button" class="list-btn">목록</button>
			</form>


			<div class="wrap" id="comments">
				<form name="updateAndDeleteComments" method="post">
					<div class="chat ch1">
						<ol class="commentList">
							<c:forEach items="${commentList}" var="commentList">

								<%-- 관리자인 경우 --%>
								<li class="admin"><c:if
										test="${sessionScope.loginId eq 'pinata1234'}">
										<div class="textbox">
											작성자: ${commentList.writer} <br /> 작성 날짜:
											<fmt:formatDate value="${commentList.regdate}"
												pattern="yyyy-MM-dd" />
											<br /> 댓글 내용:
											<p>${commentList.content}</p>
											<button type="button" class="replyUpdateBtn"
												data-cno="${commentList.cno}"
												onclick="handleReplyUpdate(this)">수정</button>
											<button type="button" class="replyDeleteBtn"
												data-cno="${commentList.cno}"
												onclick="handleReplyDelete(this)">삭제</button>
										</div>
									</c:if></li>

								<%-- 글 작성자인 경우 --%>
								<li class="user"><c:if
										test="${sessionScope.loginId == updateBulletinBoard.writer}">
										<div class="textbox">
											작성자: ${commentList.writer }<br /> 작성 날짜:
											<fmt:formatDate value="${commentList.regdate}"
												pattern="yyyy-MM-dd" />
											<br /> 댓글 내용:
											<p>${commentList.content}</p>

											<div>
												<c:if test="${commentList.writer == sessionScope.loginId}">
													<button type="button" class="replyUpdateBtn"
														data-cno="${commentList.cno}"
														onclick="handleReplyUpdate(this)">수정</button>
												</c:if>

												<c:if test="${commentList.writer == sessionScope.loginId}">
													<button type="button" class="replyDeleteBtn"
														data-cno="${commentList.cno}"
														onclick="handleReplyDelete(this)">삭제</button>

												</c:if>

											</div>

										</div>
									</c:if></li>

							</c:forEach>
						</ol>
					</div>
				</form>
			</div>


			<!-- 댓글 작성 -->
			<div class="wrap">
				<form name="replyForm" method="post">
					<input type="hidden" id="bno" name="bno"
						value="${updateBulletinBoard.bno}" /> <input type="hidden"
						id="page" name="page" value="${scri.page}"> <input
						type="hidden" id="perPageNum" name="perPageNum"
						value="${scri.perPageNum}"> <input type="hidden"
						id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword"
						value="${scri.keyword}">
					<div>
						<c:choose>

							<%-- 관리자인 경우--%>
							<c:when test="${sessionScope.loginId eq 'pinata1234'}">
								<label for="writer"></label>
								<input type="text" id="writer" name="writer"
									value="<c:out value="${sessionScope.loginId}" />" readonly />
							</c:when>

							<%-- 글 작성자인 경우--%>
							<c:when
								test="${sessionScope.loginId == updateBulletinBoard.writer}">
								<label for="writer"></label>
								<input type="text" id="writer" name="writer"
									value="<c:out value="${updateBulletinBoard.writer}" />"
									readonly />
							</c:when>
						</c:choose>
						<br /> <label for="content"></label><input type="text"
							id="content" name="content" />
					</div>
					<div>
						<c:if test="${sessionScope.loginId == updateBulletinBoard.writer}">
							<button type="button" class="replyWriteBtn">댓글 작성</button>
						</c:if>
					</div>
				</form>
			</div>
		</section>
		<hr />
	</div>






	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("#updateBulletinBoard");

			// 수정
			$(".update_btn").on("click", function() {
				if (confirm("수정하시겠습니까?")) {
					formObj.attr("action", "/bulletinBoardProcess");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});

			// 삭제
			$(".delete_btn").on("click", function() {
				if (confirm("삭제하시겠습니까?")) {
					formObj.attr("action", "/deleteBulletinBoardByBno");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
		});
	</script>

	<!-- input 유효성 검사 -->
	<script>
		function validateForm() {

			if (title.value.trim() === '') {
				alert('제목을 입력해주세요.');
				return false;
			}
			if (content.value.trim() === '') {
				alert('내용을 입력해주세요.');
				return false;
			}

			return true;
		}
	</script>

	<!-- 페이지 값 작성 / 댓글 -->
	<script>
		// 목록
		$(".list-btn")
				.on(
						"click",
						function() {
							location.href = "/bulletinBoardList?page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
						})

		//댓글 작성
		$(".replyWriteBtn")
				.on(
						"click",
						function() {
							if (confirm("댓글을 작성하시겠습니까?")) {
								var formObj = $("form[name='replyForm']");
								formObj.attr("action", "writeComments");
								formObj.submit();
							}

							//댓글 수정 View
							$(".replyUpdateBtn")
									.on(
											"click",
											function() {
												if (confirm("댓글 수정?")) {
													location.href = "/bulletinBoardProcess?bno=${bno}"
															+ "&page=${scri.page}"
															+ "&perPageNum=${scri.perPageNum}"
															+ "&searchType=${scri.searchType}"
															+ "&keyword=${scri.keyword}"
															+ "&cno="
															+ $(this).attr(
																	"data-cno");
												}

											});

							//댓글 삭제 View
							$(".replyDeleteBtn")
									.on(
											"click",
											function() {
												if (confirm("댓글 삭제?")) {
													location.href = "/bulletinBoardProcess?bno=${bno}"
															+ "&page=${scri.page}"
															+ "&perPageNum=${scri.perPageNum}"
															+ "&searchType=${scri.searchType}"
															+ "&keyword=${scri.keyword}"
															+ "&cno="
															+ $(this).attr(
																	"data-cno");
												}
											});
						});
	</script>
	<!-- JavaScript 코드를 작성할 스크립트 태그 추가 -->
	<!-- JavaScript 코드를 작성할 스크립트 태그 추가 -->
	<script>
		// 수정 버튼 클릭 이벤트 핸들러
		function handleReplyUpdate(button) {
			var cno = button.getAttribute("data-cno");
			var bno = "${bno}";
			var scriPage = "${scri.page}";
			var scriPerPageNum = "${scri.perPageNum}";
			var scriSearchType = "${scri.searchType}";
			var scriKeyword = "${scri.keyword}";

			var url = "/bulletinBoardProcess?bno=" + bno + "&page=" + scriPage
					+ "&perPageNum=" + scriPerPageNum + "&searchType="
					+ scriSearchType + "&keyword=" + scriKeyword + "&cno="
					+ cno;

			// 페이지 리디렉션
			location.href = url;
		}

		// 삭제 버튼 클릭 이벤트 핸들러
		function handleReplyDelete(button) {
			var cno = button.getAttribute("data-cno");
			// 삭제 버튼을 클릭했을 때 수행해야 할 동작을 여기에 작성
			// 예: 댓글 삭제 요청을 서버에 보내거나 다른 동작 수행
		}
	</script>




</body>
</html>