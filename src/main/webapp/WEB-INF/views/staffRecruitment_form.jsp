<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스탭 모집 입력</title>
</head>
<body>
	<h1>staffRecruitment_form</h1>
	
	<form action="" method="post">
		<p>축제명 <input type="text" name="festivalName" /></p>
		<p>주최 <input type="text" name="commissioningAgency" /></p>
		<p>행사 주소 <input type="text" name="addressEvent" /></p>
		<p>장소 구분 <input type="text" name="place" /></p>
		<p>행사 시작일<input type="date" name="startDate" /></p>
		<p>행사 종료일<input type="date" name="endDate" /></p>
		<p>모집인원 <input type="text" name="recruitmentTO" /></p>
		<!-- <p>모집분야 <input type="text" name="recruitmentField" /></p> -->
		<p>모집분야 <input type="radio" name="recruitmentField" checked="checked" />안내 도우미 <input type="radio" name="recruitmentField" />안전요원</p>
		<p>우대사항 <input type="text" name="preferentialTreatment" /></p>
		<p>접수기간 <input type="date" name="applicationPeriod" /></p>
		<button type="submit">업로드</button>
	</form>	
</body>
</html>