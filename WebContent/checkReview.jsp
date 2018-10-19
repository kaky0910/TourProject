<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CSS Website Layout</title>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
 <link rel="stylesheet" href="css/checkReviewStyle.css">
 <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
 <link rel="stylesheet" href="css/rc.css">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="css/nav.css">
 
  
   <!-- Demo CSS -->
	<link rel="stylesheet" href="css/checkreview.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

	<!-- Modernizr -->
  <script src="js/modernizr.js"></script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
<script src="js/rc.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@font-face{
	font-family:HangeulNuriR;
	src:url('./font/HangeulNuriR.ttf') format('truetype');

}
* {
    box-sizing: border-box;
}

body {
/*  background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);
   background: linear-gradient(to bottom, #FFB88C, #DE6262);  */
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
    margin-left: 10%;
    margin-right: 10%;
	font-family: HangeulNuriR;

}
.title{
text-align : center;

}
/* Style the header */
.header {
    
    padding: 20px;
    text-align: center;
}

/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    
}
.topnav2{
    overflow: hidden;
    
    text-align:center;

}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

/* Create three unequal columns that floats next to each other */
.column {
    float: left;
    padding: 10px;
}

/* Left and right column */
.column.side {
    width: 15%;
}

/* Middle column */
.column.middle {
    width: 50%;
}

/* Clear floats after the columns */
.row:before {
    content: "";
    display: table;
    clear: both;
   padding-top: 30px;
}
.row:after {
    content: "";
    display: table;
    clear: both;
    padding-top: 30px;
 
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .column.side, .column.middle {
        width: 100%;
    }
}


section {
	height: auto;
}

section:after {
	content: "";
	display: table;
	clear: both;
}

.main {
    width: 100%;
    float: left;
    /* box-sizing: border-box; */
    padding-top: 0px;
    padding-right: 20px;
    padding-left: 20px;
    padding: 20px;
}
.maincontent{

    width: 70%;
    float: left;
    border-left: 1px solid #d9d9d9;
    border-right: 1px solid #d9d9d9;
    margin-left:10%;
    margin-right:10%;
    box-sizing: border-box;


}
.reviewinfo{
text-align:right;
height:50%;
}

/* /* commnet submit button */
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.subbutton {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}

.subbutton:hover {background-color: #e7e7e7;}
 */
/* Style the footer */
.footer {
    
    padding: 10px;
    text-align: center;
}


#content{
    width: 85%;
    height: 100px;
    margin: 10px;
    margin-left: 30px;


}


</style>
<script type="text/javascript">
	$(function() {
		$('button[value=modify]').click(function(){
		 	alert("수정 누르셨다.");
		});//click
		$('button[value=delete]').click(function(){
		 	alert("삭제 누르셨다.");
		});//click
	});//ready
</script>

