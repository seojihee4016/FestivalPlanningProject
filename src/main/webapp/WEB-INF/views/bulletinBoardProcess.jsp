<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
<link href="${path}/css/bulletinBoard.css?ver=3" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>BulletinBoard</title>
</head>
<body>

	<section id="container">

		<article class="qna-sec">
			<h1>
				Q<img src="images/pinata.png">A
			</h1>

			<div class="box">
				<h3>문의하기</h3>

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
					<ul class="cont-box">

						<li><select name="typeOfInquiry" id="typeOfInquiry">
								<option value="[축제 문의]"
									<c:if test="${updateBulletinBoard.typeOfInquiry == '[축제 문의]'}">selected</c:if>>축제
									문의</option>
								<option value="[배치도 문의]"
									<c:if test="${updateBulletinBoard.typeOfInquiry == '[배치도 문의]'}">selected</c:if>>배치도
									문의</option>
								<option value="[가격 문의]"
									<c:if test="${updateBulletinBoard.typeOfInquiry == '[가격 문의]'}">selected</c:if>>가격
									문의</option>
								<option value="[홍보 문의]"
									<c:if test="${updateBulletinBoard.typeOfInquiry == '[홍보 문의]'}">selected</c:if>>홍보
									문의</option>
								<option value="[그 외]"
									<c:if test="${updateBulletinBoard.typeOfInquiry == '[그 외]'}">selected</c:if>>그
									외</option>
						</select></li>

						<li><input type="text" id="title" name="title"
							value="${updateBulletinBoard.title}" placeholder="제목을 입력하세요" /></li>

						<li>
							<div class="tx">
								<textarea placeholder="문의내용을 입력해주세요. (2000자 이내)"
									maxlength="2000" id="content" name="content" rows="12"></textarea>
								<span id="overs">(0/2000자)</span>
							</div>
						</li>

						<li><label for="writer">작성자</label><input type="text"
							id="writer" name="writer"
							value="<c:out value="${updateBulletinBoard.writer}" />" readonly /></li>

						<li>
							<div class="file-box">
								<input type="file" class="" name="reg-file-1" id="addFile">
								<label for="addFile" class="gray-text"> 첨부파일</label> <span
									class="gray-text">5MB이하의 이미지 파일(JPG, PNG, GIF)<br>
									1개 첨부하실 수 있습니다.
								</span>
							</div>
						</li>
					</ul>

					<c:if test="${sessionScope.loginId == updateBulletinBoard.writer}">
						<button type="submit" class="update_btn">수정</button>
						<button type="submit" class="delete_btn">삭제</button>
					</c:if>
					<button type="button" class="cancel-btn" onclick="history.back();">취소</button>
					<button type="button" class="list-btn">목록</button>
				</form>

			</div>
		</article>
	</section>




	<%--댓글 작성 --%>

	<h3>댓글</h3>
	<div class="qna-sec">
		<div class="box">
			<form name="replyForm" method="post">
				<input type="hidden" id="bno" name="bno"
					value="${updateBulletinBoard.bno}" /> <input type="hidden"
					id="page" name="page" value="${scri.page}" /> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}" /> <input
					type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}" /> <input type="hidden" id="keyword"
					name="keyword" value="${scri.keyword}" />
				<div>

					<div style="width: 100%; height: 20px;">
						<c:choose>
							<%-- 관리자인 경우 --%>
							<c:when test="${sessionScope.loginId eq 'admin'}">
								<label for="writer"></label>
								<input type="text" id="writer" name="writer"
									value="${sessionScope.loginId}" readonly />
							</c:when>

							<%-- 글 작성자인 경우 --%>
							<c:when
								test="${sessionScope.loginId == updateBulletinBoard.writer}">
								<label for="writer"></label>
								<input type="text" id="writer" name="writer"
									value="${updateBulletinBoard.writer}" readonly />
							</c:when>
						</c:choose>
					</div>


					<br /> <label for="content"></label> <input type="text"
						id="content" name="content" />
				</div>
				<div style="margin-top: 10px;">
					<c:if
						test="${sessionScope.loginId == updateBulletinBoard.writer || sessionScope.loginId == 'admin'}">
						<button type="button" class="replyWriteBtn">댓글 작성</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>


	<%--댓글 조회 --%>
	<h3><i class="bi bi-chat-right-dots"></i></h3>
	<div class="qna-sec" style="width: 100%; margin-bottom: 20px;">
		<div class="box">
			<div class="wrap" id="comments" style="width: 100%">
				<form name="updateAndDeleteComments" method="post" action="">
					<div class="chat ch1">
						<ol class="commentList">

							<c:forEach items="${commentList}" var="commentList">

								<%-- 관리자인 경우 --%>

								<c:if test="${commentList.writer eq 'admin'}">

									<li class="comment admin">
										<div class="textbox">
											<p>
												<input type="text" value="${commentList.content}"
													style="width: 100%; background-color: #333; border: solid #333; color: #fff;">
											</p>
											<div style="text-align: right;">
												${commentList.writer}
												<fmt:formatDate value="${commentList.regdate}"
													pattern="yyyy-MM-dd" />
											</div>

											<div style="float: right; width: 100%; margin-top: 40px;">
												<c:if test="${commentList.writer == sessionScope.loginId }">
													<button type="button" class="replyUpdateBtn"
														data-cno="${commentList.cno}">수정</button>
												</c:if>

												<c:if test="${commentList.writer == sessionScope.loginId }">
													<button type="button" class="replyDeleteBtn"
														data-cno="${commentList.cno}">삭제</button>
												</c:if>
											</div>
										</div>
									</li>
								</c:if>

								<%-- 글 작성자인 경우 --%>
								<c:if test="${commentList.writer == updateBulletinBoard.writer}">
									<div style="text-align: left;"></div>
									<li class="comment user">
										<div class="textbox">
											<p>
												<input type="text" value="${commentList.content}"
													style="width: 100%; height: 100%; background-color: #333; border: solid #333; color: #fff;">
											</p>

											<div style="text-align: left;">

												${commentList.writer}
												<fmt:formatDate value="${commentList.regdate}"
													pattern="yyyy-MM-dd" />
											</div>
											<div style="float: left; width: 100%; margin-top: 40px;">
												<c:if test="${commentList.writer == sessionScope.loginId }">
													<button type="button" class="replyUpdateBtn"
														data-cno="${commentList.cno}">수정</button>
												</c:if>

												<c:if test="${commentList.writer == sessionScope.loginId }">
													<button type="button" class="replyDeleteBtn"
														data-cno="${commentList.cno}">삭제</button>
												</c:if>
											</div>
										</div>
									</li>
								</c:if>

							</c:forEach>
						</ol>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 게시글 수정 / 삭제 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("#updateBulletinBoard");

			// 수정
			$(".update_btn").on("click", function(e) {
				e.preventDefault(); // 기본 동작 중지 -> alert 취소 시 !
				if (confirm("수정하시겠습니까?")) {
					formObj.attr("action", "/bulletinBoardProcess");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});

			// 삭제
			$(".delete_btn").on("click", function(e) {
				e.preventDefault(); // 기본 동작 중지 -> alert 취소 시 !
				if (confirm("삭제하시겠습니까?")) {
					formObj.attr("action", "/deleteBulletinBoardByBno");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
		});

		/*수정된 게시글 페이지에 작성한 내용 값 가져오기*/
		var contentTextarea = document.getElementById('content');
		contentTextarea.value = '${updateBulletinBoard.content}';

		/*select 값 수정 금지 */
		var typeOfInquirySelect = document.getElementById('typeOfInquiry');

		typeOfInquirySelect.addEventListener('click', function() {
			typeOfInquirySelect.disabled = true; // 비활성화
			alert('수정할 수 없습니다.');
		});
	</script>


	<!-- 게시글 / 댓글 input 유효성 검사 -->
	<script>
		function validateForm() {

			var selectElement = document.getElementById('typeOfInquiry');
			var selectedOption = selectElement.options[selectElement.selectedIndex].text;

			if (title.value.trim() === '') {
				alert('제목을 입력해주세요.');
				return false;
			}

			var contentTextarea = document.getElementById('content');
			var contentValue = contentTextarea.value.trim();
			if (contentValue === '') {
				alert('내용을 입력해주세요.');
				return false;
			}
			return true;
		}

		var form = document.querySelector('form');
		form.addEventListener('submit', function(event) {
			event.preventDefault(); // 잘못된 경우 폼 전송 막기

			if (validateForm() && confirm('게시글을 작성하시겠습니까?')) {
				form.submit();
			}
		});
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
		$(document).ready(
				function() {
					$(".replyUpdateBtn").on(
							"click",
							function() {
								if (confirm("댓글을 수정하시겠습니까?")) {
									var cno = $(this).attr("data-cno");
									var updatedContent = $(this).closest("li")
											.find("input[type='text']").val();

									// AJAX를 사용하여 서버로 수정된 내용 전송
									$.ajax({
										type : "POST",
										url : "/updateCommentsByCno",
										data : {
											cno : cno,
											content : updatedContent
										},
										success : function(response) {
											// 수정 성공 시 처리할 코드 작성
											alert("댓글이 수정되었습니다.");
											// 페이지 새로고침 또는 필요한 작업 수행
											location.reload();
										},
										error : function(xhr, status, error) {
											// 수정 실패 시 처리할 코드 작성
											alert("댓글 수정에 실패했습니다. 다시 시도해주세요.");
										}
									});
								}
							});

					$(".replyDeleteBtn").on(
							"click",
							function() {
								if (confirm("댓글을 삭제하시겠습니까?")) {
									var cno = $(this).attr("data-cno");
									var deletedContent = $(this).closest("li")
											.find("input[type='text']").val();

									// AJAX를 사용하여 서버로 삭제 요청 전송
									$.ajax({
										type : "post",
										url : "/deleteReply",
										data : {
											cno : cno,
											content : deletedContent
										},
										success : function(response) {
											// 삭제 성공 시 처리할 코드 작성
											alert("댓글이 삭제되었습니다.");
											// 페이지 새로고침 또는 필요한 작업 수행
											location.reload();
										},
										error : function(xhr, status, error) {
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