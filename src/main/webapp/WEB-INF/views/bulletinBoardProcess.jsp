<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/aa973261c8.js"
	crossorigin="anonymous"></script>
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
	display: flex;
	align-items: center;
	justify-content: center;
}

form {
	width: 800px;
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

/*작성된 댓글 보이는 부분*/
a {
	text-decoration: none;
}

/*
ol {
	list-style: none;
}*//*
.wrap {
	padding: 40px 0;
}

.wrap .chat {
	display: flex;
	align-items: flex-start;
	padding: 20px;
}
*/
.wrap .chat .icon {
	position: relative;
	overflow: hidden;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #eee;
}

.wrap .chat .icon i {
	position: absolute;
	top: 10px;
	left: 50%;
	font-size: 2.5rem;
	color: #aaa;
	transform: translateX(-50%);
}

.wrap .chat .textbox {
	position: relative;
	display: inline-block;
	max-width: calc(100% - 70px);
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 13px;
	border-radius: 10px;
}

.wrap .chat .textbox::before {
	position: absolute;
	display: block;
	top: 0;
	font-size: 1.5rem;
		left: -15px;
	content: "◀";
	color: #ddd;
}


.wrap:nth-of-type(odd) .textbox {
	margin-left: auto;
	margin-right: 20px;
	background-color: #ddd;
	
}

.wrap:nth-of-type(odd) .textbox::before {
	left: auto;
	right: -15px;
	content: "▶";
	color: #ddd;
}

.wrap:nth-of-type(even) .textbox {
	margin-left: 20px;
	background-color: red;
}

.wrap:nth-of-type(even) .textbox::before {
	left: -15px;
	content: "◀";
	color: #ddd;
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
			<div class="wrap" id="comments">
				<div class="chat ch1">
					<ol class="commentList">
						<c:forEach items="${commentList}" var="commentList">
							<li>
								<div class="icon">
									<i class="fa-solid fa-user"></i>
								</div>
								<div class="textbox">
									작성자 : ${commentList.writer} <br /> 작성 날짜 :
									<fmt:formatDate value="${commentList.regdate}"
										pattern="yyyy-MM-dd" />
									<br /> 댓글 내용:
									<p>${commentList.content}</p>
								</div>
							</li>
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
						<label for="writer">댓글 작성자</label><input type="text" id="writer"
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