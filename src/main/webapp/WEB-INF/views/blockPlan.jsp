<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배치도</title>
<link href="${path}/css/blockPlan.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="titleContainer">
	<h3>배치도 만들기</h3>
	<div class="btns">
		<div class="dropdown">
			<button class="btn btn-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				그리기 도구 사용 방법
			</button>
			<ul class="dropdown-menu" style="width: 495px;">
				<ul>
					<b>그리기</b>
			        <li>아이콘이 선택된 상태에서 지도 위에 클릭합니다.</li>
			        <li>shift를 누르고 있는 경우 정방형/직교좌표로 스냅이 제공됩니다.</li>
			        <li>polygon, polyline: 마우스 오른쪽 버튼 클릭/Esc로 그리기 종료.</li>
				</ul>
				<ul>
					<b>이동</b>
			        <li>그려진 도형을 클릭하여 편집 모드로 변경합니다.</li>
			        <li>그려진 도형을 드래그하여 이동합니다.</li>
				</ul>
				<ul>
					<b>수정</b>
			        <li>그려진 도형을 클릭하여 편집 모드로 변경합니다.</li>
			        <li>그려진 도형의 제어점을 드래그하여 수정합니다.</li>
			        <li>polygon, polyline: 중간 제어점을 클릭하면 점을 추가합니다.</li>
				</ul>
				<ul>
					<b>삭제</b>
		        	<li>그려진 도형을 마우스 오른쪽 버튼으로 클릭해 삭제합니다.</li>
				</ul>
			</ul>
		</div>
		<button class="btn btn-success captureBtn" onclick="captureScreenshot()">지도 캡쳐</button>
	</div>
	</div>
		<p class="captureP">지도 캡쳐 시, C드라이브(C:)에 mapsScreenshot 폴더를 생성해 주세요.</p>
	
	<!-- 서브 모듈 로드하기 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ths5zg540n&submodules=drawing,geocoder"></script>
	
	<!-- 지도가 생성되는 div 영역 -->
	<div id="map" style="margin:25px auto; width:90%; max-width:100%; height:600px;"></div>
	
<script>
	//지도 관련 설정
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

	//그리기 도구 관련 설정
	var drawingManager;
	naver.maps.Event.once(map, 'init', function() {
	    drawingManager = new naver.maps.drawing.DrawingManager({
	    	map: map,
	        rectangleOptions: {
	            fillColor: '#ff0000',
	            fillOpacity: 0.5,
	            strokeWeight: 3,
	            strokeColor: '#ff0000'
	        },
	        ellipseOptions: {
	            fillColor: '#ff25dc',
	            fillOpacity: 0.5,
	            strokeWeight: 3,
	            strokeColor: '#ff25dc'
	        },
	        polylineOptions: { // 화살표 아이콘 계열 옵션은 무시됩니다.
	            strokeColor: '#222',
	            strokeWeight: 3
	        },
	        arrowlineOptions: { // startIcon || endIcon 옵션이 없으면 endIcon을 BLOCK_OPEN으로 설정합니다.
	            endIconSize: 16,
	            strokeWeight: 3
	        },
	        polygonOptions: {
	            fillColor: '#ffc300',
	            fillOpacity: 0.5,
	            strokeWeight: 3,
	            strokeColor:'#ffc300'
	        },
		});
	});
	
</script>
    <script>
        function captureScreenshot() {
        	console.log(JSON.stringify(drawingManager.toGeoJson()));
        	
            $.ajax({
                url: "/captureScreenshot",
                method: "POST",
                contentType: "application/json; charset=utf-8", //=제거
                data: JSON.stringify(drawingManager.toGeoJson()),
                success: function(response) {
                    console.log("Screenshot captured successfully");
                    // 여기에서 캡처된 이미지를 처리하거나 표시할 수 있습니다.
                    // 예: 이미지를 <img> 요소에 표시하거나 다운로드 링크 생성
                },
                error: function(xhr, status, error) {
                    console.log("Failed to capture screenshot: " + error);
                }
            });
        }
    </script>

</body>
</html>