<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link href="css/withdrawal.css" rel="stylesheet" type="text/css">
<div class="withdrawal-box">
	<form action="" method="POST" class="withdrawal-form mt-4">
		<br>
		<div class="pwbox">
			<img src="images/check.png" class="check-image" alt="...">
			<h1>회원탈퇴</h1>
			<input type='password' name="loginPw" class="form-control mt-4"
				placeholder="비밀번호 입력" />
		</div>
		<br>
		<div class="advice-box">
			<p class="advice">회원탈퇴 시 개인정보 및 Piñata에서 만들어진 모든 데이터는 삭제됩니다.</p>
			<br>
			<h3>유의사항</h3>
			<p class="advice">▶ 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없습니다.</p>
			<p class="advice">▶ 회원탈퇴 후 재가입 시 기존에 사용하던 아이디와 동일한 아이디로 신규 가입이
				가능합니다.</p>
			<br>
			<div class="nextBtn-box">
				<button type="button" id="withdrawal-btn" class="btn nextBtn">회원탈퇴</button>
			</div>
			<br>
		</div>
	</form>
</div>

<%@ include file="footer.jsp"%>