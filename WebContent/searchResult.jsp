<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>방방곡곡</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/nav.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <c:forEach items="${alist}" var="item">
		<c:set value="${item.spotName}" var="spotName"></c:set>
		<c:set value="${item.address}" var="address"></c:set>
		<c:set value="${item.location}" var="location"></c:set>
		<c:set value="${item.city}" var="city"></c:set>
		<c:set value="${item.mainImage}" var="mainImage"></c:set>
		<c:set value="${item.description}" var="description"></c:set>
		<c:set value="${item.lon}" var="lon"/>
		<c:set value="${item.lat}" var="lat"/>
	</c:forEach>
<script type="text/javascript">
	$(function(){
		$('.sidebar').css('height',$(window).height());
		$('#btn').click(function(){
			$.ajax({
		         type : "get",
		         url : "JsonServlet",
		         dataType:"json",
 		         data : {
		        	"spotName" : "${spotName}",
		            "img" : "${mainImage}",
		            "flag" : "add",
		            "address" : "${address}" ,
		            "lon" : "${lon}",
		            "lat" : "${lat}"
		         },

		         success : function(data) {
		        	 if(data.img!=undefined){
			            $('#mySidebar').append("<img src="+data.img+" width='200' height='200'><br>");
			            $('#mySidebar').append("<div><span style='color:red'>"+data.spotName+"</span><span align='right'><a id='"+data.spotName+"'>삭제</a></span></div>"+"<script src=js/soRj.js><"+"/script>");
		        	 }
		        	 else alert("중복 불가");
		         }//callback
		         ,
		         error : function(data){
		        	 alert("중복 불가");
		         }
		      });//ajax
		});
		$('#mySidebar a').click(function(){
			$.ajax({
		         type : "get",
		         url : "JsonServlet",
		         dataType:"json",
		         data : {
		        	"spotName" : $(this).attr('id'),
		            "flag" : "cons"
		         },

		         success : function(data) {
		        	$('#mySidebar').html(data.str);
		            
		         }//callback
		         ,
		         error : function(data){
		        	 alert("삭제 실패");
		         }
		      });//ajax
			});
		$('#regBtn').click(function(){
			if(${vo!=null}){
				if(${sessionScope.cvo.map.size()>1}){
					window.document.location.href="course.jsp";
				}
				else{
					alert("관광지를 추가해주세요");
				}
			}
			else
				alert("로그인이 필요합니다");
		});
	});
	
</script>
<style>
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
   	#mainImage {
   		margin-right: 30px;
   		padding : 10px;
   		border: 1px solid lightgray;
   		width: 400px;
   		height: 200px
   	}
   	
   	#info {
   		margin-left: 30px;
   		border: 1px solid lightgray;
   		width: 400px;
   		height: 200px
   	}
   	.sidebar {
   	margin-top:180px;
    position: absolute;
    right: -200px;
    transition: 0.3s;
    width: 300px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    border-radius: 0 5px 5px 0;
    background-color: white;
    z-index: 100;
    top: -100px;
	}
		.sidebar:hover {
    right: 0;
}
	
   	
</style>

<script type="text/javascript" src="js/nav.js"></script>

</head>
<body style="overflow-x:hidden ">
   	<%@include file="nav.jsp" %>
    <div style="height: 120px"></div>
    
    <div>
	    <c:choose>
          <c:when test="${emptyFlag == true || flag == true}">
             <div class="col-sm-12">
                <div align="right" class="col-sm-6">
                   <h3>${spotName}</h3><br>
                </div>
                
               <div align="left" class="col-sm-6" style="margin-top: 21px">
                   <a href="#" id="btn"><img src="img/courseAdd.png" width="75"></a>
                </div>
             </div>
         
            <div align="right" class="col-sm-12" style="margin-bottom: 10pxl"> 
               <div align="right" class="col-sm-6">  
                  <img alt="${spotName}" src="${mainImage}" id="mainImage"> 
               </div>
               <div align="left" class="col-sm-6" id="info" style="overflow-y: scroll;overflow-x:hidden "> 
                  ${description}
                  <br><br>${address}
               </div>
            </div>
            <div align="center" class="col-sm-12" style="margin-top: 35px"><hr></div>
          </c:when>
          <c:otherwise></c:otherwise>
       </c:choose>
		
		<div align="center" class="col-sm-12" style="margin-top: 15px"> 
			<h3 align="center" style="margin-top: 10">관련 리뷰</h3><br><br>
			
			<c:forEach items="${lvo.list}" var="rList">
					<div align="center" class="col-sm-4">
						<hr>
						${rList.date}<br>
						<a href="checkReview.do?num=${rList.reviewNum}">
						<img src="${rList.mainImage}" width="350" height="200"><br>
						${rList.title}</a>
						<hr><br><br>
					</div>
			</c:forEach>
			
			<br><br>
			
			<div align="center" class="col-sm-12">  
				<c:set var="pb" value="${lvo.pb}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<ul class="pagination pagination-sm">
			    		<li><a href="getdata.do?search=${spotName}&&pageNo=${pb.startPageOfPageGroup-1}">&#60;</a></li>
			  		</ul>
				</c:if>
				
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:if test="${i!=0}">
						<c:choose>
							<c:when test="${pb.nowPage!=i}">
								<ul class="pagination">
					    			<li><a href="getdata.do?search=${spotName}&&pageNo=${i}">${i}</a></li>
					    		</ul>
							</c:when>
							<c:otherwise>
								<ul class="pagination">
					    			<li><a href="#">${i}</a></li>
					    		</ul>
							</c:otherwise>
						</c:choose>
					</c:if>
					&nbsp;
				</c:forEach>
				
				<c:if test="${pb.nextPageGroup}">
					<ul class="pagination pagination-sm">
			    		<li><a href="getdata.do?pageNo=${pb.endPageOfPageGroup+1}">&#62;</a></li>
			  		</ul>
				</c:if>	
			</div>			
		</div>
    </div>
   				<div id="mySidebar" class="sidebar" style="border-left:3px solid #FFB88C; padding-top: 30px">
   					<c:choose>
   						<c:when test="${sessionScope.cvo!=null}">
   							${sessionScope.cvo.allCourse}
   						</c:when>
   						<c:otherwise>
   							<h3 align="center" style="color: black">코스만들기</h3>
   						</c:otherwise>
   					</c:choose>
   					<button id="regBtn" style="font-size: 10px;color: black; margin-left: 30px">만들기~</button>
   				</div>
   				
   	
</body>

</html>