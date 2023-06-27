<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.errMsg {
	color: red;
	font-style: italic;
}

.container {
	border: 1px solid lightgray;
	width: 500px;
	height: 100%;
	margin-top: 100px;
}

.form {
	margin-top: 20px;
}

.errorMsg {
	font-size: 0.78rem;
}
</style>
</head>
<body>

	<div class="container">
		<div class="form">
			<h3>회원가입</h3>
			<br>
			<form action="" method="POST">
				<div>
					<input type="text" class="form-control" name="loginId"
						id="login_Id" placeholder="아이디" value="${userDto.loginId}" />
					<button type="button" id="idCheck"
						class="btn btn-primary idCheckBtn">중복체크</button>
				</div>
				<span class="errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('loginId') }">
							<p class="errorMsg">▶
								${errors.getFieldError("loginId").getDefaultMessage() }</p>
						</c:if>
					</spring:hasBindErrors>
				</span><br> <input type="text" class="form-control" name="loginPw"
					placeholder="비밀번호" value="${userDto.loginPw}" /><br> <span
					class="errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('loginPw') }">
							<p class="errorMsg">▶
								${errors.getFieldError("loginPw").getDefaultMessage() }</p>
						</c:if>
					</spring:hasBindErrors>
				</span> <input type="text" class="form-control" name="name"
					placeholder="이름" value="${userDto.name}" /><br> <span
					class="errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('name') }">
							<p class="errorMsg">▶
								${errors.getFieldError("name").getDefaultMessage() }</p>
						</c:if>
					</spring:hasBindErrors>
				</span> <input type="text" class="form-control" name="email"
					placeholder="이메일" value="${userDto.email}" /><br> <span
					class="errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('email') }">
							<p class="errorMsg">▶
								${errors.getFieldError("email").getDefaultMessage() }</p>
						</c:if>
					</spring:hasBindErrors>
				</span> <input type="text" class="form-control" name="birth"
					placeholder="생년월일" value="${userDto.birth}" /><br> <span
					class="errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('birth') }">
							<p class="errorMsg">▶
								${errors.getFieldError("birth").getDefaultMessage() }</p>
						</c:if>
					</spring:hasBindErrors>
				</span> <input type="text" class="form-control" name="telNumber"
					placeholder="전화번호" value="${userDto.telNumber}" /><br> <span
					class="errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('telNumber') }">
							<p class="errorMsg">▶
								${errors.getFieldError("telNumber").getDefaultMessage() }</p>
						</c:if>
					</spring:hasBindErrors>
				</span>

				<button type="submit" id="btn_submit" class="btn btn-primary">등록하기</button>
			</form>
		</div>
	</div>
</body>

<script>
	$(function() {

		$("#idCheck").click(function() {

			const input_id = $("#login_Id").val(); // 입력 아이디 가져오기

			$.ajax({
				type : "POST",
				url : "/idcheck", //요청 할 URL
				async : false,
				data : {
					loginId : input_id
				}, //넘길 파라미터
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.result === 'true') {
						alert("사용가능 아이디");
					} else {
						alert("사용 불가능한 아이디");
					}
				},
				error : function(data) {
					console.log("접속 중 오류가 발생했습니다."); //에러시 실행 할 내용
				}
			});

		});
	});
</script>
</html>