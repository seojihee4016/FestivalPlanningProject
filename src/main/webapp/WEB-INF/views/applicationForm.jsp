<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/css/applicationForm.css?ver=3" rel="stylesheet"
	type="text/css" />
<!-- 버전 정보 쿼리스트링 형태로 추가. 브라우저가 url 인식해 캐쉬된 파일 대신 쿼리 스티링 추가된 css사용 -->
<title>google form</title>
</head>
<body>
	<header>

		<img src="images/신청 양식 이미지1.png" >
		<section class="header-wrap">
			<div class="top-deco">""</div>


			<section class="header">
				<h1>축제 신청 폼</h1>
				<p>행사 문의</p>
				<p>문의 링크 / 이메일</p>
			</section>
			<div class="trans">
				세션 아이디 <a href="">로그아웃</a>
			</div>
		</section>
	</header>

	<main>
		<p>*은 필수 입력입니다.</p>


		<form action="applicationForm" method="post" class="form">
			<fieldset>
				<p class="place">장소 구분을 선택해주세요 *</p>
				<br> <input type="radio" name="place" id="inside"
					value="inside"><label for="inside"> 실내</label> <br> <input
					type="radio" name="place" id="outdoors" value="outdoors"> <label
					for="outdoors"> 실외</label> <br> <input type="radio"
					name="place" id="inAndOut" value="inAndOut"> <label
					for="inAndOut">실내 + 실외</label> <br>
			</fieldset>



			<fieldset>
				<p class="festival_name">행사명을 적어주세요 *</p>
				<br> <input type="text" class="answer1" name="festivalName"
					value="festivalName" placeholder="행사명을 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="address_event">행사장 주소를 적어주세요 *</p>
				<br> <input type="text" class="answer1" name="addressEvent"
					placeholder="행사장 주소를 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="Number_of_people">예상 인원 수가 어떻게 되시나요? *</p>
				<br> <input type="radio" name="NumberOfPeople"
					value="NumberOfPeople 50"> <label for="50"> 50명 이내
				</label> <br> <input type="radio" name="NumberOfPeople"
					value="NumberOfPeople 51~100"> <label for="51~100">51~100명</label>
				<br> <input type="radio" name="NumberOfPeople"
					value="NumberOfPeople 101~200"> <label for="101~200">101명~200명</label>
				<br> <input type="radio" name="NumberOfPeople"
					value="NumberOfPeople 201~300"> <label for="201~300">201명
					~ 400명</label> <br> <input type="radio" name="NumberOfPeople"
					value="NumberOfPeople 301~400"> <label for="301~400">400명
					이상</label> <br>
			</fieldset>



			<fieldset>
				<p class="carrying_difficulty">운반 난이도가 어떻게 되시나요? *</p>
				<br> <select name="carryingDifficulty" id="carryingDifficulty">
					<option selected>운반 난이도를 선택해주세요</option>
					<option value="level1">실외 행사장 / 차량이 행사 현장까지 진입 가능</option>
					<option value="level2">실외 행사장 / 차량이 행사 현장까지 진입 불가능</option>
					<option value="level3">실내 행사장 / 1층이라 엘레베이터 필요 없음</option>
					<option value="level4">실내 행사장 / 지하 또는 지상층이지만 엘레베이터 있음</option>
					<option value="level5">실내 행사장 / 지하 또는 지상층이지만 엘레베이터 없음</option>
					<option value="level0">잘 몰라요</option>
				</select>
			</fieldset>


			<fieldset>
				<p class="start_date">행사일과 시작 시간이 어떻게 되시나요? *</p>
				<br>
				<p class="mini-name">날짜</p>
				<input type="date" class="datetime" value="startDate"
					name="startDate">
			</fieldset>
			<!--  시간
			<p class="mini-name">시간</p>
			<input type="time" class="time">
			</fieldset>
		
		 -->

			<fieldset>
				<p class="end_date">행사일과 종료 시간이 어떻게 되시나요? *</p>
				<br>
				<p class="mini-name">날짜</p>
				<input type="date" class="datetime" value="endDate" name="endDate">
			</fieldset>
			<!--  시간
				
				<p class="mini-name">시간</p>
				<input type="time" class="time">
			</fieldset>
			-->



			<fieldset>
				<p class="budget_range">예상 금액이 어떻게 되시나요? *</p>
				<br> <select name="budgetRange" id="budgetRange">
					<option selected>예상 금액을 선택해주세요</option>
					<option value="budgetRange 100">100만원 이하</option>
					<option value="budgetRange 100~200">100만원 ~ 200만원</option>
					<option value="budgetRange 200~300">200만원 ~ 300만원</option>
					<option value="budgetRange 300~400">300만원 ~ 400만원</option>
					<option value="budgetRange 400~500">400만원 ~ 500만원</option>
					<option value="budgetRange 500~600">500만원 ~ 600만원</option>
					<option value="budgetRange 600~1000">600만원 ~ 1000만원</option>
					<option value="budgetRange 1000~3000">1000만원 ~ 3000만원</option>
					<option value="budgetRange 3000~">3000만원 이상</option>
				</select>
			</fieldset>



			<fieldset>
				<p class="commissioning_agency">의뢰 회사(기관)을 적어주세요 *</p>
				<br> <input type="text" class="answer1"
					name="commissioningAgency" value="commissioningAgency"
					placeholder="회사명을 입력해주세요">
			</fieldset>


			<fieldset>
				<p class="name">담당자 성함을 적어주세요 *</p>
				<br> <input type="text" class="answer1" name="name"
					value="name" placeholder="담당자 성함을 입력해주세요">
			</fieldset>


			<div class="bottom">
				<button type="submit" class="submit">제출</button>
				<button type="reset" class="clear">양식 지우기</button>
			</div>
		</form>
	</main>
</body>
</html>