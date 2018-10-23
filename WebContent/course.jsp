<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<!-- Tmap API -->
   <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=4edda774-8444-4eb2-b06d-4f038e93168c"></script>
   <link rel="stylesheet" href="css/fontAndScroll.css">
   
<style type="text/css">
   .courseDiv div {
      border: 1px dotted #e8b4b4;
      display: inline-block;
      width: 150px;
      height: 100px;
      padding: 10px
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var refleshCount = 0;
      $( function() {
          

           $( "#myCourse" ).sortable({
            revert: true
           });
           
           $( "#myCourse div" ).disableSelection();
        
           $('.saveBtn').click(function () {
              window.open("courseRegister.jsp?id=${sessionScope.vo.id}" , "Window Title", "width=850, height=450, top=100, left=400");
            window.opener();
            });
           $('#resetmap').one('click',function(){
        	   var array2 = [];
        	   for(i=0; i<count ;i++){
        		   var id = $('#myCourse div:eq('+i+')').attr('id');
        		   array2.push(array[id]);
        	   }
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
                map.setCenter(new Tmap.LonLat(array[0].viaX,
                		array[0].viaY).transform("EPSG:4326", "EPSG:3857"),
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
                var marker_s = new Tmap.Marker(new Tmap.LonLat(array2[0].viaX, array2[0].viaY).transform(
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
                var max = count-1;
                var marker_e = new Tmap.Marker(new Tmap.LonLat(array2[max].viaX , array2[max].viaY).transform(
                      "EPSG:4326", "EPSG:3857"), icon);
                markerEndLayer.addMarker(marker_e);
       
                var prtcl;
                var headers = {};
       
                headers["appKey"] = "e82b6398-ef81-4f12-8024-ccdd00356448";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
                $.ajax({
                         type : "POST",
                         headers : headers,
                         url : "https://api2.sktelecom.com/tmap/routes/routeOptimization10?version=1&format=xml",//경유지 최적화 api요청 url입니다. 
                         async : false,
                         contentType : "application/json",
                         data : JSON.stringify({
                            "reqCoordType" : "WGS84GEO",//요청 좌표 타입입니다.
                            "resCoordType" : "EPSG3857",
                            "startName" : "st",//출발지 명칭입니다.
                            "startX" : array2[0].viaX,//출발지 경도입니다.
                            "startY" : array2[0].viaY,//출발지 위도입니다.
                            "startTime" : "201711121314",//출발 시작 시간입니다.
                            "endName" : "end",//도착치 명칭입니다.
                            "endX" : array2[count-1].viaX,//도착지 경도입니다.
                            "endY" : array2[count-1].viaY,//도착지 위도입니다.
                            "viaPoints" : array2
                         }), //JSON.stringify
       
                         //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
                         success : function(response) {
                        	$('#map_div div:eq('+refleshCount+')').css('display','none');
                        	refleshCount++;
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
       						
                            for(i=0;i<count;i++){
                            	var icon = new Tmap.IconHtml(
                                        "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_"+(i+1)+".png' />",
                                        size, offset);
                                  var marker = new Tmap.Marker(new Tmap.LonLat(
                                        array2[i].viaX, array2[i].viaY).transform(
                                        "EPSG:4326", "EPSG:3857"), icon);
                                  markerWaypointLayer.addMarker(marker);
                            }
                           
                            map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.   
                         }, // success
                         //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                         error : function(request, status, error) {
                            console.log("code:" + request.status + "\n"
                                  + "message:" + request.responseText + "\n"
                                  + "error:" + error);
                         }//error
                      });//ajax
           });
         } );
   </script>
</head>
<body>
   <%@include file="nav.jsp"%>
   <div style="height: 120px"></div>
   <div align="center">
      <h3 style="margin-bottom: 30px">Make Course</h3>
      <br>
      <div class="courseDiv" id="myCourse" style="margin-bottom: 50px">
         <c:forEach items="${sessionScope.cvo.map}" var="entry"
            varStatus="status">
            <div id="${status.index}" style="margin-right: 20px; margin-left: 25px">
               <img src="${entry.value.mainImage}" class="ui-state-default"
                  width="100%" height="100%" style="float: left"><br>
               <h5 align="center" style="margin-top: 80px">${entry.value.spotName}</h5>
            </div>
         </c:forEach>
         <button id="resetmap">지도 새로고침</button>
      </div>
      
      <div id="map_div">
          <script>
        	var count=0;
   			var array=[];

         	<c:forEach items="${cvo.map}" var="entry" varStatus="status">
         		array.push({
         			"viaPointId" : "test${status.count}",//경유지 id입니다.
                    "viaPointName" : "${entry.value.spotName}",//경유지 명칭입니다.
                    "viaX" : "${entry.value.lon}",//경유지 경도입니다.
                    "viaY" : "${entry.value.lat}"
         		});
         		count="${status.count}";
         		
         	</c:forEach>
         	
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
            map.setCenter(new Tmap.LonLat(array[0].viaX,
            		array[0].viaY).transform("EPSG:4326", "EPSG:3857"),
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
            var marker_s = new Tmap.Marker(new Tmap.LonLat(array[0].viaX, array[0].viaY).transform(
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
            var max = count-1;
            var marker_e = new Tmap.Marker(new Tmap.LonLat(array[max].viaX , array[max].viaY).transform(
                  "EPSG:4326", "EPSG:3857"), icon);
            markerEndLayer.addMarker(marker_e);
   
            var prtcl;
            var headers = {};
   
            headers["appKey"] = "e82b6398-ef81-4f12-8024-ccdd00356448";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
            $.ajax({
                     type : "POST",
                     headers : headers,
                     url : "https://api2.sktelecom.com/tmap/routes/routeOptimization10?version=1&format=xml",//경유지 최적화 api요청 url입니다. 
                     async : false,
                     contentType : "application/json",
                     data : JSON.stringify({
                        "reqCoordType" : "WGS84GEO",//요청 좌표 타입입니다.
                        "resCoordType" : "EPSG3857",
                        "startName" : "st",//출발지 명칭입니다.
                        "startX" : array[0].viaX,//출발지 경도입니다.
                        "startY" : array[0].viaY,//출발지 위도입니다.
                        "startTime" : "201711121314",//출발 시작 시간입니다.
                        "endName" : "end",//도착치 명칭입니다.
                        "endX" : array[count-1].viaX,//도착지 경도입니다.
                        "endY" : array[count-1].viaY,//도착지 위도입니다.
                        "viaPoints" : array
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
                        map.addLayer(markerWaypointLayer);
   
                        var size = new Tmap.Size(24, 38);
                        var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
   						
                        for(i=0;i<count;i++){
                        	var icon = new Tmap.IconHtml(
                                    "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_"+(i+1)+".png' />",
                                    size, offset);
                              var marker = new Tmap.Marker(new Tmap.LonLat(
                                    array[i].viaX, array[i].viaY).transform(
                                    "EPSG:4326", "EPSG:3857"), icon);
                              markerWaypointLayer.addMarker(marker);
                        }
                        /* var icon = new Tmap.IconHtml(
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
    */
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
      
      <div align="center" style="margin-top: 30px; margin-bottom: 30px">
         <a href="#" class="saveBtn"><img alt="save"
            src="img/myCourse.png" style="width: 120px"></a>
      </div>
   </div>
</body>
</html>