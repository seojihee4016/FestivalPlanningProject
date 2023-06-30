<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 100%;
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
	max-width: 70%;
	background-color: #DCF8C6;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 10px;
	text-align: right;
	float: right;
	clear: both;
}

.wrap .admin .textbox::after {
	position: absolute;
	display: block;
	top: 0;
	font-size: 1.5rem;
	left: 170px;
	content: "▶";
	color: #DCF8C6;
}

.user .textbox {
	position: relative;
	height: auto;
	max-width: 70%;
	background-color: #EAEAEA;
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
	color: #EAEAEA;
}

#writer {
	color: blue;
	font-weight: bold;
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

				<!-- cri값을 보관하기위해 form태그안에 타입 hidden으로 input태그를 추가 -->
				<input type="hidden" id="bno" name="bno"
					value="${updateBulletinBoard.bno}" /> <input type="hidden"
					id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

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
						<tr>
							<td><label for="writer">작성자 - 세션 적용 전</label><input
								type="text" id="writer" name="writer"
								value="${updateBulletinBoard.writer}" /></td>
						</tr>
					</tbody>
				</table>

				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="button" class="cancel-btn" onclick="history.back();">취소</button>
				<button type="button" class="list-btn">목록</button>
			</form>

			<!-- 작성된 댓글 조회-->
			<div class="wrap" id="comments">
				<div class="chat ch1">
					<ol class="commentList ">
						<c:forEach items="${commentList}" var="commentList">
							<!-- 관리자인 경우 -->
							<li class="admin"><c:if
									test="${commentList.writer == 'admin'}">
									<div class="textbox">
										작성자: ${commentList.writer}<br /> 작성 날짜:
										<fmt:formatDate value="${commentList.regdate}"
											pattern="yyyy-MM-dd" />
										<br /> 댓글 내용:
										<p>${commentList.content}</p>
									</div>
								</c:if></li>


							<!-- 글 작성자인 경우 -->
							<li class="user"><c:if
									test="${commentList.writer == updateBulletinBoard.writer}">
									<div class="textbox">
										작성자: ${commentList.writer}<br /> 작성 날짜:
										<fmt:formatDate value="${commentList.regdate}"
											pattern="yyyy-MM-dd" />
										<br /> 댓글 내용:
										<p>${commentList.content}</p>
									</div>
								</c:if></li>

						</c:forEach>
					</ol>
				</div>
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

						<label for="writer"></label><input type="text" id="writer"
							name="writer" /> <br /> <label for="content">댓글 내용</label><input
							type="text" id="content" name="content" />
					</div>
					<div>
						<button type="button" class="replyWriteBtn">댓글 작성</button>
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

			//목록 이동
			$(".list-btn").on("click", function() {
				window.location.href = "/bulletinBoardList";
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

	<!-- 페이지 값 작성 중/ 댓글 -->
	<script>
		// 목록
		$(".list_btn")
				.on(
						"click",
						function() {

							location.href = "/bulletinBoardList?page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
						})

		//댓글 작성
		$(".replyWriteBtn").on("click", function() {
			if (confirm("댓글을 작성하시겠습니까?")) {
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "writeReply");
				formObj.submit();
			}
		});
	</script>


</body>
</html>