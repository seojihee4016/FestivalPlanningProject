<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/userupdate.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<h1>회원정보 수정</h1>
		<div class="form">
			<form action="" method="POST">
				<div class="input-box">
					<img src="images/password.png">
				</div>
				<div class="restinfo">
					<input type="password" class="form-control mb-1" name="loginPw"
						placeholder="비밀번호" value="${userDto.loginPw}" /> <input
						type="text" class="form-control mb-1" name="email"
						placeholder="이메일" value="${userDto.email}" /> <input type="text"
						class="form-control" name="telNumber" placeholder="전화번호"
						value="${userDto.telNumber}" /> <span class="errMsg"> <spring:hasBindErrors
							name="userDto">
							<c:if test="${errors.hasFieldErrors('loginPw') }">
								<span class="errorMsg">▶
									${errors.getFieldError("loginPw").getDefaultMessage() }</span>
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
							<c:if test="${errors.hasFieldErrors('telNumber') }">
								<span class="errorMsg">▶
									${errors.getFieldError("telNumber").getDefaultMessage() }</span>
							</c:if>
						</spring:hasBindErrors>
					</span>
				</div>
				<div class="btn_submitbox">
					<button type="submit" id="btn_submit" class="btn">수정하기</button>
				</div>
				<br>
			</form>
		</div>
	</div>

</body>
</html>
<%@ include file="footer.jsp"%>