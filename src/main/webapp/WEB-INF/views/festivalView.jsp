<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3a1ace8882c963b2a6c6cb119d50764"></script>



	${festivalDetailInfo.fstvlNm}
	<br> ${festivalDetailInfo.fstvlCo}
	<br> ${festivalDetailInfo.fstvlStartDate}
	<br> ${festivalDetailInfo.fstvlEndDate}
	<br> ${festivalDetailInfo.phoneNumber}



	<div id="map" style="width: 500px; height: 400px;"></div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>