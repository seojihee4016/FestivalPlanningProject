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

<!-- <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ths5zg540n"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ths5zg540n&submodules=drawing"></script>

<!-- 지도가 생성되는 div 영역 -->
<div id="map" style="margin:0 auto; width:1000px; max-width:100%; height:700px;"></div>

<!-- 
<script>
var map = new naver.maps.Map('map', {
    zoomControl: true,
    zoomControlOptions: {
        style: naver.maps.ZoomControlStyle.LARGE,
        position: naver.maps.Position.TOP_RIGHT
    },
    mapTypeControl: true,
    zoom: 7
});

// 오버레이를 매니저에 추가
var rect = new naver.maps.Rectangle({
    map: map,
    bounds: [125.6195858,37.1928595,126.5689034,37.8594302],
    fillColor: '#00bf46',
    fillOpacity: 0.4,
    strokeWeight: 2,
    strokeColor: '#00bf46'
});

// 오버레이의 setEditable을 직접 호출
var rect2 = new naver.maps.Rectangle({
    map: map,
    bounds: [124.2220128,37.1928595,125.1587723,37.8594302],
    fillColor: '#bf0091',
    fillOpacity: 0.4,
    strokeWeight: 2,
    strokeColor: '#bf0091'
});
rect2.setEditable(true);

var drawingManager;
naver.maps.Event.once(map, 'init', function () {
    drawingManager = new naver.maps.drawing.DrawingManager({
        map: map,
        drawingControl: [
            naver.maps.drawing.DrawingMode.POLYLINE,
            naver.maps.drawing.DrawingMode.POLYGON,
            naver.maps.drawing.DrawingMode.ELLIPSE,
            naver.maps.drawing.DrawingMode.RECTANGLE
        ],
        drawingControlOptions: {
            position: naver.maps.Position.TOP_CENTER,
            style: naver.maps.drawing.DrawingStyle.VERTICAL
        },
        controlPointOptions: {
            anchorPointOptions: {
                radius: 5,
                fillColor: '#ff0000',
                strokeColor: '#0000ff',
                strokeWeight: 2
            },
            midPointOptions: {
                radius: 4,
                fillColor: '#ff0000',
                strokeColor: '#0000ff',
                strokeWeight: 2,
                fillOpacity: 0.5
            }
        },
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
        markerOptions: {
            icon: {
                content: '<img src="'+ HOME_PATH +'/img/example/pin_default.png" alt="" ' +
                    'style="margin:0px;padding:0px;border:0px solid transparent;display:block;max-width:none;max-height:none; ' +
                    '-webkit-user-select: none; position: absolute; width: 22px; height: 35px; left: 0px; top: 0px;">',
                size: new naver.maps.Size(22, 35),
                anchor: new naver.maps.Point(11, 35)
            }
        }
    });

    // 옵션 조정
    drawingManager.setOptions('drawingControlOptions', {position: naver.maps.Position.RIGHT_CENTER});
    drawingManager.addDrawing(rect, naver.maps.drawing.DrawingMode.RECTANGLE, 'my-id');
});
</script>
  -->

<script>
var map = new naver.maps.Map('map', {
    zoomControl: true,
    zoomControlOptions: {
        style: naver.maps.ZoomControlStyle.LARGE,
        position: naver.maps.Position.TOP_RIGHT
    },
    mapTypeControl: true,
    zoom: 15
});

// 오버레이 추가
/* var rect = new naver.maps.Rectangle({
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
}); */

var drawingManager;
naver.maps.Event.once(map, 'init', function() {
    drawingManager = new naver.maps.drawing.DrawingManager({map: map});
    drawingManager.addDrawing(rect, naver.maps.drawing.DrawingMode.RECTANGLE, 'my-id');
    drawingManager.addDrawing(polygon, naver.maps.drawing.DrawingMode.POLYGON);
});
</script>

</body>
</html>