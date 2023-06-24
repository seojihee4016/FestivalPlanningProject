<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집</title>
<!-- DateRangePicker js&css -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<h1>staffRecruitment</h1>
	<p>${staffRecruitmentList.supportPeriodStart}</p>
	<c:forEach var="item" items="${staffRecruitmentListByFestivalName}">
		<p>축제명 : ${item.festivalName}</p>
		<p>주최 : ${item.commissioningAgency}</p>
		<p>행사주소 : ${item.addressEvent}</p>
		<p>장소구분 : ${item.place}</p>
		<p>행사기간 : ${item.startDate} ~ ${item.endDate}</p>
		<p>모집인원 : ${item.recruitmentTO}</p>
		<p>모집분야 : ${item.recruitmentField}</p>
		<p>우대사항 : ${item.preferentialTreatment}</p>
		<p>접수기간 : ~ ${item.applicationPeriod}</p>
	</c:forEach>
	<hr/>
	<form action="" method="post">
		<p>지원기간 <input type="text" name="supportPeriod"/></p>
<%-- 	<p>지원기간 <input type="date" name="supportPeriodStart" min="${supportPeriodStart}"/> ~ <input type="date" name="supportPeriodEnd" /></p> --%>
		<p>모집분야 <input type="radio" name="recruitmentField" checked="checked" />안내 도우미 <input type="radio" name="recruitmentField" />안전요원</p>
		<button type="submit">신청하기</button>
	</form>	
	
	
<script>
/* $('input[name="supportPeriod"]').daterangepicker({
    "locale": {
        "format": "YYYY-MM-DD",
        "separator": " ~ ",
        "applyLabel": "확인",
        "cancelLabel": "취소",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    },
    "startDate": new Date(),
    "endDate": new Date(),
    "drops": "auto"
}, function (start, end, label) {
    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
}); */

/* $('input[name="supportPeriod"]').daterangepicker({
    locale: {
    "format": 'YYYY-MM-DD',    			    // 일시 노출 포맷
    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
    "applyLabel": "확인",                    // 확인 버튼 텍스트
    "cancelLabel": "취소",                   // 취소 버튼 텍스트
    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    },
    timePicker: true,                        // 시간 노출 여부
    showDropdowns: true,                     // 년월 수동 설정 여부
    autoApply: true,                         // 확인/취소 버튼 사용여부
    timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
    timePickerSeconds: true,                 // 초 노출 여부
    singleDatePicker: true                   // 하나의 달력 사용 여부
}); */
 
/* 	$('input[name="supportPeriod"]').on('show.daterangepicker', function (ev, picker) {
    $(".yearselect").css("float", "left");
    $(".monthselect").css("float", "right");
    $(".cancelBtn").css("float", "right");
}); */

</script>
</body>
</html>