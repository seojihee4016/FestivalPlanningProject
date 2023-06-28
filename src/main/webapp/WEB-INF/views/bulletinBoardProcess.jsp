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
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
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
			<form role="form" method="post" action="" id="updateBulletinBoard" onsubmit="return validateForm()">
				<input type="hidden" id="bno" name="bno"
					value="${updateBulletinBoard.bno}" />

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
</body>
</html>