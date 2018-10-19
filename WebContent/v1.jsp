<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- co button -->
<link rel="stylesheet" href="css/cobutton.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#carousel_con {
   width: 600px;
   height: 350px;
}
@font-face{
	font-family:HangeulNuriR;
	src:url('./font/HangeulNuriR.ttf') format('truetype');

}
::-webkit-scrollbar-track {
   background: #EAEAEA;
   border-radius: 5px;
}

::-webkit-scrollbar-thumb {
   background: #D3D3D3;
   border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
   background: #ADADAD;
}
</style>

<style>
section {
   height: auto;
}
a {
	color:  #b32e2e;
	text-decoration: none;
}
/* ///////////sidebar///////// */
.ui-widget {
    font-family: HangeulNuriR;
}

.text-success {
    color: #000000;
}
.ui-widget-header {
    border: 1px solid #fffbfb;
    background: #fcf8e3;
    color: #ffffff;
    font-weight: bold;
}
.ui-widget-content {
    border: 1px solid #dddddd;
    background: inherit;
    color: #333333;
}
.ui-widget-header a {
     color: inherit; 
}
.ui-widget-content a {
     color: rgba(223,190,106,0.7); 
}
.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited, a.ui-button, a:link.ui-button, a:visited.ui-button, .ui-button {
    color: inherit;
    text-decoration: none;
}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
    border: inherit;
    background: inherit;
    font-weight: inherit;
    color: inherit;
}


.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 1px solid #fffbfb;
    background: #ead09f;
    font-weight: normal;
    color: #ffffff;
}

.ui-tabs .ui-tabs-nav li {
    list-style: none;
    float: left;
    position: relative;
    top: 0;
    /* margin: 1px .2em 0 0; */
    border-bottom-width: 0;
    padding: 0;
    white-space: nowrap;
}
.ui-widget.ui-widget-content {
    border: none; 
}

/* //////////////////// */


#backgroundC {
 /*   background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);
   background: linear-gradient(to bottom, #FFB88C, #DE6262); */
}

.carousel-inner>.item>img {
   top: 0;
   left: 0%;
   min-width: 360px;
   min-height: 200px;
}

* {
   box-sizing: border-box;
}

body {
   
  /*   background-color: DFE8E4;
   background-color: rgba(249, 248, 244, 0.5);
  border-left: 1px solid #d9d9d9; */
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
    margin-left: 10%;
    margin-right: 10%;
	font-family: HangeulNuriR;
}


/* Style the list inside the menu */
nav ul {
   list-style-type: none;
   padding: 0;
}

article {
   float: left;
   padding: 20px;
   width: 70%;
   height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
   content: "";
   display: table;
   clear: both;
}

/* Style the footer */
footer {
   padding: 10px;
   text-align: center;
   color: black;
}

tr td {
   font-size: 30px;
}

.overlay {
   position: absolute;
   bottom: 0;
   left: 100%;
   right: 0;
   background-color: gray;
   opacity: 0.6;
   overflow: hidden;
   width: 0;
   height: 100%;
   transition: .5s ease;
}

.container:hover .overlay {
   width: 100%;
   left: 0;
}

.text {
   color: white;
   font-size: 20px;
   position: absolute;
   top: 50%;
   left: 50%;
   -webkit-transform: translate(-50%, -50%);
   -ms-transform: translate(-50%, -50%);
   transform: translate(-50%, -50%);
   white-space: nowrap;
}

.image {
   display: block;
   width: 100%;
   height: auto;
}

.overlay {
   position: absolute;
   bottom: 0;
   left: 100%;
   right: 0;
   background-color: gray;
   opacity: 0.4;
   overflow: hidden;
   width: 0;
   height: 100%;
   transition: .5s ease;
}

.container:hover .overlay {
   width: 100%;
   left: 0;
}

.text {
   color: white;
   font-size: 20px;
   position: absolute;
   top: 50%;
   left: 50%;
   -webkit-transform: translate(-50%, -50%);
   -ms-transform: translate(-50%, -50%);
   transform: translate(-50%, -50%);
   white-space: nowrap;
}

.image {
   display: block;
   width: 100%;
   height: auto;
}
.contents {
   padding-top: 80px;
}

