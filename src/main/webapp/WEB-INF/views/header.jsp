<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style>
.mainicon {
	width: 75px;
	height: 55px;
}
</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-xl">
			<a class="navbar-brand fs-2" href="main"><img
				src="images/mainIcon.png" class="mainicon"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarText"
				aria-controls="navbarText" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active fs-5" href="#">지역축제</a></li>
					<li class="nav-item"><a class="nav-link active fs-5" href="#">행사문의</a></li>
					<li class="nav-item"><a class="nav-link active fs-5" href="#">채용공고</a></li>
					<li class="nav-item"><a class="nav-link active fs-5" href="#">미정</a></li>
					<li class="nav-item"><a class="nav-link active fs-5" href="#">게시판</a></li>
					<li class="nav-item"><a class="nav-link active fs-5" href="#">고객센터</a></li>
				</ul>
				<c:choose>
					<c:when test="${empty sessionScope || sessionScope.loginId == null}">
						<ul class="nav justify-content-end">
							<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="agreement">회원가입</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.loginId eq 'pinata1234'}">
								<ul class="nav justify-content-end ms-5">
									<li class="nav-item"><span class="nav-link"> 관리자모드
											접속중</span></li>
									<li class="nav-item"><a class="nav-link"
										href="<!-- 관리자페이지 -->">관리자페이지</a></li>
									<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="nav justify-content-end ms-5">
									<li class="nav-item"><span class="nav-link">${sessionScope.loginId}님,
											환영합니다.</span></li>
									<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
									<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>

</body>