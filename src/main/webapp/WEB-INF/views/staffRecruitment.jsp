<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 신청</title>
<link href="${path}/css/staffApply.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container">
		<h3>스탭 신청하기</h3>
		<form action="" method="post">
			<div class="formContainer">
				<div class="formArea">
					<input type="hidden" name="SRNO" value="${staffFormListByFno.fno}" />
					<input type="hidden" name="id" value="${sessionScope.loginId}" />
				 	<p class="formKey">축제명</p>
				 	<p class="formValue">${staffFormListByFno.festivalName}</p>
					<p class="formKey">주최</p>
					<p class="formValue">${staffFormListByFno.commissioningAgency}</p>
					<p class="formKey">축제 장소</p>
					<p class="formValue">${staffFormListByFno.addressEvent}</p>
			 		<p class="formKey">장소구분</p>
			 		<p class="formValue">
						<c:forEach var="Code" items="${commonCodeList}">
							<c:set var="place" value="${staffFormListByFno.place}" />
							<c:if test="${place == Code.codeType}">
			        			${Code.codeName}
			    			</c:if>
						</c:forEach>
					</p>
					<p class="formKey">축제 기간</p>
					<p class="formValue">
						<!-- 문자열에서 Date 형변환 -->
						<fmt:parseDate var="startDate" value="${staffFormListByFno.startDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:parseDate var="endDate" value="${staffFormListByFno.endDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<!-- Date 객체를 원하는 형식의 문자열로 변환 -->
						<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
						<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
	
						${formattedStartDate} ~ ${formattedEndDate}
					</p> 
				</div>
				<div class="formArea">
				 	<p class="formKey">모집인원</p>
				 	<p class="formValue">${staffFormListByFno.recruitmentTO} 명</p>
					<p class="formKey">모집분야</p>
					<p class="formValue">
						<c:forEach var="Code" items="${commonCodeList}">
							<c:set var="recruitmentField" value="${staffFormListByFno.recruitmentField}" />
							<c:if test="${recruitmentField == Code.codeType}">
			        			${Code.codeName}
			    			</c:if>
						</c:forEach>
					</p>
					<p class="formKey">우대사항</p>
					 <p class="formValue">
						<c:set var="preferentialTreatment" value="${staffFormListByFno.preferentialTreatment}" />
						<c:if test="${not empty preferentialTreatment}">
							${staffFormListByFno.preferentialTreatment}
						</c:if>
						<c:if test="${empty preferentialTreatment}">
							해당 없음
						</c:if>
					</p>
					<p class="formKey">접수기간</p>
					<p class="formValue">~ ${staffFormListByFno.applicationPeriod}</p> 
				</div>
			</div>
			<hr />
			<br>
			<div class="IContainer">
				<div class="inputContainer">
					<c:set var="maxDate" value="" />
					<c:if test="${staffFormListByFno != null}">
						<c:set var="maxDate" value="${staffFormListByFno.applicationPeriod}" />
					</c:if>
			
				 	<p class="formKey">지원기간</p>
				 	<p class="formValue">
				 			 <input type="date" name="supportPeriodStart" required="required"
				 					min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" />
				 		   ~ <input type="date" name="supportPeriodEnd" required="required"
				 		   			min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" />
				 	</p>
				 	</div>
				 	<div class="inputContainer">
					<p class="formKey">지원분야</p>
					<p class="formValue">
							 <input type="radio" name="recruitmentField" id="rf1" value="rf1" checked="checked" />
							 <label for="rf1">안내 도우미</label>
							 <input type="radio" name="recruitmentField" id="rf2" value="rf2" />
							 <label for="rf2">안전요원</label>
							 <input type="radio" name="recruitmentField" id="rf0" value="rf0" />
							 <label for="rf0">기타</label>
					</p>
					</div>
				</div>
				<div class="btnArea">
					<button type="submit" id="submitBtn">신청하기</button>
				</div>
		</form>
	</div>


<script>
	var errorDate = "${errorDate}";
	if (errorDate) {
		alert(errorDate);
	}
	var errorRecruitmentField = "${errorRecruitmentField}";
	if (errorRecruitmentField) {
		alert(errorRecruitmentField);
	}
	var successApply = "${successApply}";
	if (successApply) {
		alert(successApply);
		location.href ="staffRecruitmentList";
	}
	
	var errorLogin = "${errorLogin}";
	if (errorLogin) {
		alert(errorLogin);
		location.href ="login";
	}
</script>

</body>
</html>