.caret {
   margin-left: 10px
}
#tabs::-webkit-scrollbar {
        width: 0 !important;
    }
</style>

<script>
   var page = 1;
   var count = 1;
   function showmore() {
      count += 1;
      $.ajax({
         type : "get",
         url : "getBestReviewBytag.do",
         data : {
            "location" : "${location}",
            "tag" : $('#distinguish').html(),
            "pageNo" : count,
            "size" : $('#listSize').html()
         //더보기 누르기 전의 갯수.
         },

         success : function(data) {
            $('#tab-1').html(data);
            $('#tab-2').html("");
            $('#tab-3').html("");
            $('#tab-4').html("");
         }//callback
      });//ajax 
   }

   $(function() {

      $("#tabs").tabs();

      $.ajax({
         type : "get",
         url : "getBestReviewBytag.do",
         data : {
            "location" : "${location}",
            "tag" : "맛집"
         },

         success : function(data) {
            //$('#tab-1').html(data);
            $('#tab-1').html(data);
            $('#tab-2').html("");
            $('#tab-3').html("");
            $('#tab-4').html("");
         }//callback
      });//ajax

      $('#thatdiv div:eq(0)').addClass('active');

      $('nav a').click(function() {
         var str = $(this).html();
         var loca = {
            "location" : "${location}",
            "tag" : str
         };

         $.ajax({
            type : "get",
            url : "getBestReviewBytag.do",
            data : loca,

            success : function(data) {
				if (str == '관광') {
					$('#tab-2').html(data);
					$('#tab-1').html("");
					$('#tab-3').html("");
					$('#tab-4').html("");
				} else if (str == '숙소') {
					$('#tab-3').html(data);
					$('#tab-1').html("");
					$('#tab-2').html("");
					$('#tab-4').html("");
				} else if (str == '맛집'){
					//$('#tab-1').html(data);
					$('#tab-1').html(data);
					$('#tab-2').html("");
					$('#tab-3').html("");
					$('#tab-4').html("");
				}else {
					//$('#tab-1').html(data);
					$('#tab-1').html("");
					$('#tab-2').html("");
					$('#tab-3').html("");
					$('#tab-4').html(data);
               }
            }//callback
         });//ajax
      });//click
   });//tab
</script>


<script type="text/javascript" src="js/nav.js"></script>

