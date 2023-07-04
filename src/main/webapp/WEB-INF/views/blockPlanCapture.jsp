<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배치도</title>
<link href="${path}/css/blockPlan.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 서브 모듈 로드하기 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ths5zg540n&submodules=drawing"></script>
	
	<!-- 지도가 생성되는 div 영역 -->
	<div id="map" style="margin:0 auto; width:90%; max-width:100%; height:600px;"></div>
	
<script>
	//지도 관련 설정
	$(document).ready(function() {
		var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(36.807322, 127.147193), //지도의 초기 중심 좌표
		    zoomControl: false, //줌 컨트롤의 표시 여부
		    zoomControlOptions: {
		        style: naver.maps.ZoomControlStyle.LARGE,
		        position: naver.maps.Position.TOP_RIGHT
		    },
		    mapTypeControl: true,
		    zoom: 21 //지도의 초기 줌 레벨 최대 21
		});
		
		let geojson = '${strGeoJson}';
		map.data.addGeoJson(JSON.parse(geojson), true);
	});	
</script>
</body>
</html>