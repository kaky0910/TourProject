<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<!-- <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/base/jquery-ui.css" /> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="css/nav.css">
   <!-- owl carousel-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- Device Mockups-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/css/device-mockups.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/font-awesome/css/font-awesome.min.css">
    
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script src="http://d3js.org/d3.v3.min.js"></script>
	<script type="text/javascript" src="js/nav.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>

	$(function() {
		var owl = $('.owl-carousel');
		owl.owlCarousel({
		    items:1,
		    loop:true,
		    margin:10,
		    autoplay:true,
		    autoplayTimeout:3000,
		    autoplayHoverPause:true,
		});
		$('.play').on('click',function(){
		    owl.trigger('play.owl.autoplay',[3000])
		})
		$('.stop').on('click',function(){
		    owl.trigger('stop.owl.autoplay')
		})
		
		$('.haha').hover(function(){
			$('.haha').css('overflow-y','auto');
		},function(){
			$('.haha').css('overflow-y','hidden');
		});

/* 		setTimeout(function () {
			effect();
		}, 1000); */
		$.ajax({
			type : "get",
			url : "getRecentReviews.do",
			data : "pageNo=1",

			success : function(data) {
				$('.haha').html(data);
				effect();
				effect2();
			}
		});
		
	});
	function effect(){
		TweenMax.staggerTo($('#states path,text'), 1, {opacity:"1", width:"100", ease:Bounce.easeIn}, 0.1);
	}
	function effect2(){
		TweenLite.to($('#label-경기도'), 1, {y:131});	
	} 
	/* ============휠 스크롤=============== */
	 window.onload = function () {
         $(".box").each(function () {
             
             $(this).on("mousewheel DOMMouseScroll", function (e) {
                 e.preventDefault();
                 var delta = 0;
                 if (!event) event = window.event;
                 if (event.wheelDelta) {
                     delta = event.wheelDelta / 120;
                     if (window.opera) delta = -delta;
                 } else if (event.detail) delta = -event.detail / 3;
                 var moveTop = null;
                 
                 if (delta < 0) {
                     if ($(this).next() != undefined) {
                         moveTop = $(this).next().offset().top;
                     }
             
                 } else {
                     if ($(this).prev() != undefined) {
                         moveTop = $(this).prev().offset().top;
                     }
                 }
                
                 $("html,body").stop().animate({
                     scrollTop: moveTop + 'px'
                 }, {
                     duration: 800, complete: function () {
                     }
                 });
             });
         });
     }
</script>
<style>
@font-face{
	font-family: 'BMDOHYEON_ttf';
	src:url(font/BMDOHYEON_ttf.ttf) format('truetype');
}
	body{
	font-family: BMDOHYEON_ttf;
	border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
    margin-left: 10%;
    margin-right: 10%;
	}
	::-webkit-scrollbar {
	width: 10px;
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
	
	#states path,text{
		opacity:0;
	}
	a,a:hover{text-decoration: none}
	
   	section,#tabs{
   		height:600px;
   	}
	#tabs a{
		cursor:pointer;
	}
	.haha{
		margin-top:161px; 
		max-height:700px;
		display:inline-block;
		overflow-y : hidden;
		overflow-x : hidden;
		font-family: BMDOHYEON_ttf;
		/* border: 1px gray double; */
		border-radius:50px;
		
	}
</style>

<script type="text/javascript" src="js/nav.js"></script>
</head>
<body style="background-color: rgba(249, 248, 244, 0.5)/* #EEF4F2 */">

	<div class="box">
   	<nav class="navbar navbar-defalt navbar-fixed-top" style="background-color: #fff">
      	<div id="header"> 
      		<div class="container">
         		<div class="navbar-header" style="margin-top: 15px">
            		<button type="button" class="navbar-toggle" id="menuSpan" data-toggle="collapse" data-target="#myNavbar">
	                    <span class="icon-bar"></span>
	               		<span class="icon-bar" style="margin-top: 2px"></span>
	               		<span class="icon-bar"></span>
            		</button>
            		<a href="index.jsp"><img src="img/main_logo2.png" width="150" height="47" style="background-color: #FFFAE5/* #0F6A8B  #F5EED2*/"></a>
         		</div> <!-- navbar-header -->
  <!--    <div class="container-fluid">
   -->
    <ul class="nav navbar-nav" style="font:20px;">
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
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div id="container" style="display: inline-block; margin-top: 161px;"></div>
		</div>
