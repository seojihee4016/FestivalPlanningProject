<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${path}/css/applicationForm.css" rel="stylesheet"
	type="text/css" />
<title>게시판</title>

</head>
<body>
	<header>
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

		<form action="updateView" method="post" class="form" name="updateForm">
			<fieldset>
				<p class="place">장소 구분을 선택해주세요 *</p>
				<br> <input type="radio" name="place" id="inside" value="inside"
					<c:if test="${update.place == '실내'}">checked</c:if>> <label
					for="inside"> 실내</label> <br> <input type="radio" name="place"
					id="outdoors" value="outdoors"
					<c:if test="${update.place == '실외'}">checked</c:if>> <label
					for="outdoors"> 실외</label> <br> <input type="radio"
					name="place" id="inAndOut" value="inAndOut"
					<c:if test="${update.place == '실내 + 실외'}">checked</c:if>> <label
					for="inAndOut">실내 + 실외</label> <br>
			</fieldset>

			<fieldset>
				<p class="festival_name">행사명을 적어주세요 *</p>
				<br> <input type="text" class="answer1" name="festivalName"
					value="${update.festivalName}" placeholder="행사명을 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="address_event">행사장 주소를 적어주세요 *</p>
				<br> <input type="text" class="answer1" name="addressEvent"
					value="${update.addressEvent}" placeholder="행사장 주소를 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="Number_of_people">예상 인원 수가 어떻게 되시나요? *</p>
				<br> <input type="radio" name="numberOfPeople"
					value="NumberOfPeople 50" id="numberOfPeople_50"
					<c:if test="${update.numberOfPeople == 'NumberOfPeople 50'}">checked</c:if>>
				<label for="numberOfPeople_50">50명 이내</label> <br> <input
					type="radio" name="numberOfPeople" value="NumberOfPeople 51~100"
					id="numberOfPeople_51_100"
					<c:if test="${update.numberOfPeople == 'NumberOfPeople 51~100'}">checked</c:if>>
				<label for="numberOfPeople_51_100">51~100명</label> <br> <input
					type="radio" name="numberOfPeople" value="NumberOfPeople 101~200"
					id="numberOfPeople_101_200"
					<c:if test="${update.numberOfPeople == 'NumberOfPeople 101~200'}">checked</c:if>>
				<label for="numberOfPeople_101_200">101명~200명</label> <br> <input
					type="radio" name="numberOfPeople" value="NumberOfPeople 201~300"
					id="numberOfPeople_201_300"
					<c:if test="${update.numberOfPeople == 'NumberOfPeople 201~300'}">checked</c:if>>
				<label for="numberOfPeople_201_300">201명 ~ 400명</label> <br> <input
					type="radio" name="numberOfPeople" value="NumberOfPeople 301~400"
					id="numberOfPeople_301_400"
					<c:if test="${update.numberOfPeople == 'NumberOfPeople 301~400'}">checked</c:if>>
				<label for="numberOfPeople_301_400">400명 이상</label> <br>
			</fieldset>

			<fieldset>
				<p class="carrying_difficulty">운반 난이도가 어떻게 되시나요? *</p>
				<br> <select name="carryingDifficulty" id="carryingDifficulty">
					<option selected>운반 난이도를 선택해주세요</option>
					<option value="level1"
						<c:if test="${update.carryingDifficulty == 'level1'}">selected</c:if>>실외
						행사장 / 차량이 행사 현장까지 진입 가능</option>
					<option value="level2"
						<c:if test="${update.carryingDifficulty == 'level2'}">selected</c:if>>실외
						행사장 / 차량이 행사 현장까지 진입 불가능</option>
					<option value="level3"
						<c:if test="${update.carryingDifficulty == 'level3'}">selected</c:if>>실내
						행사장 / 1층이라 엘레베이터 필요 없음</option>
					<option value="level4"
						<c:if test="${update.carryingDifficulty == 'level4'}">selected</c:if>>실내
						행사장 / 지하 또는 지상층이지만 엘레베이터 있음</option>
					<option value="level5"
						<c:if test="${update.carryingDifficulty == 'level5'}">selected</c:if>>실내
						행사장 / 지하 또는 지상층이지만 엘레베이터 없음</option>
					<option value="level0"
						<c:if test="${update.carryingDifficulty == 'level0'}">selected</c:if>>잘
						몰라요</option>
				</select>
			</fieldset>

			<fieldset>
				<p class="start_date">행사일과 시작 시간이 어떻게 되시나요? *</p>
				<br>
				<p class="mini-name">날짜</p>
				<input type="date" class="datetime" value="${update.startDate}"
					name="startDate">
			</fieldset>

			<fieldset>
				<p class="end_date">행사일과 종료 시간이 어떻게 되시나요? *</p>
				<br>
				<p class="mini-name">날짜</p>
				<input type="date" class="datetime" value="${update.endDate}"
					name="endDate">
			</fieldset>

			<fieldset>
				<p class="budget_range">예상 금액이 어떻게 되시나요? *</p>
				<br> <select name="budgetRange" id="budgetRange">
					<option selected>예상 금액을 선택해주세요</option>
					<option value="budgetRange 100"
						<c:if test="${update.budgetRange == 'budgetRange 100'}">selected</c:if>>100만원
						이하</option>
					<option value="budgetRange 100~200"
						<c:if test="${update.budgetRange == 'budgetRange 100~200'}">selected</c:if>>100만원
						~ 200만원</option>
					<option value="budgetRange 200~300"
						<c:if test="${update.budgetRange == 'budgetRange 200~300'}">selected</c:if>>200만원
						~ 300만원</option>
					<option value="budgetRange 300~400"
						<c:if test="${update.budgetRange == 'budgetRange 300~400'}">selected</c:if>>300만원
						~ 400만원</option>
					<option value="budgetRange 400~500"
						<c:if test="${update.budgetRange == 'budgetRange 400~500'}">selected</c:if>>400만원
						~ 500만원</option>
					<option value="budgetRange 500~600"
						<c:if test="${update.budgetRange == 'budgetRange 500~600'}">selected</c:if>>500만원
						~ 600만원</option>
					<option value="budgetRange 600~1000"
						<c:if test="${update.budgetRange == 'budgetRange 600~1000'}">selected</c:if>>600만원
						~ 1000만원</option>
					<option value="budgetRange 1000~3000"
						<c:if test="${update.budgetRange == 'budgetRange 1000~3000'}">selected</c:if>>1000만원
						~ 3000만원</option>
					<option value="budgetRange 3000~"
						<c:if test="${update.budgetRange == 'budgetRange 3000~'}">selected</c:if>>3000만원
						이상</option>
				</select>
			</fieldset>

			<fieldset>
				<p class="commissioning_agency">의뢰 회사(기관)을 적어주세요 *</p>
				<br> <input type="text" class="answer1"
					name="commissioningAgency" value="${update.commissioningAgency}"
					placeholder="회사명을 입력해주세요">
			</fieldset>

			<fieldset>
				<p class="name">담당자 성함을 적어주세요 *</p>
				<br> <input type="text" class="answer1" name="name"
					value="${update.name}" placeholder="성함을 입력해주세요">
			</fieldset>



			<button type="submit" class="update_btn">수정</button>
			<button type="button" class="cancel-btn" onclick="history.back();">취소</button>
		</form>
	</main>


	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// 장소 구분 값 가져오기
							var place = "${update.place}";
							var placeRadios = document
									.getElementsByName("place");
							for (var i = 0; i < placeRadios.length; i++) {
								if (placeRadios[i].value === place) {
									placeRadios[i].checked = true;
									break;
								}
							}

							// 행사명 값 가져오기
							var festivalName = "${update.festivalName}";
							document.getElementsByName("festivalName")[0].value = festivalName;

							// 행사장 주소 값 가져오기
							var addressEvent = "${update.addressEvent}";
							document.getElementsByName("addressEvent")[0].value = addressEvent;

							// 예상 인원 수 값 가져오기
							var numberOfPeople = "${update.numberOfPeople}";
							var numberOfPeopleRadios = document
									.getElementsByName("numberOfPeople");
							for (var j = 0; j < numberOfPeopleRadios.length; j++) {
								if (numberOfPeopleRadios[j].value === numberOfPeople) {
									numberOfPeopleRadios[j].checked = true;
									break;
								}
							}

							// 운반 난이도 값 가져오기
							var carryingDifficulty = "${update.carryingDifficulty}";
							document.getElementById("carryingDifficulty").value = carryingDifficulty;

							// 행사 시작일 값 가져오기
							var startDate = "${update.startDate}";
							document.getElementsByName("startDate")[0].value = startDate
									.substring(0, 10);

							// 행사 종료일 값 가져오기
							var endDate = "${update.endDate}";
							document.getElementsByName("endDate")[0].value = endDate
									.substring(0, 10);

							// 예상 금액 값 가져오기
							var budgetRange = "${update.budgetRange}";
							document.getElementById("budgetRange").value = budgetRange;

							// 의뢰 회사(기관) 값 가져오기
							var commissioningAgency = "${update.commissioningAgency}";
							document.getElementsByName("commissioningAgency")[0].value = commissioningAgency;

							// 담당자 성함 값 가져오기
							var name = "${update.name}";
							document.getElementsByName("name")[0].value = name;
						});
	</script>



	<!--<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[name='readForm']");

			// 수정 
			$(".update_btn").on("click", function() {
				formObj.attr("action", "/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			})
	 
			// 삭제
			$(".delete_btn").on("click", function() {
				formObj.attr("action", "/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})

			// 취소
			$(".list_btn").on("click", function() {

				location.href = "/list";
			}) 
		})
	</script>
	-->
	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[name='updateForm']");

			// 수정 
			$(".update_btn").on("click", function() {
				formObj.attr("action", "/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			});

			// 수정 취소
			$(".cancel_update_btn").on("click", function() {
				formObj.attr("action", "/cancelUpdate");
				formObj.attr("method", "post");
				formObj.submit();
			});
		});
	</script>


</body>
</html>