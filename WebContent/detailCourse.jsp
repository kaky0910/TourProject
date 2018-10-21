<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/nav.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<!-- Tmap API -->
   <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=4edda774-8444-4eb2-b06d-4f038e93168c"></script>
   <link rel="stylesheet" href="css/fontAndScroll.css">
   
<title>Insert title here</title>
<style type="text/css">
   body {   
     margin: 0;
     padding: 0;
     
     color: rgb(50,50,50);
     font-family: 'Open Sans', sans-serif;
     font-size: 150%;
     line-height: 1.6em;
   }
   
   /* ================ The Timeline ================ */
   
   .timeline {
     position: relative;
     width: 660px;
     margin: 0 auto;
     margin-top: 20px;
     padding: 1em 0;
     list-style-type: none;
   }
   
   .timeline:before { /* 검정줄 */
     position: absolute;
     left: 50%;
     top: 0;
     content: ' ';
     display: block;
     width: 6px;
     height: 100%;
     margin-left: 2px;
     background: rgb(80,80,80);
     background: -moz-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
     background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(100%,rgba(125,185,232,1)));
     background: -webkit-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
     background: -o-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
     background: -ms-linear-gradient(top, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
     background: linear-gradient(to bottom, rgba(80,80,80,0) 0%, rgb(80,80,80) 8%, rgb(80,80,80) 92%, rgba(80,80,80,0) 100%);
     
     z-index: 5;
   }
   
   .timeline li {
     padding: 1em 0;
   }
   
   .timeline li:after {
     content: "";
     display: block;
     height: 0;
     clear: both;
     visibility: hidden;
   }
   
   .direction-l {
     position: relative;
     width: 300px;
     float: left;
     text-align: right;
   }
   
   .direction-r {
     position: relative;
     width: 300px;
     float: right;
     text-align: left;
     padding-left: 10px
   }
   
   .flag-wrapper {
     position: relative;
     display: inline-block;
     
     text-align: center;
   }
   
   .flag {
     position: relative;
     display: inline;
     background: rgb(248,248,248);
     padding: 6px 10px;
     border-radius: 5px;
     
     font-weight: 600;
     text-align: left;
   }
   
   .direction-l .flag {
     -webkit-box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
     -moz-box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
     box-shadow: -1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
   }
   
   .direction-r .flag {
     -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
     -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
     box-shadow: 1px 1px 1px rgba(0,0,0,0.15), 0 0 1px rgba(0,0,0,0.15);
   }
   
   .direction-l .flag:before,
   .direction-r .flag:before {
     position: absolute;
     top: 50%;
     right: -40px;
     content: ' ';
     display: block;
     width: 12px;
     height: 12px;
     margin-top: -10px;
     background: #fff;
     border-radius: 10px;
     border: 4px solid rgb(255,80,80);
     z-index: 10;
   }
   
   .direction-r .flag:before {
     left: -40px;
   }
   
   .direction-l .flag:after {
     content: "";
     position: absolute;
     left: 100%;
     top: 50%;
     height: 0;
     width: 0;
     margin-top: -8px;
     border: solid transparent;
     border-left-color: rgb(248,248,248);
     border-width: 8px;
     pointer-events: none;
   }
   
   .direction-r .flag:after {
     content: "";
     position: absolute;
     right: 100%;
     top: 50%;
     height: 0;
     width: 0;
     margin-top: -8px;
     border: solid transparent;
     border-right-color: rgb(248,248,248);
     border-width: 8px;
     pointer-events: none;
   }
   
   .time {
     display: inline-block;
     padding: 4px 6px;
     background: rgb(248,248,248);
   }
   
   .desc {
     margin: 1em 0.75em 0 0;
     
     font-size: 0.77777em;
     font-style: italic;
     line-height: 1.5em;
   }
   
   .direction-r .desc {
     margin: 1em 0 0 0.75em;
   }
   
   /* ================ Timeline Media Queries ================ */
   
   @media screen and (max-width: 660px) {
   
   .timeline {
       width: 100%;
      padding: 4em 0 1em 0;
   }
   
   .timeline li {
      padding: 2em 0;
   }
   
   .direction-l,
   .direction-r {
      float: none;
      width: 100%;
   
      text-align: center;
   }
   
   .flag-wrapper {
      text-align: center;
   }
   
   .flag {
      background: rgb(255,255,255);
      z-index: 15;
   }
   
   .direction-l .flag:before,
   .direction-r .flag:before {
     position: absolute;
     top: -30px;
      left: 50%;
      content: ' ';
      display: block;
      width: 12px;
      height: 12px;
      margin-left: -9px;
      background: #fff;
      border-radius: 10px;
      border: 4px solid rgb(255,80,80);
      z-index: 10;
   }
   
   .direction-l .flag:after,
   .direction-r .flag:after {
      content: "";
      position: absolute;
      left: 50%;
      top: -8px;
      height: 0;
      width: 0;
      margin-left: -8px;
      border: solid transparent;
      border-bottom-color: rgb(255,255,255);
      border-width: 8px;
      pointer-events: none;
   }
   
   .desc {
      position: relative;
      margin: 1em 0 0 0;
      padding: 1em;
      background: rgb(245,245,245);
      -webkit-box-shadow: 0 0 1px rgba(0,0,0,0.20);
      -moz-box-shadow: 0 0 1px rgba(0,0,0,0.20);
      box-shadow: 0 0 1px rgba(0,0,0,0.20);
      
     z-index: 15;
   }
   
   .direction-l .desc,
   .direction-r .desc {
      position: relative;
      margin: 1em 1em 0 1em;
      padding: 1em;
      
     z-index: 15;
   }
   
   }
   
   @media screen and (min-width: 400px ?? max-width: 660px) {
   
   .direction-l .desc,
   .direction-r .desc {
      margin: 1em 4em 0 4em;
   }
   
   }
   
   /* Tmap API css */
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
      /* Tmap API css */
