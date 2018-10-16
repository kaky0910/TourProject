<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script
   src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=d59421db-282e-470b-ad01-ba0ca9b5ac8b"></script>
<!-- <script type="text/javascript">
   $(document).ready(function() {
      initTmap();
   });
   function initTmap() {
      var map = new Tmap.Map({
         div : 'map_div',
         width : "934px",
         height : "452px",
      });
   }
</script> -->
<style type="text/css">
.mPop {
   border: 1px;
   background-color: #FFF;
   font-size: 12px;
   border-color: #FF0000;
   border-style: solid;
   text-align: center;
}
/*공통사용 클래스*/
.mPopStyle {
   border: 1px;
   background-color: #FFF;
   font-size: 12px;
   border-color: #FF0000;
   border-style: solid;
   text-align: left;
}
</style>
</head>
<body>
   <div id="map_div"></div>
   <p id="result"></p>
   <script>
      // map 생성
      // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.      
      map = new Tmap.Map({
         div : 'map_div', // map을 표시해줄 div
         width : "100%",// map의 width 설정
         height : "400px",// map의 height 설정
      });

      var routeLayer = new Tmap.Layer.Vector("route");
      map.addLayer(routeLayer);
      map.setCenter(new Tmap.LonLat("127.00245938918971",
            "37.566777390186154").transform("EPSG:4326", "EPSG:3857"), 14);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점으로 설정합니다.

      // 시작, 도착 심볼찍기
      // 시작
      var markerStartLayer = new Tmap.Layer.Markers("start");
      map.addLayer(markerStartLayer);

      var size = new Tmap.Size(24, 38);
      var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
      var icon = new Tmap.IconHtml(
            "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />",
            size, offset);
      var marker_s = new Tmap.Marker(new Tmap.LonLat("126.98605733268329",
            "37.568085523663385").transform("EPSG:4326", "EPSG:3857"), icon);
      markerStartLayer.addMarker(marker_s);

      // 도착
      var markerEndLayer = new Tmap.Layer.Markers("end");
      map.addLayer(markerEndLayer);

      var size = new Tmap.Size(24, 38);
      var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
      var icon = new Tmap.IconHtml(
            "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />",
            size, offset);
      var marker_e = new Tmap.Marker(new Tmap.LonLat("127.00973587385866",
            "37.56445848334345").transform("EPSG:4326", "EPSG:3857"), icon);
      markerEndLayer.addMarker(marker_e);

      var prtcl;
      var headers = {};
      headers["appKey"] = "d59421db-282e-470b-ad01-ba0ca9b5ac8b";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
      $
            .ajax({
               type : "POST",
               headers : headers,
               url : "https://api2.sktelecom.com/tmap/routes/routeOptimization30?version=1&format=xml",//경유지 최적화 api요청 url입니다. 
               async : false,
               contentType : "application/json",
               data : JSON.stringify(
            		   {
            			    "reqCoordType" : "WGS84GEO",
            			    "resCoordType" : "WGS84GEO",
            			    "startName" : "출발",
            			    "startX" : "4571394",
            			    "startY" : "1352080",
            			    "startTime" : "201607010900",
            			    "endName" : "도착",
            			    "endX" : "4571597", 
            			    "endY" : "1352269",
            			    "endRpFlag" : "18",
            			    "endPoiId" : "",
            			    "searchOption" : "0",
            			    "carType" : "4",
            			    "viaPoints" : 
            			    [
            			        { 
            			        "viaPointId" : "test01",
            			        "viaPointName" : "test01",
            			        "viaX" : "4571597",
            			        "viaDetailAddress" : "2001동, 1001호",
            			        "viaY" : "1352269",
            			        "viaPoiId" : "",
            			        "rpFlag":"-1", 
            			        "viaTime": "600", 
            			        "wishStartTime": "201606301700", 
            			        "wishEndTime": "201606301900"
            			        },
            			        { 
            			        "viaPointId" : "test02",
            			        "viaPointName" : "test02",
            			        "viaX" : "4571370",
            			        "viaDetailAddress" : "2001동, 1002호",
            			        "viaY" : "1352287",
            			        "viaPoiId" : "",
            			        "rpFlag":"-1", 
            			        "viaTime": "600", 
            			        "wishStartTime": 
            			        "201606301700", 
            			        "wishEndTime": "201606301900"},
            			        { "viaPointId" : "test03","viaPointName" : "test03","viaX" : "4571408","viaDetailAddress" : "2001동, 1003호","viaY" : "1352396","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},
            			        { "viaPointId" : "test04","viaPointName" : "test04","viaX" : "4571421","viaDetailAddress" : "2001동, 1004호","viaY" : "1352514","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test05","viaPointName" : "test05","viaX" : "4571422","viaDetailAddress" : "2001동, 1005호","viaY" : "1352515","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test06","viaPointName" : "test06","viaX" : "4571423","viaDetailAddress" : "2001동, 1006호","viaY" : "1352516","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test07","viaPointName" : "test07","viaX" : "4571424","viaDetailAddress" : "2001동, 1007호","viaY" : "1352517","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test08","viaPointName" : "test08","viaX" : "4571425","viaDetailAddress" : "2001동, 1008호","viaY" : "1352518","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test09","viaPointName" : "test09","viaX" : "4571426","viaDetailAddress" : "2001동, 1009호","viaY" : "1352519","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test10","viaPointName" : "test10","viaX" : "4571427","viaDetailAddress" : "2001동, 1010호","viaY" : "1352520","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test11","viaPointName" : "test11","viaX" : "4571428","viaDetailAddress" : "2001동, 1011호","viaY" : "1352521","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test12","viaPointName" : "test12","viaX" : "4571429","viaDetailAddress" : "2001동, 1012호","viaY" : "1352522","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test13","viaPointName" : "test13","viaX" : "4571430","viaDetailAddress" : "2001동, 1013호","viaY" : "1352523","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test14","viaPointName" : "test14","viaX" : "4571431","viaDetailAddress" : "2001동, 1014호","viaY" : "1352524","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"},  
            			        { "viaPointId" : "test15","viaPointName" : "test15","viaX" : "4571432","viaDetailAddress" : "2001동, 1015호","viaY" : "1352525","viaPoiId" : "","rpFlag":"-1", "viaTime": "600", "wishStartTime": "201606301700", "wishEndTime": "201606301900"}  
            			    ] 
            			      
            			}),
               //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
               success : function(response) {
                  prtcl = response;

                  // 결과 출력
                  var innerHtml = "";
                  var prtclString = new XMLSerializer()
                        .serializeToString(prtcl);//xml to String   
                  xmlDoc = $.parseXML(prtclString), $xml = $(xmlDoc),
                        $intRate = $xml.find("Document");

                  var tDistance = "총 거리 : "
                        + ($intRate[0]
                              .getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000)
                              .toFixed(1) + "km,";
                  var tTime = " 총 시간 : "
                        + ($intRate[0]
                              .getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue / 60)
                              .toFixed(0) + "분,";
                  var tFare = " 총 요금 : "
                        + $intRate[0]
                              .getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue
                        + "원";

                  $("#result").text(tDistance + tTime + tFare);

                  prtcl = new Tmap.Format.KML({
                     extractStyles : true,
                     extractAttributes : true
                  }).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
                  var routeLayer = new Tmap.Layer.Vector("route");//레이어를 생성합니다.

                  //벡터 도형(Feature)이 추가되기 직전에 트리거됩니다.
                  routeLayer.events.register("beforefeatureadded",
                        routeLayer, onBeforeFeatureAdded);
                  function onBeforeFeatureAdded(e) {
                     var style = {};//스타일을 저장하기위한 변수입니다.
                     switch (e.feature.attributes.styleUrl) {
                     case "#pointStyle":
                        style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
                        style.graphicHeight = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
                        style.graphicOpacity = 1;//외부 이미지 파일의 투명도 (0-1)입니다.
                        style.graphicWidth = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
                        break;
                     default:
                        style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color입니다.
                        style.strokeOpacity = "1";//stroke의 투명도(0~1)입니다.
                        style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
                     }
                     ;
                     e.feature.style = style;//도형의 스타일을 적용합니다.
                  }

                  routeLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.
                  map.addLayer(routeLayer);//맵에 레이어 추가

                  //경유지 심볼 찍기
                  var markerWaypointLayer = new Tmap.Layer.Markers(
                        "waypoint");
                  map.addLayer(markerWaypointLayer);

                  var size = new Tmap.Size(24, 38);
                  var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
                  var icon = new Tmap.IconHtml(
                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png' />",
                        size, offset);
                  var marker = new Tmap.Marker(new Tmap.LonLat(
                        "126.98735015742581", "37.56626352138058")
                        .transform("EPSG:4326", "EPSG:3857"), icon);
                  markerWaypointLayer.addMarker(marker);

                  var icon = new Tmap.IconHtml(
                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_2.png' />",
                        size, offset);
                  marker = new Tmap.Marker(new Tmap.LonLat(
                        "126.99749158970432", "37.56652289898868")
                        .transform("EPSG:4326", "EPSG:3857"), icon);
                  markerWaypointLayer.addMarker(marker);

                  var icon = new Tmap.IconHtml(
                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_3.png' />",
                        size, offset);
                  marker = new Tmap.Marker(new Tmap.LonLat(
                        "126.99823724381592", "37.56450100535406")
                        .transform("EPSG:4326", "EPSG:3857"), icon);
                  markerWaypointLayer.addMarker(marker);

                  var icon = new Tmap.IconHtml(
                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_4.png' />",
                        size, offset);
                  marker = new Tmap.Marker(new Tmap.LonLat(
                        "127.00186090818215", "37.570721714117965")
                        .transform("EPSG:4326", "EPSG:3857"), icon);
                  markerWaypointLayer.addMarker(marker);

                  var icon = new Tmap.IconHtml(
                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_5.png' />",
                        size, offset);
                  marker = new Tmap.Marker(new Tmap.LonLat(
                        "127.00221495976581", "37.56568310756034")
                        .transform("EPSG:4326", "EPSG:3857"), icon);
                  markerWaypointLayer.addMarker(marker);

                  var icon = new Tmap.IconHtml(
                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_6.png' />",
                        size, offset);
                  marker = new Tmap.Marker(new Tmap.LonLat(
                        "127.00352387777271", "37.56335290252303")
                        .transform("EPSG:4326", "EPSG:3857"), icon);
                  markerWaypointLayer.addMarker(marker);

                  map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.   
               },
               //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
               error : function(request, status, error) {
                  console.log("code:" + request.status + "\n"
                        + "message:" + request.responseText + "\n"
                        + "error:" + error);
               }
            });
   </script>
</body>
<div id="result"></div>
</html>