<!-- 		<div class="col-lg-4" style="margin-top:161px;">
 -->
			<!-- <section>
				<nav id="tabs">
					<h1 align="center" style="cursor:default">RECENT REVIEWS</h1>
					<ul>
						<li><a href="javascript:void(0)">맛집</a></li>
						<li><a href="javascript:void(0)">관광</a></li>
						<li><a href="javascript:void(0)">숙소</a></li>
					</ul>
					<div id="tab-1"></div>
					<div id="tab-2"></div>
					<div id="tab-3"></div>
				</nav>

			</section> -->
			<div class="col-lg-5 haha col-md-12 col-sm-12">
				
			</div>
<!-- 		</div>
 -->	</div>
 </div>
 <div class="box">
   <!-- 캐러셀 섹션 -->
    <section id="success-stories" class="success-stories">
      <div class="container">
        <header class="text-center">
          <h1 class="small-heading"></h1>
        </header>
        <div class="owl-carousel owl-theme stories-slider">
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-6">
                <div class="device-mockup">
                  <div data-device="Macbook2015" data-orientation="portrait" data-color="gold" class="device">
                    <div class="screen"><img src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/img/trifold.jpg" alt="..."></div>
                  </div>
                </div>
              </div>
              <div class="text col-lg-6 text-center text-lg-left mt-5 mt-lg-0">
                <h2>Lorem ipsum dolor sit amet, consectetur</h2>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                <ul class="values list-inline">
                  <li class="list-inline-item"><strong>250</strong><span>Daily Users</span></li>
                  <li class="list-inline-item"><strong>400</strong><span>Leads collected</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- End Item-->
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-6">
                <div class="device-mockup">
                  <div data-device="Macbook2015" data-orientation="portrait" data-color="gold" class="device">
                    <div class="screen"><img src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/img/portfolio-6.jpg" alt="..."></div>
                  </div>
                </div>
              </div>
              <div class="text col-lg-6 text-center text-lg-left mt-5 mt-lg-0">
                <h2>Lorem ipsum dolor sit amet, consectetur</h2>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                <ul class="values list-inline">
                  <li class="list-inline-item"><strong>10</strong><span>Time Difference</span></li>
                  <li class="list-inline-item"><strong>90%</strong><span>Revenue Increase</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- End Item-->
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-6">
                <div class="device-mockup">
                  <div data-device="Macbook2015" data-orientation="portrait" data-color="gold" class="device">
                    <div class="screen"><img src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/img/portfolio-3.jpg" alt="..."></div>
                  </div>
                </div>
              </div>
              <div class="text col-lg-6 text-center text-lg-left mt-5 mt-lg-0">
                <h2>Lorem ipsum dolor sit amet, consectetur</h2>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                <ul class="values list-inline">
                  <li class="list-inline-item"><strong>25</strong><span>Weekly Users</span></li>
                  <li class="list-inline-item"><strong>40</strong><span>Pages Case study</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- End Item-->
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-6">
                <div class="device-mockup">
                  <div data-device="Macbook2015" data-orientation="portrait" data-color="gold" class="device">
                    <div class="screen"><img src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/img/portfolio-4.jpg" alt="..."></div>
                  </div>
                </div>
              </div>
              <div class="text col-lg-6 text-center text-lg-left mt-5 mt-lg-0">
                <h2>Lorem ipsum dolor sit amet, consectetur</h2>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
                <ul class="values list-inline">
                  <li class="list-inline-item"><strong>10</strong><span>Time Difference</span></li>
                  <li class="list-inline-item"><strong>90%</strong><span>Team Increas</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- End Item-->
        </div>
      </div>
    </section>
  </div>
    
	<div class="col-lg-12" style="display: none;">
	
	</div>
	<form action="locationpage.do">
		<input type="hidden" name="location" value="">
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
	<script src="js/script.js"></script>
	    <!-- 10/16 JavaScript files-->
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/jquery/jquery.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/foliou/2-0-0/js/front.js"></script>

   <div style="height: 100px"></div>
   
   <div style="background-color: #DDDDDD; margin-top: 20px; padding-top: 50px; padding-bottom: 50px">
		<h2 align="center" style="color: gray">footer</h2>
   </div>


 
</body>

</html>