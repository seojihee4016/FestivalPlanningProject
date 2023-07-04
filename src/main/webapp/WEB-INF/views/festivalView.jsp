<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>
<style type="text/css">
h2, h3, h4 {
	text-align: left;
}


@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;

@font-face {
	font-family: 'HallymGothic-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

html, body {
	height: 100%;
	font-family: HallymGothic-Regular;
}
</style>
</head>
<body>



	<div
		style="display: flex; align-items: center; flex-direction: column;">
		<div
			style="display: flex; justify-content: center; padding-top: 30px;">
			<img alt="" src="${festivalDetailInfo.imgHref}">
		</div>
		<div style="width: 90%;">
			<div
				style="display: flex; align-items: center; flex-direction: column;">
				<div style="text-align: center; width: 910px;">

					<h1>${festivalDetailInfo.fstvlNm}</h1>
					<hr width="100%">
				</div>
			</div>

			<div>
				<div style="padding-left: 20%; margin-top: 20px; width: 910px;">
					<h3 style="margin-top: 30px;">
						축제 내용 : ${festivalDetailInfo.fstvlCo}<br>
					</h3>

				</div>

			</div>

			<div>
				<div style="padding-left: 20%; margin-top: 20px; width: 910px;">

					<h4>기간 : ${festivalDetailInfo.fstvlStartDate} ~
						${festivalDetailInfo.fstvlEndDate}</h4>
					<br>
					<h4>축제 주소 : ${festivalDetailInfo.lnmadr}</h4>
				</div>
			</div>
			<div>
				<div style="padding-left: 20%; margin-top: 20px; width: 910px;">
					<h4>
						전화번호 : ${festivalDetailInfo.phoneNumber}<br>
						<br> 홈페이지 : ${festivalDetailInfo.homepageUrl}<br>
					</h4>
				</div>
			</div>
		</div>
		<div id="map" style="width: 90%; height: 500px; margin-top: 50px; "></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3a1ace8882c963b2a6c6cb119d50764&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${festivalDetailInfo.latitude}, ${festivalDetailInfo.longitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



// 주소로 좌표를 검색합니다
geocoder.addressSearch('${festivalAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${festivalDetailInfo.fstvlNm}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>