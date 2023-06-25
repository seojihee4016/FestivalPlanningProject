<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집</title>
</head>
<body>
	<h1>staffRecruitment</h1>
	<c:forEach var="item" items="${staffRecruitmentListByFestivalName}">
		<p>축제명 : ${item.festivalName}</p>
		<p>주최 : ${item.commissioningAgency}</p>
		<p>축제 장소 : ${item.addressEvent}</p>
		<p>장소구분 : ${item.place}</p>
		<p>축제 기간 : ${item.startDate} ~ ${item.endDate}</p>
		<p>모집인원 : ${item.recruitmentTO}</p>
	    <p>모집분야 :
	        <c:choose>
	            <c:when test="${item.recruitmentField == 1}">안내 도우미</c:when>
	            <c:when test="${item.recruitmentField == 2}">안전요원</c:when>
	            <c:otherwise>기타</c:otherwise>
	        </c:choose>
	    </p>
		<p>우대사항 : ${item.preferentialTreatment}</p>
		<p>접수기간 : ~ ${item.applicationPeriod}</p>
	</c:forEach>
	<hr/>
	<form action="" method="post">

		<c:set var="maxDate" value="" />
		<c:forEach var="item" items="${staffRecruitmentListByFestivalName}">
			<!-- staffRecruitmentListByFestivalName에서 applicationPeriod 값 가져오기 -->
			<c:if test="${maxDate == '' || item.applicationPeriod > maxDate}">
				<c:set var="maxDate" value="${item.applicationPeriod}" />
			</c:if>
		</c:forEach>

		<!-- <p>축제 스탭 신청하기 <input type="hidden" name="festivalName" value="${param.festivalName}" /></p> -->	 	<p>지원기간 <input type="date" name="supportPeriodStart" min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" />
	 		   ~ <input type="date" name="supportPeriodEnd" min="<%= java.time.LocalDate.now().plusDays(1) %>" max="${maxDate}" /></p>
		<p>모집분야 <input type="radio" name="recruitmentField" value="1" checked="checked" /> 안내 도우미
			<input type="radio" name="recruitmentField" value="2" /> 안전요원</p>
		<button type="submit">신청하기</button>
	</form>


<script>
	var error = "${error}";
	if (error) {
		alert(error);
	}
	
</script>

</body>
</html>