</head>
<body>
     	<nav class="navbar navbar-defalt navbar-fixed-top" style="background-color: #fff">
      	<div id="header"> 
      		<div class="container">
         		<div class="navbar-header" style="margin-top: 15px">
            		<button type="button" class="navbar-toggle" id="menuSpan" data-toggle="collapse" data-target="#myNavbar">
	                    <span class="icon-bar"></span>
	               		<span class="icon-bar" style="margin-top: 2px"></span>
	               		<span class="icon-bar"></span>
            		</button>
            		<a href="index.jsp"><img src="img/main_logo2.png" width="150" height="47" style="background-color: inherit;/* #0F6A8B  #F5EED2*/"></a>
         		</div> <!-- navbar-header -->
  <!--    <div class="container-fluid">
   -->
    <ul class="nav navbar-nav" style="font-size:20px;  font-weight: bold;  font-family: HangeulNuriR;margin-left:15px;margin-top:5px; ">
      <li class="active" style="top: 10px;"><a href="#">여행지</a></li>
      <li style="top: 10px;"><a href="#">이벤트</a></li>
      <li style="top: 10px;"><a href="#">매거진</a></li>
      <li style="top: 10px;"><a href="#">랭킹</a></li>
      
    </ul>
 <!--  </div> -->
	         	<div class="collapse navbar-collapse navbar-right" id="myNavbar" style="margin-top: 15px">
	            	<form class="navbar-form navbar-left" action="getdata.do">
	               		<div class="input-group">
	                  		<input type="text" class="form-control" placeholder="Search" name="search" id="myInput">
	                  		<div class="input-group-btn">
	                     		<button class="btn btn-default" type="submit">
	                        		<i class="glyphicon glyphicon-search"></i>
	                     		</button>
	                  		</div>
	               		</div>
	            	</form>
	            	
	            	<ul class="nav navbar-nav navbar-right">
	               		<li class="dropdown">
		                  	<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="userMenu">
		                     	<span class="glyphicon glyphicon-user white">
		                     		<span class="caret" style="margin-left: 10px"></span>
		                     	</span>
		                  	</a>
		                  	<c:choose>
		                  	 	<c:when test="${vo != null}">
			                  	 	<ul class="dropdown-menu">
			                     	<li><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;로그아웃</a></li>
			                     	<li><a href="myreviews.do?id=${sessionScope.vo.id}"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;내가 쓴 글</a></li>
			                     	<li><a href="scrap.do?id=${sessionScope.vo.id}"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;스크랩</a></li>
			                     	<li><a href="write.jsp"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;글쓰기</a></li>
			                     	<li><a href="registerupdate.do?id=${sessionScope.vo.id}"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;정보 수정</a></li>
			                  		</ul>
		                  		</c:when>
		      
		                  		<c:otherwise>
		                  			<ul class="dropdown-menu">
			                     	<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;로그인</a></li>
			                     	<li><a href="register.jsp"><i class="fas fa-user-plus"></i>&nbsp;&nbsp;회원가입</a></li>
			                  		</ul>
		                  		</c:otherwise>
		                  	</c:choose>
	               		</li>
					</ul>
				</div>
				<!-- myNavbar -->
			</div>
			<!-- container -->
		</div>
		<!-- header -->
		<div id="line"></div>
	</nav>
   <div id="backgroundC">
      <div style="height: 100px;"></div>

      <section style="height: auto;">
         <nav id="tabs" style="overflow-y: scroll; height: 800px; width: 30%; overflow-x: hidden; float: left;">
      		<div>
        	 <h2 align="center" style="font-color: gray;font-family: HangeulNuriR;">인기 게시물</h2>
        	
         	<a class="cobtn" href="javascript:void(0)">맛집</a>
         	<a class="cobtn" href="javascript:void(0)">관광</a>
         	<a class="cobtn" href="javascript:void(0)">숙소</a>
        	<a class="cobtn" href="javascript:void(0)">쇼핑</a>
        	</div>
        	
         	<div id="tab-1"></div>
			<div id="tab-2"></div>
			<div id="tab-3"></div>
			<div id="tab-4"></div>
			
		 </nav>
        

         <article style="height: auto; padding-top: 0px;">
            <p>
            <p align="center" style="margin-bottom: 30px; color: black; font-weight: bold; font-size:45px;">${requestScope.location}</p>
            <div class="container" id="carousel_con">
               <div id="myCarousel" class="carousel slide" data-ride="carousel">

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" id="thatdiv">
                     <c:forEach var="festivalVO" items="${flist}">
                        <c:if test="${festivalVO.img ne null}">
                           <div class="item">
                              <img src="${festivalVO.img}"
                                 style="width: 600px; height: 350px;" class="image">
                              <div class="overlay">
                                 <div class="text">${festivalVO.location}<br>${festivalVO.city}<br>${festivalVO.festivalName}<br>${festivalVO.startDate}부터<br>${festivalVO.endDate}까지</div>
                              </div>
                           </div>
                        </c:if>
                     </c:forEach>
                  </div>

                  <!-- Left and right controls -->
                  <a class="left carousel-control" href="#myCarousel"
                     data-slide="prev"> <span
                     class="glyphicon glyphicon-chevron-left"></span> <span
                     class="sr-only">Previous</span>
                  </a> <a class="right carousel-control" href="#myCarousel"
                     data-slide="next"> <span
                     class="glyphicon glyphicon-chevron-right"></span> <span
                     class="sr-only">Next</span>
                  </a>
               </div>
            </div>
            <br> <br>

            <c:forEach items="${clist}" var="rList">

               <div align="center" class="col-sm-2">
                  <hr>
                  <br> <a
                     style="font-size: 25px; color: black/* rgb(116, 191, 237) */; text-decoration: none; font-weight: bold;"
                     href="getAttraction.do?city=${rList}&&location=${requestScope.location}">${rList}</a><br>
                  <br>
               </div>
            </c:forEach>
            <hr>
            <br> <br>
         </article>
      </section>
   
   <footer></footer></div>
</body>
</html>