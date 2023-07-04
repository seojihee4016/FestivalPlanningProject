<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link href="css/userupdate.css" rel="stylesheet" type="text/css">

<div class="container">
	<h1>회원정보 수정</h1>
	<div class="form">
		<form action="" method="POST">
			<div class="input-box">
				<img src="images/password.png">
			</div>
			<br>
			<div class="update-info">
				<input type="password" class="form-control mb-1" name="loginPw"
					placeholder="새로운 비밀번호" value="${userDto.loginPw}" /> <input
					type="text" class="form-control mb-1" name="email"
					placeholder="이메일" value="${userDto.email}" /> <input type="text"
					class="form-control" name="telNumber" placeholder="전화번호"
					value="${userDto.telNumber}" /> <span class="update-errMsg"> <spring:hasBindErrors
						name="userDto">
						<c:if test="${errors.hasFieldErrors('loginPw') }">
							<span class="errorMsg">▶
								${errors.getFieldError("loginPw").getDefaultMessage() }</span>
							<br>
						</c:if>
					</spring:hasBindErrors>
				</span> <span class="update-errMsg"> <spring:hasBindErrors name="userDto">
						<c:if test="${errors.hasFieldErrors('email') }">
							<span class="errorMsg">▶
								${errors.getFieldError("email").getDefaultMessage() }</span>
							<br>
						</c:if>
					</spring:hasBindErrors>
				</span> <span class="update-errMsg"> <spring:hasBindErrors name="userDto">
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

<%@ include file="footer.jsp"%>