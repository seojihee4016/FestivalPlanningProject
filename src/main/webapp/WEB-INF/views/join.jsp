<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/join.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="form">
			<br>
			<div class="d-flex justify-content-center">
				<h3>회원가입</h3>
			</div>
			<br>
			<form action="" method="POST">
				<div class="id_pwbox">
					<div class="idbox">
						<input type="text" class="form-control mb-1" name="loginId"
							id="login_Id" placeholder="아이디" value="${userDto.loginId}" />
						<button type="button" id="idCheck" class="btn idCheckBtn">중복체크</button>
					</div>
					<input type="password" class="form-control" name="loginPw"
						placeholder="비밀번호" value="${userDto.loginPw}" /> <span
						class="errMsg"> <spring:hasBindErrors name="userDto">
							<c:if test="${errors.hasFieldErrors('loginId') }">
								<span class="errorMsg">▶
									${errors.getFieldError("loginId").getDefaultMessage() }</span>
							</c:if>
						</spring:hasBindErrors>
					</span> <span class="errMsg"> <spring:hasBindErrors name="userDto">
							<c:if test="${errors.hasFieldErrors('loginPw') }">
								<p class="errorMsg">▶
									${errors.getFieldError("loginPw").getDefaultMessage() }</p>
							</c:if>
						</spring:hasBindErrors>
					</span>
				</div>
				<br>
				<div class="restinfo">
					<input type="text" class="form-control mb-1" name="name"
						placeholder="이름" value="${userDto.name}" /><input type="text"
						class="form-control mb-1" name="email" placeholder="이메일"
						value="${userDto.email}" /><input type="text"
						class="form-control mb-1" name="birth" placeholder="생년월일"
						value="${userDto.birth}" /><input type="text"
						class="form-control" name="telNumber" placeholder="전화번호"
						value="${userDto.telNumber}" /> <span class="errMsg"> <spring:hasBindErrors
							name="userDto">
							<c:if test="${errors.hasFieldErrors('name') }">
								<span class="errorMsg">▶
									${errors.getFieldError("name").getDefaultMessage() }</span>
								<br>
							</c:if>
						</spring:hasBindErrors>
					</span> <span class="errMsg"> <spring:hasBindErrors name="userDto">
							<c:if test="${errors.hasFieldErrors('email') }">
								<span class="errorMsg">▶
									${errors.getFieldError("email").getDefaultMessage() }</span>
								<br>
							</c:if>
						</spring:hasBindErrors>
					</span> <span class="errMsg"> <spring:hasBindErrors name="userDto">
							<c:if test="${errors.hasFieldErrors('birth') }">
								<span class="errorMsg">▶
									${errors.getFieldError("birth").getDefaultMessage() }</span>
								<br>
							</c:if>
						</spring:hasBindErrors>
					</span> <span class="errMsg"> <spring:hasBindErrors name="userDto">
							<c:if test="${errors.hasFieldErrors('telNumber') }">
								<span class="errorMsg">▶
									${errors.getFieldError("telNumber").getDefaultMessage() }</span>
							</c:if>
						</spring:hasBindErrors>
					</span>
				</div>
				<br>
				<div class="btn_submitbox">
					<button type="submit" class="btn btn_submit">등록하기</button>
				</div>
				<br>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript" src="js/join.js"></script>
</html>
<%@ include file="footer.jsp"%>