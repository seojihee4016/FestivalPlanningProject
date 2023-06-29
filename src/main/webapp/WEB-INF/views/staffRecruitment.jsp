<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
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
	
	 	<p>축제명 : ${formDtoByFno.festivalName}</p>
		<p>주최 : ${formDtoByFno.commissioningAgency}</p>
		<p>축제 장소 : ${formDtoByFno.addressEvent}</p>
		<p>
			장소구분 :
			<c:set var="place" value="${formDtoByFno.place}" />
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
		<p>축제 기간 : ${formDtoByFno.startDate} ~ ${formDtoByFno.endDate}</p> 
	
	 	<p>모집인원 : ${staffRecruitment.recruitmentTO}</p>
		<p>
			모집분야 : 
			<c:set var="recruitmentField" value="${staffRecruitment.recruitmentField}" />
			<c:if test="${recruitmentField == 'rf0'}">
					기타
				</c:if>
			<c:if test="${recruitmentField == 'rf1'}">
					안내도우미
				</c:if>
			<c:if test="${recruitmentField == 'rf2'}">
					안전요원
				</c:if>
		</p>
		<p>우대사항 : ${staffRecruitment.preferentialTreatment}</p>
		<p>접수기간 : ~ ${staffRecruitment.applicationPeriod}</p> 
	
		<hr />
	
	  	<form action="" method="post">
			<input type="hidden" name="SRNO" value="${formDtoByFno.fno}" />
	
			<c:set var="maxDate" value="" />
			<c:if test="${staffRecruitment != null}">
				<c:set var="maxDate" value="${staffRecruitment.applicationPeriod}" />
			</c:if>
	
			<!-- <p>축제 스탭 신청하기 <input type="hidden" name="festivalName" value="${param.festivalName}" /></p> -->		 	<p>지원기간 <input type="date" name="supportPeriodStart" min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" />
		 		   ~ <input type="date" name="supportPeriodEnd" min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" /></p>
			<p>모집분야 <input type="radio" name="recruitmentField" id="rf1" value="rf1" checked="checked" /><label for="rf1">안내 도우미</label>
				<input type="radio" name="recruitmentField" id="rf2" value="rf2" /><label for="rf2">안전요원</label>
				<input type="radio" name="recruitmentField" id="rf0" value="rf0" /><label for="rf0">기타</label>
			</p>
			<button type="submit">신청하기</button>
		</form>
	</div>


<script>
	var error = "${error}";
	if (error) {
		alert(error);
	}
	
</script>

</body>
</html>