</head>
<body>
<c:choose>
<c:when test="${sessionScope.vo!=null}">
<script type="text/javascript">
$(function() {
	 	 $('.heart').click(function() {
			
			if ($(this).hasClass('is-checked')) {
				$.ajax({
					type : "get",
					url : "like.do",
					data : {
						"reviewNum" : "${rvo.reviewNum}",
						"id" : "${rvo.id}",
						"flag" : "down"
					},

					success : function(data) {
						alert("좋아요 취소");
						$('.heart').toggleClass('is-checked');
						$('#like').html("좋아요::${rvo.like}");
					}
				});
			} else {
				$.ajax({
					type : "get",
					url : "like.do",
					data : {
						"reviewNum" : "${rvo.reviewNum}",
						"id" : "${rvo.id}",
						"flag" : "up"
					},

					success : function(data) {
						alert("좋아요 완료");
						$('.heart').toggleClass('is-checked');
						$('#like').html("좋아요::${rvo.like+1}");
					}
				});
			}
		});  
		
		$('.star').click(function() {
			
			if ($(this).hasClass('is-checked')) {
				$.ajax({
					type : "get",
					url : "scrapCheck.do",
					data : {
						"reviewNum" : "${rvo.reviewNum}",
						"id" : "${rvo.id}",
						"flag" : "down"
					},

					success : function(data) {
						alert("스크랩 취소");
						$('.star').toggleClass('is-checked');
					}
				});
			} else {
				$.ajax({
					type : "get",
					url : "scrapCheck.do",
					data : {
						"reviewNum" : "${rvo.reviewNum}",
						"id" : "${rvo.id}",
						"flag" : "up"
					},

					success : function(data) {
						alert("스크랩 완료");
						$('.star').toggleClass('is-checked');
					}
				});
			}
		});
		
		$('.addComment').click(function() {
			if($('#content').val()==''){
				
				alert("댓글내용을 입력해주세요");	
				
				}else{
				$.ajax({
					type : "get",
					url : "addComment.do",
					data : {
						"reviewNum" : "${rvo.reviewNum}",
						"id" : "${rvo.id}",
						"content" : $('#content').val()+""
						
					},
					success : function(data) {
						alert("코멘트 등록완료");
					}
				
				});//ajax
				}
			});
		
		$('.deleteComment button').click(function() {
			var num = $(this).attr("id").replace("deletebtn","");
			var span = $('span[id=comment'+num+']').html();
				$.ajax({
					type : "get",
					url : "deleteComment.do",
					data : {
						"reviewNum" : "${rvo.reviewNum}",
						"id" : "${rvo.id}",
						"content" : span
						
					},
					success : function(data) {
						alert("코멘트 삭제완료");
					}
				
				});//ajax	
				
		});
	$(window).load(function() {
	  $('.flexslider').flexslider({
	    animation: "slide",
	    controlNav: "thumbnails"
	  });
	});
})
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	$(function() {
		$('.heart').click(function() {
	
		
		//중앙위치 구해오기
	/* 	 LeftPosition=(screen.width)/2;
		 TopPosition=(screen.height)/2;
		 
		 O="width=350"+",height=200"+",scrollbars=no"+",top="+TopPosition+",left="+LeftPosition; 
		 Win=window.open("","",O); 
		 Win.document.write("<html><head><title>Login</title></head>");
		 Win.document.write("<body topmargin=0 leftmargin=0>");
		 Win.document.write("<h1>===경고===</h1></body></html>");
		 Win.document.write("<h2>로그인을 해주시기 바랍니다</h2></body></html>");
		 Win.document.close(); */
		 alert("로그인을해주시기 바랍니다.");
			});
		$('.star').click(function() {
		
			
			//중앙위치 구해오기
		/* 	 LeftPosition=(screen.width)/2;
			 TopPosition=(screen.height)/2;
			 O="width=350"+",height=200"+",scrollbars=no"+",top="+TopPosition+",left="+LeftPosition;
			 Win=window.open("","",O); 
			 Win.document.write("<html><head><title>Login</title></head>");
			 Win.document.write("<body topmargin=0 leftmargin=0>");
			 Win.document.write("<h1>===경고===</h1></body></html>");
			 Win.document.write("<h2>로그인을 해주시기 바랍니다</h2></body></html>");
			 Win.document.close(); */
			alert("로그인을해주시기 바랍니다.");
				});
		
		})
		
</script>
</c:otherwise>		
</c:choose>

	<%@include file="nav.jsp" %>
	
	<div style="height: 150px"></div>

<div class="reviewinfo">
<br><br>
<h3 class="title">${rvo.title} <br><br>No.${rvo.reviewNum}</h3><br><br>
 작성자::${rvo.id}&emsp;작성일시::${rvo.date}&emsp;<span id="like">좋아요::${rvo.like}</span>
<hr>
</div>
  <div class="main">
  <div class="row" style="background-color: inherit;">
  
  <br>
  <div class="col-lg-4">
 <p style="background-color: inherit;">${rvo.content}</p>
 <br>
  </div> 
  <div class="col-lg-1"></div>
  <div class="col-lg-7">
     <section class="slider">
       <div id="slider" class="flexslider">
         <ul class="slides">	  	
          	<c:forEach items="${rvo.images}" var="vo">
	  		<li data-thumb="${vo}">
	  		<img src="${vo}" title="클릭하시면 원본크기로 보실 수 있습니다."
     		style="cursor: pointer;" onclick="expImgPop('${vo}')"/>
     		</li>
			</c:forEach>
		</ul>
	  </div>
	 <div id="carousel" class="flexslider">
	  	<ul class="slides">
	  		<c:forEach items="${rvo.images}" var="vo">
	  		<li data-thumb="${vo}">
	  		<img src="${vo}" width="300px" height="250px"/>
     		</li>
			</c:forEach>
		</ul>
	  </div>
     </section>
     </div>
