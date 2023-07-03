<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<link href="${path}/css/bulletinBoard.css?ver=3" rel="stylesheet"
	type="text/css" />
<meta charset="UTF-8">
<title>BulletinBoard</title>
<style>
</style>
</head>
<body>

	<article class="qna-sec">
		<h1>
			Q<img src="images/pinata.png">A
		</h1>

		<div class="box">
			<h3>문의하기</h3>

			<form role="form" method="post" action="BulletinBoard"
				onsubmit="return validateForm()">

				<ul class="cont-box">

					<li><select name="typeOfInquiry" id="typeOfInquiry">
							<option selected disabled>선택해주세요</option>
							<option value="[축제 문의]">축제 문의</option>
							<option value="[배치도 문의]">배치도 문의</option>
							<option value="[가격 문의]">가격 문의</option>
							<option value="[홍보 문의]">홍보 문의</option>
							<option value="[그 외]">그 외</option>
					</select></li>

					<li><input type="text" id="title" name="title" value=""
						placeholder="제목을 입력하세요" /></li>

					<li>
						<div class="tx">
							<textarea placeholder="문의내용을 입력해주세요. (2000자 이내)" maxlength="2000"
								id="content" name="content" rows="12"></textarea>
							<span id="overs">(0/2000자)</span>
						</div>
					</li>

					<li><label for="writer">작성자</label><input type="text"
						id="writer" name="writer" value="<c:out value="${writer}" />"
						readonly /></li>

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
				<button type="submit">작성</button>
			</form>

		</div>
	</article>

	<script>
		function validateForm() {

			var selectElement = document.getElementById('typeOfInquiry');
			var selectedOption = selectElement.options[selectElement.selectedIndex].text;

			if (selectedOption === '선택해주세요') {
				alert('문의 유형을 선택해주세요.');
				return false;
			}

			if (title.value.trim() === '') {
				alert('제목을 입력해주세요.');
				return false;
			}
			if (content.value.trim() === '') {
				alert('내용을 입력해주세요.');
				return false;
			}
			if (writer.value.trim() === '') {
				alert('로그인을 해주세요.');
				return false;
			}
			if (true) {
				alert('게시글을 작성하시겠습니까?');
				return true;
			}
		}
	</script>


</body>
</html>
