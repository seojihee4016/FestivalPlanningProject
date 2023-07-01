<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
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
		<img src="images/신청 양식 이미지1.png">
		<section class="header-wrap">
			<div class="top-deco">""</div>

			<section class="header">
				<h1>축제 신청 양식</h1>
				<br />
				<p>행사 문의</p>
				<p>문의 링크 / 이메일</p>
			</section>
			<div class="trans">
				<c:out value="${writer}" />
			</div>
		</section>
	</header>

	<main>
		<p>
			<span id="essential">*</span> 은 필수 입력입니다.
		</p>

		<form action="applicationForm" method="post" class="form"
			onsubmit="return validateForm()">
			<fieldset>
				<p class="place" id="">
					장소 구분을 선택해주세요 <span id="essential">*</span>
				</p>
				<br> <input type="radio" name="place" id="inside"
					value="inside"><label for="inside"> 실내</label> <br> <input
					type="radio" name="place" id="outdoors" value="outdoors"> <label
					for="outdoors"> 실외</label> <br> <input type="radio"
					name="place" id="inAndOut" value="inAndOut"> <label
					for="inAndOut">실내 + 실외</label> <br>
			</fieldset>

			<fieldset>
				<p class="festival_name">
					행사명을 적어주세요 <span id="essential">*</span>
				</p>
				<br> <input type="text" class="answer1" name="festivalName"
					value="" placeholder="행사명을 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="address_event">
					행사장 주소를 적어주세요 <span id="essential">*</span>
				</p>
				<br> <input type="text" class="answer1" name="addressEvent"
					placeholder="행사장 주소를 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="Number_of_people">
					예상 인원 수가 어떻게 되시나요? <span id="essential">*</span>
				</p>
				<br> <input type="radio" id="50" name="NumberOfPeople"
					value="NumberOfPeople 50"> <label for="50">50명 이내</label> <br>
				<input type="radio" id="51~100" name="NumberOfPeople"
					value="NumberOfPeople 51~100"> <label for="51~100">51~100명</label>
				<br> <input type="radio" id="101~200" name="NumberOfPeople"
					value="NumberOfPeople 101~200"> <label for="101~200">101명~200명</label>
				<br> <input type="radio" id="201~300" name="NumberOfPeople"
					value="NumberOfPeople 201~300"> <label for="201~300">201명
					~ 400명</label> <br> <input type="radio" id="301~400"
					name="NumberOfPeople" value="NumberOfPeople 301~400"> <label
					for="301~400">400명 이상</label> <br>
			</fieldset>

			<fieldset>
				<p class="carrying_difficulty">
					운반 난이도가 어떻게 되시나요? <span id="essential">*</span>
				</p>
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
				<p class="start_date">
					행사일 시작 일이 어떻게 되시나요? <span id="essential">*</span>
				</p>
				<br>
				<p class="mini-name">날짜</p>
				<input type="date" class="datetime" value="startDate"
					name="startDate" min="">
			</fieldset>

			<fieldset>
				<p class="end_date">
					행사 종료 일이 어떻게 되시나요? <span id="essential">*</span>
				</p>
				<br>
				<p class="mini-name">날짜</p>
				<input type="date" class="datetime" value="endDate" name="endDate">
			</fieldset>

			<fieldset>
				<p class="budget_range">
					예상 금액이 어떻게 되시나요? <span id="essential">*</span>
				</p>
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
				<p class="commissioning_agency">
					의뢰 회사(기관)을 적어주세요 <span id="essential">*</span>
				</p>
				<br> <input type="text" class="answer1"
					name="commissioningAgency" value="" placeholder="회사명을 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="name">
					담당자 성함을 적어주세요 <span id="essential">*</span>
				</p>
				<br> <input type="text" class="answer1" name="name" value=""
					placeholder="담당자 성함을 입력해주세요">
			</fieldset>

			<!-- null 값 방지용 input -->
			<input type="hidden" name="writer"
				value="<c:out value="${writer}" />">

			<div class="bottom">
				<button type="submit" class="submit">제출</button>
				<button type="reset" class="clear">양식 지우기</button>
			</div>
		</form>
	</main>


	<!-- 유효성 검사 스크립트 -->
	<script>
		function validateForm() {
			var placeRadioButtons = document
					.querySelectorAll('input[name="place"]');
			var placeRadioButtonChecked = false;
			for (var i = 0; i < placeRadioButtons.length; i++) {
				if (placeRadioButtons[i].checked) {
					placeRadioButtonChecked = true;
					break;
				}
			}
			if (!placeRadioButtonChecked) {
				alert('장소 구분을 선택해주세요.');
				return false;
			}

			// 예상 인원 수
			var numberOfPeopleRadioButtons = document
					.querySelectorAll('input[name="NumberOfPeople"]');
			var numberOfPeopleRadioButtonChecked = false;
			for (var i = 0; i < numberOfPeopleRadioButtons.length; i++) {
				if (numberOfPeopleRadioButtons[i].checked) {
					numberOfPeopleRadioButtonChecked = true;
					break;
				}
			}
			if (!numberOfPeopleRadioButtonChecked) {
				alert('예상 인원 수를 선택해주세요.');
				return false;
			}

			// 행사명
			var festivalNameField = document
					.querySelector('input[name="festivalName"]');
			if (festivalNameField.value.trim() === '') {
				alert('행사명을 입력해주세요.');
				return false;
			}

			// 행사장 주소
			var addressEventField = document
					.querySelector('input[name="addressEvent"]');
			if (addressEventField.value.trim() === '') {
				alert('행사장 주소를 입력해주세요.');
				return false;
			}

			// 의뢰 회사(기관)
			var commissioningAgencyField = document
					.querySelector('input[name="commissioningAgency"]');
			if (commissioningAgencyField.value.trim() === '') {
				alert('회사명을 입력해주세요.');
				return false;
			}

			// 담당자 성함 (name) field
			var nameField = document.querySelector('input[name="name"]');
			if (nameField.value.trim() === '') {
				alert('담당자 성함을 입력해주세요.');
				return false;
			}

			var carryingDifficultySelect = document
					.querySelector('select[name="carryingDifficulty"]');
			if (carryingDifficultySelect.value === '운반 난이도를 선택해주세요') {
				alert('운반 난이도를 선택해주세요.');
				return false;
			}

			var budgetRangeSelect = document
					.querySelector('select[name="budgetRange"]');
			if (budgetRangeSelect.value === '예상 금액을 선택해주세요') {
				alert('예상 금액을 선택해주세요.');
				return false;
			}

			var startDateField = document
					.querySelector('input[name="startDate"]');
			if (startDateField.value.trim() === '') {
				alert('행사 시작 날짜를 선택해주세요.');
				return false;
			}

			var endDateField = document.querySelector('input[name="endDate"]');
			if (endDateField.value.trim() === '') {
				alert('행사 종료 날짜를 선택해주세요.');
				return false;
			}

			var startDate = new Date(startDateField.value);
			var endDate = new Date(endDateField.value);
			if (endDate < startDate) {
				alert('행사 종료 날짜는 행사 시작 날짜보다 이후 날짜여야 합니다.');
				return false;
			}

			var selectedStartDate = new Date(startDateField.value + 'T00:00:00'); // Add time information (00:00:00)
			var currentDate = new Date();

			var minDate = new Date(selectedStartDate); // Copy selected start date
			minDate.setDate(minDate.getDate() - 7); // Subtract 7 days

			if (currentDate > minDate) {
				alert('마감 기한은 행사 시작 7일 전까지입니다.');
				return false;
			}

			return true;
		}

		var form = document.querySelector('form');
		form.addEventListener('submit', function(event) {
			event.preventDefault(); // 잘못된 경우 폼 전송 막기

			if (validateForm()) {
				if (confirm('작성하시겠습니까?')) {
					form.submit();
				}
			}
		});

		function resetForm() {
			// 양식의 ID를 사용하여 각 필드를 초기 상태로 되돌립니다.
			document.getElementById("formId").reset();
		}
	</script>

</body>
</html>