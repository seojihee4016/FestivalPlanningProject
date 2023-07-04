<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link href="css/pwcheck.css" rel="stylesheet" type="text/css">

<div class="pwcheck-box">
	<c:if test="${pwCheck == null}">
		<h1>비밀번호 확인</h1>
		<form action="" method="POST">
			<br>
			<div class="pwbox">
				<input type='password' name="loginPw" class="form-control"
					placeholder="비밀번호 입력" /> <input type="submit"
					class="btn pwCheckBtn" value="확인">
			</div>
			<br>
			<div class="advice-box">
				<p class="advice">▶ 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로 정기적인
					비밀번호 변경을 해주시길 바랍니다.</p>
				<br>
				<div class="nextBtn-box">
					<a type="button" href="main" class="btn nextBtn">다음에 변경하기</a>
				</div>
			</div>
		</form>
	</c:if>
</div>

<%@ include file="footer.jsp"%>
