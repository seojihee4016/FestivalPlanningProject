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

<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ths5zg540n"></script>

<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 -->
<div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:700px;"></div>

<script>
// naverMap 값은 div 의 id
	new naver.maps.Map('map', {

	// 지도 중앙 위치 : 위도, 경도 설정
	center : new naver.maps.LatLng( 37.5782709, 126.9770043 ),

	// 줌 설정 : 수치가 클수록 지도 확대(줌인), 이 옵션 생략시 기본값 9
	zoom : 18,
	// 줌 컨트롤 표시, 지정하지 않으면 false 가 기본값
	zoomControl : true,

	// 줌 컨트롤 오른쪽 위로 위치 설정
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정
	},

	// 일반ㆍ위성 지도보기 컨트롤 표시, 지정하지 않으면 false 가 기본값
	mapTypeControl : true,

}); 
//var map = new naver.maps.Map('map');
var drawingManager = new naver.maps.drawing.DrawingManager({map: map});

var drawingManager;
naver.maps.Event.once(map, 'init', function() {
    drawingManager = new naver.maps.drawing.DrawingManager({map: map});
    drawingManager.addDrawing(rect, naver.maps.drawing.DrawingMode.RECTANGLE, 'my-id');
    drawingManager.addDrawing(polygon, naver.maps.drawing.DrawingMode.POLYGON);
});

drawingManager.setOptions('drawingControlOptions', {
    position: naver.maps.Position.LEFT_CENTER,
    style: naver.maps.drawing.DrawingStyle.VERTICAL
});
/* var map = new naver.maps.Map('naverMap', {
    zoomControl: true,
    zoomControlOptions: {
        style: naver.maps.ZoomControlStyle.LARGE,
        position: naver.maps.Position.TOP_RIGHT
    },
    mapTypeControl: true,
    zoom: 15
});

// 오버레이 추가
var rect = new naver.maps.Rectangle({
    map: map,
    bounds: [126.96744,37.561622,126.9737437,37.5668781],
    fillColor: '#ff0000',
    fillOpacity: 0.4,
    strokeWeight: 2,
    strokeColor: '#ff0000'
});

var polygon = new naver.maps.Polygon({
    map: map,
    paths: [
        [126.9797895, 37.5670131],
        [126.979215, 37.5649555],
        [126.9766789, 37.5649082],
        [126.9789515, 37.5637645],
        [126.9785598, 37.5614914],
        [126.9804949, 37.5632666],
        [126.9827689, 37.5619065],
        [126.9818039, 37.5639213],
        [126.9837414, 37.5653719],
        [126.9811162, 37.5651081]
    ],
    fillColor: '#ff0000',
    fillOpacity: 0.4,
    strokeWeight: 2,
    strokeColor: '#ff0000'
});

var drawingManager;
naver.maps.Event.once(map, 'init', function() {
    drawingManager = new naver.maps.drawing.DrawingManager({map: map});
    drawingManager.addDrawing(rect, naver.maps.drawing.DrawingMode.RECTANGLE, 'my-id');
    drawingManager.addDrawing(polygon, naver.maps.drawing.DrawingMode.POLYGON);
}); */

/* var drawingManager = new naver.maps.drawing.DrawingManager();
drawingManager.setMap(map); */

</script>

<!-- <div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2704b0ca1dd38d3c652309b90d3eb1e3&libraries=drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 도형 스타일을 변수로 설정합니다
var strokeColor = '#39f',
	fillColor = '#cce6ff',
	fillOpacity = 0.5,
	hintStrokeStyle = 'dash';

var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode: [
        kakao.maps.Drawing.OverlayType.MARKER,
        kakao.maps.Drawing.OverlayType.ARROW,
        kakao.maps.Drawing.OverlayType.POLYLINE,
        kakao.maps.Drawing.OverlayType.RECTANGLE,
        kakao.maps.Drawing.OverlayType.CIRCLE,
        kakao.maps.Drawing.OverlayType.ELLIPSE,
        kakao.maps.Drawing.OverlayType.POLYGON
    ],
    // 사용자에게 제공할 그리기 가이드 툴팁입니다
    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
    guideTooltip: ['draw', 'drag', 'edit'], 
    markerOptions: {
        draggable: true,
        removable: true
    },
    arrowOptions: {
        draggable: true,
        removable: true,
        strokeColor: strokeColor,
        hintStrokeStyle: hintStrokeStyle
    },
    polylineOptions: {
        draggable: true,
        removable: true,
        strokeColor: strokeColor,
        hintStrokeStyle: hintStrokeStyle
    },
    rectangleOptions: {
        draggable: true,
        removable: true,
        strokeColor: strokeColor,
        fillColor: fillColor,
        fillOpacity: fillOpacity
    },
    circleOptions: {
        draggable: true,
        removable: true,
        strokeColor: strokeColor,
        fillColor: fillColor,
        fillOpacity: fillOpacity
    },
    ellipseOptions: {
        draggable: true,
        removable: true,
        strokeColor: strokeColor,
        fillColor: fillColor,
        fillOpacity: fillOpacity
    },
    polygonOptions: {
        draggable: true,
        removable: true,
        strokeColor: strokeColor,
        fillColor: fillColor,
        fillOpacity: fillOpacity
    }
};

// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.Drawing.DrawingManager(options);

// Toolbox를 생성합니다. 
// Toolbox 생성 시 위에서 생성한 DrawingManager 객체를 설정합니다.
// DrawingManager 객체를 꼭 설정해야만 그리기 모드와 매니저의 상태를 툴박스에 설정할 수 있습니다.
var toolbox = new kakao.maps.Drawing.Toolbox({drawingManager: manager});

// 지도 위에 Toolbox를 표시합니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOP은 위 가운데를 의미합니다.
map.addControl(toolbox.getElement(), kakao.maps.ControlPosition.TOP);
</script> -->

</body>
</html>