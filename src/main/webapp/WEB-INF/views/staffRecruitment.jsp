<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1>스탭 신청하기</h1>
	 	<p>축제명 : ${staffFormCode.festivalName}</p>
		<p>주최 : ${staffFormCode.commissioningAgency}</p>
		<p>축제 장소 : ${staffFormCode.addressEvent}</p>
 		<p>장소구분 :
			<c:forEach var="Code" items="${commonCodeList}">
				<c:set var="place" value="${staffFormCode.place}" />
				<c:if test="${place == Code.codeType}">
        			${Code.codeName}
    			</c:if>
			</c:forEach>
		</p>
		<p>축제 기간 : ${staffFormCode.startDate} ~ ${staffFormCode.endDate}</p> 
	
	 	<p>모집인원 : ${staffFormCode.recruitmentTO}</p>
		<p>모집분야 : 
			<c:forEach var="Code" items="${commonCodeList}">
				<c:set var="recruitmentField" value="${staffFormCode.recruitmentField}" />
				<c:if test="${recruitmentField == Code.codeType}">
        			${Code.codeName}
    			</c:if>
			</c:forEach>
		</p>
		<p>우대사항 : 
			<c:set var="preferentialTreatment" value="${staffFormCode.preferentialTreatment}" />
			<c:if test="${not empty preferentialTreatment}">
				${staffFormCode.preferentialTreatment}
			</c:if>
			<c:if test="${empty preferentialTreatment}">
				해당 없음
			</c:if>
		</p>
		<p>접수기간 : ~ ${staffFormCode.applicationPeriod}</p> 
	
		<hr />
	
	  	<form action="" method="post">
			<input type="hidden" name="SRNO" value="${staffFormCode.fno}" />
	
			<c:set var="maxDate" value="" />
			<c:if test="${staffFormCode != null}">
				<c:set var="maxDate" value="${staffFormCode.applicationPeriod}" />
			</c:if>
	
		 	<p>지원기간 <input type="date" name="supportPeriodStart" required="required"
		 					min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" />
		 		   ~ <input type="date" name="supportPeriodEnd" required="required"
		 		   			min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" />
		 	</p>
			<p>지원분야 <input type="radio" name="recruitmentField" id="rf1" value="rf1" checked="checked" />
					 <label for="rf1">안내 도우미</label>
					 <input type="radio" name="recruitmentField" id="rf2" value="rf2" />
					 <label for="rf2">안전요원</label>
					 <input type="radio" name="recruitmentField" id="rf0" value="rf0" />
					 <label for="rf0">기타</label>
			</p>
			<button type="submit">신청하기</button>
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
</script>

</body>
</html>