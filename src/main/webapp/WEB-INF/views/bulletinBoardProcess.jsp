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
body {
	display: flex;
	align-items: center;
	justify-content: center;
}

form {
	width: 400px;
}

form table {
	width: 100%;
}

form td {
	padding: 10px;
}

form label {
	display: block;
	margin-bottom: 5px;
}

form input[type="text"], form textarea {
	width: 100%;
	padding: 5px;
}

form button[type="submit"] {
	padding: 10px 20px;
}

/*댓글*/
.commentList {
	list-style: none;
	padding: 0;
}

.commentList li {
	margin-bottom: 20px;
	border: 1px solid #ccc;
	padding: 10px;
}

.commentList p {
	margin: 0;
}

.commentList p:first-child {
	font-weight: bold;
}

.commentList p:last-child {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>nav bar</nav>
		<hr />

		<section id="container">
			<form role="form" method="post" action="" id="updateBulletinBoard"
				onsubmit="return validateForm()">


				<!-- cri값을 보관하기위해 form태그안에 타입 hidden으로 input태그를 추가 -->
				<input type="hidden" id="bno" name="bno"
					value="${updateBulletinBoard.bno}" /> 
					<input type="hidden"
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
						<tr>
							<td><button type="submit">작성</button></td>
						</tr>
					</tbody>
				</table>

				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="button" class="cancel-btn" onclick="history.back();">취소</button>
			</form>

			<!-- 작성된 댓글 조회-->
			<div id="comments">
				<ol class="commentList">
					<c:forEach items="${commentList}" var="commentList">
						<li>
							<p>
								작성자 : ${commentList.writer}<br /> 작성 날짜 :
								<fmt:formatDate value="${commentList.regdate}"
									pattern="yyyy-MM-dd" />
							</p>
							<p>${commentList.content}</p>
						</li>
					</c:forEach>
				</ol>
			</div>

			<!-- 댓글 작성 -->
			<form name="replyForm" method="post">
				<input type="hidden" id="bno" name="bno" value="${updateBulletinBoard.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

				<div>
					<label for="writer">댓글 작성자</label><input type="text" id="writer"
						name="writer" /> <br /> <label for="content">댓글 내용</label><input
						type="text" id="content" name="content" />
				</div>
				<div>
					<button type="button" class="replyWriteBtn">작성</button>
				</div>
			</form>



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
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "writeReply");
			formObj.submit();
		});
	</script>
</body>
</html>