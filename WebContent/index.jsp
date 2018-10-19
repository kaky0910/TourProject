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
	<!-- 10/19 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
   <!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"> -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans|Oswald:300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/footer.css">
    
    
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
			$('.haha').css('overflow-y','scroll');
			$('.haha').css('overflow-x','hidden');
		},function(){
			$('.haha').css('overflow-y','hidden');
			$('.haha').css('overflow-x','hidden');
		});

 		setTimeout(function () {
			effect();
			effect2();
		}, 1000); 
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
		TweenMax.staggerTo($('#states path,text'), 1, {opacity:"1", width:"100", ease:Bounce.easeIn}, 0.001);
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
	@font-face{
		font-family:HangeulNuriR;
		src:url('./font/HangeulNuriR.ttf') format('truetype');
	}
	a {
		color:  #b32e2e;
		text-decoration: none;
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
	a,a:hover{a {
	color:  #b32e2e;
	text-decoration: none;
	}
	
   	section,#tabs{
   		height:600px;
   	}
	#tabs a{
		cursor:pointer;
	}
	.haha{
		max-height:700px;
		display:inline-block;
		
    	overflow: hidden;

		font-family: BMDOHYEON_ttf;
		/* border: 1px gray double; */
		border-radius:50px;
		
	}
	.haha::-webkit-scrollbar {
        width: 1 !important;
    } 

</style>

<script type="text/javascript" src="js/nav.js"></script>
</head>

<body><!-- style="background-color: rgba(249, 248, 244, 0.5)/* #EEF4F2 */" -->
   	<%@include file="nav.jsp" %>
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div id="container" style="display: inline-block; margin-top: 161px;"></div>
		</div>
			<div class="col-lg-5 haha col-md-12 col-sm-12" style="overflow: hidden;">
				
			</div>
	</div>
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
              <div class="mockup col-lg-12">
                <div class="device-mockup">
                  
                    <div class="screen"><img src="./img/2018012211282097408365.jpg" alt="..."></div>
                  
                </div>
              </div>
            </div>
          </div>
          <!-- End Item-->
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-8">
                <div class="device-mockup">
                  
                    <div class="screen"><img src="./img/2018091209260434812905.jpg" alt="..."></div>
                
                </div>
              </div>
              <div class="text col-lg-4 text-center text-lg-left mt-5 mt-lg-0">
                <h2>따분한 여행에 지친 당신을 초대합니다.</h2>
                <p>이곳저곳 돌아보고싶지만 피곤하기도하고 어떻게 여행을 다녀야 하는지 모르는 분들을 위하여 저희가 준비한 특별여행으로 초대합니다.다양하고 최적화된 여행경로로 어느것하나 빠지지 않고 만족할 수 있는 여행으로 만들어 드리겠습니다.</p>
                <ul class="values list-inline">
                  <li class="list-inline-item"><strong>10가지 이상의</strong><span>여행지</span></li>
                  <li class="list-inline-item"><strong>90% 이상의</strong><span>만족율</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- End Item-->
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-8">
                <div class="device-mockup">
                  
                    <div class="screen"><img src="./img/2018092711325117053498.jpg" alt="..."></div>
                  
                </div>
              </div>
              <div class="text col-lg-4 text-center text-lg-left mt-5 mt-lg-0">
                <h2> NO.1 한류축제 2018 부산원아시아 페스티벌(BOF)</h2>
                <p>10월 20일부터 9일동안 부산 전역에서 화려하게 펼쳐집니다. 부산원아시아페스티벌(BOF)은 세대와 장르를 뛰어넘어 아시아 최고의 한류콘텐츠를 한 자리에 모아 많은 이에게 잊지 못할 추억의 시간을 선물해드리겠습니다.</p>
                <ul class="values list-inline">
                  <li class="list-inline-item"><strong>25팀의</strong><span>참여 가수</span></li>
                  <li class="list-inline-item"><strong>40개의</strong><span>세부 이벤트</span></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- End Item-->
          <!-- Item-->
          <div class="story">
            <div class="row align-items-center">
              <div class="mockup col-lg-12">
                <div class="device-mockup">
                  
                    <div class="screen"><img src="./img/2018092716280552619034.jpg" alt="..."></div>
                  
                </div>
              </div>
    
            </div>
          </div>
          <!-- End Item-->
        </div>
      </div>
    </section>
  
    
	<div class="col-lg-12" style="display: none;">
	
	</div>
	<form action="locationpage.do">
		<input type="hidden" name="location" value="">
	</form>
	

  <!--  <div style="height: 100px"></div> -->
  
   <div style="background-color: #ffffff; margin-top: 20px; padding-top: 50px; padding-bottom: 50px">
