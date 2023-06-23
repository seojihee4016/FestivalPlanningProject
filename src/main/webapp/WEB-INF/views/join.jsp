<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.errMsg {
	color: red;
	font-style: italic;
}

.container {
	box-border: 1px, solid;
	width: 600px;
}
</style>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<br>
	<br>


	<div class="container">
		<form action="" method="POST">
			아이디 <input type="text" class="form-control" name="login_Id"
				value="${userDto.login_Id}" /><br> <span class="errMsg">
				<spring:hasBindErrors name="userDto">
					<c:if test="${errors.hasFieldErrors('login_Id') }">
						<p>▶ ${errors.getFieldError("login_Id").getDefaultMessage() }</p>
					</c:if>
				</spring:hasBindErrors>
			</span> 비밀번호 <input type="password" class="form-control" name="login_Pw"
				value="${userDto.login_Pw}" /><br> <span class="errMsg">
				<spring:hasBindErrors name="userDto">
					<c:if test="${errors.hasFieldErrors('login_Pw') }">
						<p>▶ ${errors.getFieldError("login_Pw").getDefaultMessage() }</p>
					</c:if>
				</spring:hasBindErrors>
			</span> 이름 <input type="text" class="form-control" name="name"
				value="${userDto.name}" /><br> <span class="errMsg"> <spring:hasBindErrors
					name="userDto">
					<c:if test="${errors.hasFieldErrors('name') }">
						<p>▶ ${errors.getFieldError("name").getDefaultMessage() }</p>
					</c:if>
				</spring:hasBindErrors>
			</span> 이메일 <input type="text" class="form-control" name="email"
				value="${userDto.email}" /><br> <span class="errMsg"> <spring:hasBindErrors
					name="userDto">
					<c:if test="${errors.hasFieldErrors('email') }">
						<p>▶ ${errors.getFieldError("email").getDefaultMessage() }</p>
					</c:if>
				</spring:hasBindErrors>
			</span> 전화번호 <input type="number" class="form-control" name="tel_Number"
				value="${userDto.tel_Number}" /><br> <span class="errMsg">
				<spring:hasBindErrors name="userDto">
					<c:if test="${errors.hasFieldErrors('tel_Number') }">
						<p>▶ ${errors.getFieldError("tel_Number").getDefaultMessage() }</p>
					</c:if>
				</spring:hasBindErrors>
			</span> 생년월일 <input type="number" class="form-control" name="birth"
				value="${userDto.birth}" /><br> <span class="errMsg"> <spring:hasBindErrors
					name="userDto">
					<c:if test="${errors.hasFieldErrors('birth') }">
						<p>▶ ${errors.getFieldError("birth").getDefaultMessage() }</p>
					</c:if>
				</spring:hasBindErrors>
			</span>
			<button type="submit" class="btn btn-primary">등록하기</button>
		</form>
	</div>
</body>
</html>