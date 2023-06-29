<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집 입력</title>
<link href="${path}/css/staffForm.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container">
		<h1>스탭 모집 공고 올리기</h1>
		<form action="" method="post">
			<div class="formContainer">
				<div class="formArea">
					<input type="hidden" name="SRNO" value="${formDto.fno}" />
					<p class="formKey">축제명</p>
					<p class="formValue">${formDto.festivalName}</p>
					<p class="formKey">주최</p>
					<p class="formValue">${formDto.commissioningAgency}</p>
					<p class="formKey">축제장소</p>
					<p class="formValue">${formDto.addressEvent}</p>
					<p class="formKey">장소구분</p>
					<p class="formValue">
						<c:set var="place" value="${formDto.place}" />
						<c:if test="${place == 'inside'}">
							실내
						</c:if>
						<c:if test="${place == 'outdoors'}">
							실외
						</c:if>
						<c:if test="${place == 'inAndOut'}">
							실내 + 실외
						</c:if>
					</p>
					<p class="formKey">축제 기간</p>
					<p class="formValue">${formDto.startDate} ~ ${formDto.endDate}</p>
				</div>
				<div class="formArea">
					<p class="formKey">모집인원</p> <!-- String 값 비교 후 int형변환+value 저장 -->
					<p class="formValue borderBottom">
						<c:set var="numberOfPeople" value="${formDto.numberOfPeople}" />
						<c:if test="${numberOfPeople == 'NumberOfPeople 50'}">
							<fmt:parseNumber var="recruitmentTO_value" value="50" integerOnly="true" />
						</c:if>
						<c:if test="${numberOfPeople == 'NumberOfPeople 51~100'}">
							<fmt:parseNumber var="recruitmentTO_value" value="100" integerOnly="true" />
						</c:if>
						<c:if test="${numberOfPeople == 'NumberOfPeople 101~200'}">
							<fmt:parseNumber var="recruitmentTO_value" value="200" integerOnly="true" />
						</c:if>
						<c:if test="${numberOfPeople == 'NumberOfPeople 201~300'}">
							<fmt:parseNumber var="recruitmentTO_value" value="300" integerOnly="true" />
						</c:if>
						<c:if test="${numberOfPeople == 'NumberOfPeople 301~400'}">
							<fmt:parseNumber var="recruitmentTO_value" value="400" integerOnly="true" />
						</c:if>
						
						<!-- 모집인원 화면 출력시 input 기본값 소수점 없애기 -->
						<fmt:parseNumber var="recruitmentTO_value" value="${recruitmentTO_value/10}" integerOnly="true" />
						<input type="text" class="inputText" name="recruitmentTO" value="${recruitmentTO_value}" />
					</p>
					
					<p class="formKey">모집분야</p>
					<p class="formValue">
						<input type="radio" name="recruitmentField" id="rf1" value="rf1" checked="checked" /><label for="rf1"> 안내 도우미 </label>
						<input type="radio" name="recruitmentField" id="rf2" value="rf2" /><label for="rf2"> 안전요원 </label>
						<input type="radio" name="recruitmentField" id="rf0" value="rf0" /><label for="rf0"> 기타</label>
					</p>
					<p class="formKey">우대사항</p>
					<p class="formValue borderBottom"><input type="text" class="inputText" name="preferentialTreatment" placeholder="해당사항을 적어주세요"/></p>
					
			<%--  		<fmt:parseDate value="${formDto.endDate}" var="endDateValue" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${endDateValue}" pattern="yyyy-MM-dd"/> --%>
					<p class="formKey">접수기간</p>
					<p class="formValue inputText">
			<%-- 		 	<fmt:parseDate value="${formDto.endDate}" var="endDateValue" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${endDateValue}" pattern="yyyy-MM-dd"/> --%>
						<input type="date" class="inputText" name="applicationPeriod" value="${formDto.endDate}" />
					</p>
				</div>
			</div>
			<div class="btnArea">
				<button type="submit" id="submitBtn">업로드</button>
			</div>
		</form>	
	</div>
</body>
</html>