</style>
</head>
<body>
   <%@include file="nav.jsp" %>
   <div style="height: 150px"></div>

   <h3 align="center" style="margin-bottom: 50px; margin-right: 50px">${requestScope.cvo.courseName}</h3>
   
   <c:set var="line" value="left"></c:set>

   <div>
      <div align="center" class="col-sm-6">
         <ul class="timeline">
            <c:forEach items="${requestScope.cvo.map}" var="entry" varStatus="status">
               <c:choose>
                  <c:when test="${line == 'right'}">
                     <c:set var="line" value="left"></c:set>
                  </c:when>
                  <c:when test="${line == 'left'}">
                     <c:set var="line" value="right"></c:set>
                  </c:when>
               </c:choose>
               <li>
                  <c:choose>
                     <c:when test="${line == 'right'}" >
                        <div class="direction-r">
                           <div class="flag-wrapper" id="${status}">
                              <span class="flag">${entry.value.spotName}</span>
                           </div>
                           <div class="desc" id="${status}" style="margin-right: 20px; margin-left: 25px">
                              <img src="${entry.value.mainImage}" class="ui-state-default" width="100%" height="100%" style="float: right">
                           </div>
                        </div>
                     </c:when>
                     <c:when test="${line == 'left'}" >
                        <div class="direction-l">
                           <div class="flag-wrapper" id="${status}">
                              <span class="flag">${entry.value.spotName}</span>
                           </div>
                           <div class="desc" id="${status}" style="margin-right: 20px; margin-left: 25px">
                              <img src="${entry.value.mainImage}" class="ui-state-default" width="100%" height="100%" style="float: left">
                           </div>
                        </div>
                     </c:when>
                  </c:choose>
               </li>
            </c:forEach>
         </ul>
      </div>
      
      <div id="map_div" align="center" class="col-sm-6">
          <c:forEach items="${list.map}" var="entry" varStatus="status">
            <c:set value="${entry.value}" var="array"></c:set>
            <!--${entry.key}  -->
            <script>
               var array = ar();
               array.push({
                  "viaPointId" : "test01",//경유지 id입니다.
                  "viaPointName" : "${array.spotName}",//경유지 명칭입니다.
                  "viaX" : "${array.lon}",//경유지 경도입니다.
                  "viaY" : "${array.lat}" //경유지 위도입니다.
               });
            </script>
         </c:forEach>
         <script>
            // map 생성
            map = new Tmap.Map({
               div : 'map_div', // map을 표시해줄 div
               width : "800px",// map의 width 설정
               height : "600px",// map의 height 설정
            });
            // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
            /*    var array = ar();
             alert(array[0].viaX + "   " + array[0].viaPointName);
             */
            var routeLayer = new Tmap.Layer.Vector("route");
            map.addLayer(routeLayer);
            map.setCenter(new Tmap.LonLat("127.00245938918971",
                  "37.566777390186154").transform("EPSG:4326", "EPSG:3857"),
                  14);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점으로 설정합니다.
   
            // 시작, 도착 심볼찍기
            // 시작
            var markerStartLayer = new Tmap.Layer.Markers("start");
            map.addLayer(markerStartLayer);
   
            var size = new Tmap.Size(24, 38);
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
            var icon = new Tmap.IconHtml(
                  "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />",
                  size, offset);
            var marker_s = new Tmap.Marker(new Tmap.LonLat(
                  "126.98605733268329", "37.568085523663385").transform(
                  "EPSG:4326", "EPSG:3857"), icon);
            markerStartLayer.addMarker(marker_s);
            // 도착
            var markerEndLayer = new Tmap.Layer.Markers("end");
            map.addLayer(markerEndLayer);
   
            var size = new Tmap.Size(24, 38);
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
            var icon = new Tmap.IconHtml(
                  "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />",
                  size, offset);
            var marker_e = new Tmap.Marker(new Tmap.LonLat(
                  "127.00973587385866", "37.56445848334345").transform(
                  "EPSG:4326", "EPSG:3857"), icon);
            markerEndLayer.addMarker(marker_e);
   
            var prtcl;
            var headers = {};
   
            headers["appKey"] = "4edda774-8444-4eb2-b06d-4f038e93168c";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
            $
                  .ajax({
                     type : "POST",
                     headers : headers,
                     url : "https://api2.sktelecom.com/tmap/routes/routeOptimization30?version=1&format=xml",//경유지 최적화 api요청 url입니다. 
                     async : false,
                     contentType : "application/json",
                     data : JSON.stringify({
                        "reqCoordType" : "WGS84GEO",//요청 좌표 타입입니다.
                        "resCoordType" : "EPSG3857",
                        "startName" : "st",//출발지 명칭입니다.
                        "startX" : "126.98605733268329",//출발지 경도입니다.
                        "startY" : "37.568085523663385",//출발지 위도입니다.
                        "startTime" : "201711121314",//출발 시작 시간입니다.
                        "endName" : "end",//도착치 명칭입니다.
                        "endX" : "127.00973587385866",//도착지 경도입니다.
                        "endY" : "37.56445848334345",//도착지 위도입니다.
                        "viaPoints" : [ {
                           "viaPointId" : "test01",//경유지 id입니다.
                           "viaPointName" : array[0].viaPointName,//경유지 명칭입니다.
                           "viaX" : array[0].viaX,//경유지 경도입니다.
                           "viaY" : array[0].viaY
                        //경유지 위도입니다.
                        }, {
                           "viaPointId" : "test02",
                           "viaPointName" : array[1].viaPointName,
                           "viaX" : array[1].viaX,
                           "viaY" : array[1].viaY,
                           "viaTime" : 600
                        }, {
                           "viaPointId" : "test03",
                           "viaPointName" : array[2].viaPointName,
                           "viaX" : array[2].viaX,
                           "viaY" : array[2].viaY,
                           "viaTime" : 600
                        }, {
                           "viaPointId" : "test04",
                           "viaPointName" : array[3].viaPointName,
                           "viaX" : array[3].viaX,
                           "viaY" : array[3].viaY,
                           "viaTime" : 600
                        }, {
                           "viaPointId" : "test05",
                           "viaPointName" : array[4].viaPointName,
                           "viaX" : array[4].viaX,
                           "viaY" : array[4].viaY,
                           "viaTime" : 600
                        } ]
                     }), //JSON.stringify
   
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
                        alert("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★console.log :::: "
                              + markerWaypointLayer);
                        map.addLayer(markerWaypointLayer);
   
                        var size = new Tmap.Size(24, 38);
                        var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
   
                        var icon = new Tmap.IconHtml(
                              "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png' />",
                              size, offset);
                        var marker = new Tmap.Marker(new Tmap.LonLat(
                              array[0].viaX, array[0].viaY).transform(
                              "EPSG:4326", "EPSG:3857"), icon);
                        markerWaypointLayer.addMarker(marker);
   
                        var icon = new Tmap.IconHtml(
                              "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_2.png' />",
                              size, offset);
                        marker = new Tmap.Marker(new Tmap.LonLat(
                              array[0].viaX, array[0].viaY).transform(
                              "EPSG:4326", "EPSG:3857"), icon);
                        markerWaypointLayer.addMarker(marker);
   
                        var icon = new Tmap.IconHtml(
                              "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_3.png' />",
                              size, offset);
                        marker = new Tmap.Marker(new Tmap.LonLat(
                              array[0].viaX, array[0].viaY).transform(
                              "EPSG:4326", "EPSG:3857"), icon);
                        markerWaypointLayer.addMarker(marker);
   
                        var icon = new Tmap.IconHtml(
                              "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_4.png' />",
                              size, offset);
                        marker = new Tmap.Marker(new Tmap.LonLat(
                              array[0].viaX, array[0].viaY).transform(
                              "EPSG:4326", "EPSG:3857"), icon);
                        markerWaypointLayer.addMarker(marker);
   
                        var icon = new Tmap.IconHtml(
                              "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_5.png'/>",
                              size, offset);
                        marker = new Tmap.Marker(new Tmap.LonLat(
                              array[0].viaX, array[0].viaY).transform(
                              "EPSG:4326", "EPSG:3857"), icon);
                        markerWaypointLayer.addMarker(marker);
   
                        map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.   
                     }, // success
                     //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                     error : function(request, status, error) {
                        console.log("code:" + request.status + "\n"
                              + "message:" + request.responseText + "\n"
                              + "error:" + error);
                     }//error
                  });//ajax
         </script>
         <div id="result"></div>
      </div>
   </div>   
</body>
</html>