<footer class="flex-rw">
  
  <ul class="footer-list-top">
    <li>
      <h4 class="footer-list-header">About BBGG</h4></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">GET TO KNOW US</a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">MOTIVATION</a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink"></a>PROMTION</li>
    <li><a href='#' itemprop="significantLink" class="generic-anchor footer-list-anchor">JOB INCRUTE</a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">EVENTS</a></li>
  </ul>
  <ul class="footer-list-top">
    <li>
      <h4 class="footer-list-header"></h4></li>


    <li><a href='#' class="generic-anchor footer-list-anchor"></a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor"></a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor"></a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor"></a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" target="_blank"></a></li>
  </ul>
  <ul class="footer-list-top">
    <li id='help'>
      <h4 class="footer-list-header">Please Help Me</h4></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">CONTACT</a></li>
    <li><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">FAQ</a></li>
    <li id='find-a-store'><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">STORE LOCATOR</a></li>
    <li id='user-registration'><a href='#' class="generic-anchor footer-list-anchor" itemprop="significantLink">NEW USERS</a></li>
    <li id='order-tracking'><a href='#' itemprop="significantLink" class="generic-anchor footer-list-anchor">ORDER STATUS</a></li>
  </ul>
  <section class="footer-social-section flex-rw">
      <span class="footer-social-overlap footer-social-connect">
      CONNECT <span class="footer-social-small">with</span> US
      </span>
      <span class="footer-social-overlap footer-social-icons-wrapper">
      <a href="https://www.pinterest.com" class="generic-anchor" target="_blank" title="Pinterest" itemprop="significantLink"><i class="fa fa-pinterest"></i></a>
      <a href="https://www.facebook.com" class="generic-anchor" target="_blank" title="Facebook" itemprop="significantLink"><i class="fa fa-facebook"></i></a>
      <a href="https://twitter.com" class="generic-anchor" target="_blank" title="Twitter" itemprop="significantLink"><i class="fa fa-twitter"></i></a>
      <a href="http://instagram.com" class="generic-anchor" target="_blank" title="Instagram" itemprop="significantLink"><i class="fa fa-instagram"></i></a>
      <a href="https://www.youtube.com" class="generic-anchor" target="_blank" title="Youtube" itemprop="significantLink"><i class="fa fa-youtube"></i></a>
      <a href="https://plus.google.com" class="generic-anchor" target="_blank" title="Google Plus" itemprop="significantLink"><i class="fa fa-google-plus"></i></a>
      </span>
  </section>
  <section class="footer-bottom-section flex-rw">
<div class="footer-bottom-wrapper">   
<i class="fa fa-copyright" role="copyright">
 
</i> 2018 BangBangGokGok.co <address class="footer-address" role="company address">Korea, GangNam</address><span class="footer-bottom-rights"> - All Rights Reserved - </span>
    </div>
    <div class="footer-bottom-wrapper">
    <a href="/terms-of-use.html" class="generic-anchor" rel="nofollow">Terms</a> | <a href="/privacy-policy.html" class="generic-anchor" rel="nofollow">Privacy</a>
      </div>
  </section>
</footer>

   </div>
	</div>

 
</body>
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
</html>