</div>
 

<ul class="choice-list">
  <li class="checkbox check" style="margin-top: 0"></li>
  <c:choose>
  	<c:when test="${likeFlag==true}">
  		  <li class="checkbox heart is-checked"></li>
  	</c:when>
  	<c:otherwise>
  		<li class="checkbox heart"></li>
  	</c:otherwise>
  </c:choose>
  
  <c:choose>
  	<c:when test="${scrapFlag==true}">
  		  <li class="checkbox star is-checked"></li>
  	</c:when>
  	<c:otherwise>
  		<li class="checkbox star"></li>
  	</c:otherwise>
  </c:choose>
 </ul>  
  
  </div>
  <c:set value="${rvo.comments}" var="cvo"></c:set>
 <hr>
 <div class="row" style="margin-left: 0px; margin-right: 0px;">
 <h3>&emsp;댓글</h3><hr>
  <c:choose> 
 <c:when test="${null ne sessionScope.vo}">
 &emsp;댓글 작성 <br><input type="text" name="content" id="content" required="required"> <a class="addComment"><button type="button" class="btn btn-light" 
 style="margin-top: 70px;">등록</button></a><br><hr>
 
 </c:when>
 
 <c:otherwise> 
 &emsp;댓글 작성 <br><input type="text" id="content" disabled="disabled" value="로그인이 필요합니다."> <a class="addComment"><button type="button" class="btn btn-light" 
 disabled="disabled" style="margin-top: 70px;">등록</button></a><br><hr>
 </c:otherwise> 
 </c:choose>

  	<c:forEach items="${rvo.comments}" var="cvo" varStatus="status">
		&emsp;<span>작성자:: ${cvo.id}</span>    |  댓글내용:: <span id="comment${status.index}">${cvo.comment}</span>
		<c:if test="${sessionScope.vo.id==cvo.id && sessionScope.vo.id !=null}">
			<a class="deleteComment"><button id="deletebtn${status.index}" type="button" class="btn btn-light" style="text-align:right;">삭제</button></a><hr><br>
		</c:if>
		<hr><br>
	</c:forEach>
 
</div>
<div class="footer">
  <p>관련글(카테고리)</p>
 </div>

 <!-- jQuery -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
  <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    })
    	$(window).load(function(){
    	$('#carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 300,
            itemMargin: 3,
            asNavFor: '#slider'
          });

      
      $('#slider').flexslider({
          animation: "slide",
          controlNav: false,
          animationLoop: false,
          slideshow: false,
          sync: "#carousel",
          start: function(slider){
            $('body').removeClass('loading');
          }
        });
    	
      //================================ menu ================================
      $('#myNavbar>ul li').click(function() {
         var scrollPosition = $($(this).attr('data-target')).offset().top;
         $('body, html').animate({
            scrollTop : scrollPosition
         }, 500); //animate
      }); //click

      $('#menuSpan .icon-bar').css('background', 'green');

      $('#myNavbar li a').css({
         'color' : 'black',
         'font-weight' : 'bold'
      }); //css

      $('#myNavbar li a').hover(function() {
         $(this).css({
            'color' : 'green',
            'background' : 'rgba(242, 242, 242, 0.5)'
         }); //css

      }, function() {
         $(this).css({
            'color' : 'black',
            'background' : 'inherit'
         }); //css
      }); //hover

      $('.dropdown-menu').css({
         'margin-top' : '9px',
         'min-width' : '12px',
         'border-radius' : '2px'
      }); //css
  
    
   })//ready
  </script>

 
  <!-- Optional FlexSlider Additions -->
  <script defer src="js/demo.js"></script>
  <script defer src="js/jquery.flexslider.js"></script>

	<!-- <script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->
	<script src="js/rc.js"></script>
	<script src="js/nav.js"></script>
</body>
</html>