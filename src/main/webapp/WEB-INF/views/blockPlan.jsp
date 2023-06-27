<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배치도</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<h1>blockPlan</h1>

	<!-- 서브 모듈 로드하기 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ths5zg540n&submodules=drawing"></script>
	
	<!-- 지도가 생성되는 div 영역 -->
	<div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:700px;"></div>
	
	<p>그리기 도구 사용 방법</p>
	<ol>그리기
		<li>아이콘이 선택된 상태에서 지도 위에 클릭합니다.</li>
		<li>- shift를 누르고 있는 경우 정방형/직교좌표로 스냅이 제공됩니다.</li>
		<li>- polygon, polyline: 마우스 오른쪽 버튼 클릭/Esc로 그리기 종료.</li>
	</ol>
	<ol>이동
		<li>그려진 도형을 클릭하여 편집 모드로 변경합니다.</li>
		<li>그려진 도형을 드래그하여 이동합니다.</li>
	</ol>
	<ol>수정
		<li>그려진 도형을 클릭하여 편집 모드로 변경합니다.</li>
		<li>그려진 도형의 제어점을 드래그하여 수정합니다.</li>
		<li>- polygon, polyline: 중간 제어점을 클릭하면 점을 추가합니다.</li>
	</ol>
	<ol>삭제
		<li>그려진 도형을 마우스 오른쪽 버튼으로 클릭해 삭제합니다.</li>
	</ol>


<script>
	//지도 관련 설정
	var map = new naver.maps.Map('map', {
	    zoomControl: true,
	    zoomControlOptions: {
	        style: naver.maps.ZoomControlStyle.LARGE,
	        position: naver.maps.Position.TOP_RIGHT
	    },
	    mapTypeControl: true,
	    zoom: 15
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
	     drawingManager.addDrawing(rect, naver.maps.drawing.DrawingMode.RECTANGLE, 'my-id');
	     drawingManager.addDrawing(polygon, naver.maps.drawing.DrawingMode.POLYGON); 
	    
		/*      
		drawingManager.setOptions('drawingControlOptions', {
	        position: naver.maps.Position.BOTTOM_CENTER,
	        style: naver.maps.drawing.DrawingStyle.HORIZONTAL
	    }); 
	    
	    */
	
	});
</script>

</body>
</html>