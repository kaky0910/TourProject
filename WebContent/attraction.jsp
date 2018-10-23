<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/nav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<!-- co button -->
<link rel="stylesheet" href="css/cobutton.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- masonry -->
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="js/masonry.pkgd.js"></script>
<script src="js/masonry.pkgd.min.js"></script>

<!-- masonry 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.0.0/masonry.pkgd.min.js"></script>
<!-- imagesloaded 로딩 (모든 이미지가 로딩된 후 실행되도록 할때 필요) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.2/masonry.pkgd.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->



<style>
@font-face {
	font-family: HangeulNuriR;
	src: url('./font/HangeulNuriR.ttf') format('truetype');
}

a {
	color: #b32e2e;
	text-decoration: none;
}

.contents {
	padding-top: 80px;
}

section {
	/* height: auto; */
	
}

header {
	border-bottom: 7px solid transparent;
	-moz-border-imag: -moz-linear-gradient(left, DarkGreen, #64AB4C);
	/* #CEF6EC #A4A4A4 #BDBDBD #AEB404*/
	-webkit-border-image: -webkit-linear-gradient(left, DarkGreen, #64AB4C);
	border-image: linear-gradient(to right, #fcf8e3, #f9d303);
	border-image-slice: 1;
	margin-top: 8px;
	padding-bottom: 8px;
	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
		"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
		sans-serif;
	font-size: 14px;
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
	color: rgba(223, 190, 106, 0.7);
}

.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited,
	a.ui-button, a:link.ui-button, a:visited.ui-button, .ui-button {
	color: inherit;
	text-decoration: none;
}

.ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover,
	html .ui-button.ui-state-disabled:active {
	border: inherit;
	background: inherit;
	font-weight: inherit;
	color: inherit;
}

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active,
	a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover
	{
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
.caret {
	margin-left: 10px
}

* {
	box-sizing: border-box;
}

body {
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
	height: 1000px
	/* only for demonstration, should be removed */
}

article>div {
	height: 100%
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
	opacity: 0.4;
	overflow: hidden;
	width: 0;
	/* height: 100%; */
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
	/* height: auto; */
}

{
box-sizing
:
border-box
;
}
/* force scrollbar */
html {
	overflow-y: scroll;
}

s
body {
	font-family: sans-serif;
}
/* ---- grid ---- */
.grid {
	background: #fff;
}
/* clear fix */
.grid:after {
	content: '';
	display: block;
	clear: both;
}
/* ---- .grid-item ---- */
.grid-sizer, .grid-item {
	width: 27%;
	/*  height: auto; */
	margin: 2%;
}

.grid-item {
	float: left;
}

.grid-item a img {
	display: block;
	max-width: 100%;
}

.grid-item :hover {
	opacity: 0.3;
}
/*=================================================  */
.main {
	text-align: center;
	font-weight: bold;
}

}
#img :hover {
	opacity: 0.3;
}

#img {
	width: 250px;
	/*  height: 182px; */
}

.hashtag:before {
	content: "#";
}

#content {
	text-align: center;
}

#tabs::-webkit-scrollbar {
	width: 0 !important;
}

#zzz {
	height: 1000px
}


</style>

<script>
	var count = 1;
	var page = 1;

	function showmore() {
		count += 1;
		$.ajax({
			type : "get",
			url : "getBestReviewCityBytag.do",
			data : {
				"location" : "${location}",
				"tag" : $('#distinguish').html(),
				"pageNo" : count,
				"size" : $('#listSize').html(),
				"city" : ${avo[0].city}+""
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
			url : "getBestReviewCityBytag.do",
			data : {
				"location" : "${location}",
				"tag" : "맛집",
				"city" : ${avo[0].city}+"",
				"pageNo" : "0"
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
				"tag" : str,
				"pageNo" : count,
				"city" : ${avo[0].city}+""
			};

			$.ajax({
				type : "get",
				url : "getBestReviewCityBytag.do",
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


<script type="text/javascript">
	$(function() {

	/* 	var grid = document.querySelector('.grid');
		var msnry;
		var masonry = new Masonry(grid, {
			itemSelector : '.grid-item',
			columnWidth : '.grid-sizer',
			percentPosition : true
		});
		var $grid = $('.grid').masonry(function() {
			$grid.masonry({
				itemSelector : '.grid-item',
				percentPosition : true,
				columnWidth : '.grid-sizer'
			});
		});
	
		$imgs = $('.grid').imagesLoaded(function() {
		    $imgs.masonry({
		        itemSelector : '.grid-item', // img 태그를 대상으로 masonry 적용
		        columnWidth : '.grid-sizer',
				percentPosition : true // 내용물을 가운데 정렬하기, CSS margin:0 auto; 설정이 필요함
		    });
		});
		
		// Javascript */
		var container = document.querySelector('.grid');
		var msnry = new Masonry( container, {
		  // options
			itemSelector : '.grid-item',
			percentPosition : true,
			columnWidth : '.grid-sizer'
		});
		// jQuery
		var $container = jQuery('.grid');
		// initialize
		$container.masonry({
		columnWidth : '.grid-sizer',
		 itemSelector: '.grid-item'
		});

		
	});//ready
	
</script>
<script type="text/javascript" src="js/nav.js"></script>
</head>
<body>
	<%@include file="nav.jsp"%>
	<div style="height: 75px;"></div>
	<section style="height: auto;">
		<nav id="tabs" style="overflow-y: scroll; height: 800px; width: 30%; overflow-x: hidden; float: left;">
			<div>
				<h2 align="center"style="font-color: gray; font-family: HangeulNuriR;">인기 게시물</h2>
				<a class="cobtn"href="javascript:void(0)">맛집</a> 
				<a class="cobtn"href="javascript:void(0)">관광</a>
				<a class="cobtn"href="javascript:void(0)">숙소</a> 
				<a class="cobtn"href="javascript:void(0)">쇼핑</a>
				
			</div>
			<div id="tab-1"></div>
			<div id="tab-2"></div>
			<div id="tab-3"></div>
			<div id="tab-4"></div>

		</nav>

		<article>
			<div style="margin-left: 10%">

				<div class="w3-container w3-dark-grey">
					<h1 class="main">${avo[0].city}</h1>
				</div>
				<div class="grid" style="position:sticky; height: 1000px; ">
					<div class="grid-sizer"></div>
				<c:forEach var="avo" items="${avo}">
                     <c:if test="${avo.mainImage ne null}">
                        <div class="grid-item container">
                           <a href="getdata.do?search=${avo.spotName}"> <img class="image" id="imgtag"
                              src="${avo.mainImage}">
                              <div class="overlay">
                                 <div id="cityTitle" class="text" name="tourSpot1">${avo.spotName}</div>
                              </div>
                           </a>
                        </div>
                     </c:if>
                  </c:forEach>
				</div>
			</div>
		</article>
	</section>
</body>
</html>