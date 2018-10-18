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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script src="http://d3js.org/d3.v3.min.js"></script>
	<script type="text/javascript" src="js/nav.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script>
	$(function() {
		
		$('.haha').hover(function(){
			$('.haha').css('overflow-y','auto');
		},function(){
			$('.haha').css('overflow-y','hidden');
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
	
</script>
<style>
@font-face{
	font-family: 'BMDOHYEON_ttf';
	src:url(font/BMDOHYEON_ttf.ttf) format('truetype');
}
	body{
		font-family: BMDOHYEON_ttf;
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
		border: 1px gray double;
		border-radius:50px;
		width:30%;
		
	}
	.sidebar {
    position: absolute;
    right: -150px;
    transition: 0.3s;
    width: 200px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    border-radius: 0 5px 5px 0;
    height:1000px;
    background-color: white;
    z-index: 100;
}
	.sidebar:hover {
    right: 0;
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
	<div class="footer" style="display: none;">
		
	</div>
	<form action="locationpage.do">
		<input type="hidden" name="location" value="">
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
	<script src="js/script.js"></script>
	<script>
function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    $('#btn').attr('onclick','closeNav()');
    
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    $('.rightbar button').attr('onclick','openNav()');
}
</script>
	
   <div style="height: 100px"></div>
   
   <div style="background-color: #DDDDDD; margin-top: 20px; padding-top: 50px; padding-bottom: 50px">
		<h2 align="center" style="color: gray">footer</h2>
   </div>
</body>

</html>