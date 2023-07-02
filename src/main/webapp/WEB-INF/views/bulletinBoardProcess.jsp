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




			<%--댓글 조회 --%>
			<div class="wrap" id="comments">
				<form name="updateAndDeleteComments" method="post" action="">
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
											<p>
												<input type="text" value="${commentList.content}"
													style="width: 400px;">
											</p>

											<c:if test="${commentList.writer == sessionScope.loginId}">
												<button type="button" class="replyUpdateBtn"
													data-cno="${commentList.cno}">수정</button>
											</c:if>

											<c:if test="${commentList.writer == sessionScope.loginId}">
												<button type="button" class="replyDeleteBtn"
													data-cno="${commentList.cno}">삭제</button>

											</c:if>
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
											<p>
												<input type="text" value="${commentList.content}"
													style="width: 400px;">
											</p>

											<div>
												<c:if test="${commentList.writer == sessionScope.loginId}">
													<button type="button" class="replyUpdateBtn"
														data-cno="${commentList.cno}">수정</button>
												</c:if>

												<c:if test="${commentList.writer == sessionScope.loginId}">
													<button type="button" class="replyDeleteBtn"
														data-cno="${commentList.cno}">삭제</button>

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
						<br /> <label for="content"></label> <input type="text"
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





	<!-- 게시글 수정 / 삭제 -->
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


	<!-- 게시글 / 댓글 input 유효성 검사 -->
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
		/*목록으로 이동 시 페이징*/
		$(".list-btn")
				.on(
						"click",
						function() {
							location.href = "/bulletinBoardList?page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
						});
	</script>

	<script>
	/*댓글 작성*/
	$(".replyWriteBtn").on("click", function() {
	    if (confirm("댓글을 작성하시겠습니까?")) {
	        var formObj = $("form[name='replyForm']");
	        formObj.attr("action", "writeComments");
	        formObj.submit();
	    }
	});

	/*댓글 수정*/
	$(document).ready(function() {
	    $(".replyUpdateBtn").on("click", function() {
	        if (confirm("댓글을 수정하시겠습니까?")) {
	            var cno = $(this).attr("data-cno");
	            var updatedContent = $(this).closest("li").find("input[type='text']").val();

	            // AJAX를 사용하여 서버로 수정된 내용 전송
	            $.ajax({
	                type: "POST",
	                url: "/updateCommentsByCno",
	                data: {
	                    cno: cno,
	                    content: updatedContent
	                },
	                success: function(response) {
	                    // 수정 성공 시 처리할 코드 작성
	                    alert("댓글이 수정되었습니다.");
	                    // 페이지 새로고침 또는 필요한 작업 수행
	                    location.reload();
	                },
	                error: function(xhr, status, error) {
	                    // 수정 실패 시 처리할 코드 작성
	                    alert("댓글 수정에 실패했습니다. 다시 시도해주세요.");
	                }
	            });
	        }
	    });


	        $(".replyDeleteBtn").on("click", function() {
	            if (confirm("댓글을 삭제하시겠습니까?")) {
	                var cno = $(this).attr("data-cno");
	                var deletedContent = $(this).closest("li").find("input[type='text']").val();

	                // AJAX를 사용하여 서버로 삭제 요청 전송
	                $.ajax({
	                    type: "post",
	                    url: "/deleteReply",
	                    data: {
	                        cno: cno,
	                        content: deletedContent
	                    },
	                    success: function(response) {
	                        // 삭제 성공 시 처리할 코드 작성
	                        alert("댓글이 삭제되었습니다.");
	                        // 페이지 새로고침 또는 필요한 작업 수행
	                        location.reload();
	                    },
	                    error: function(xhr, status, error) {
	                        // 삭제 실패 시 처리할 코드 작성
	                        alert("댓글 삭제에 실패했습니다. 다시 시도해주세요.");
	                    }
	                });
	            }
	        });
	    });



	</script>




</body>
</html>