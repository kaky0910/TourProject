<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<meta charset="utf-8">
<nav class="navbar navbar-defalt navbar-fixed-top"
   style="background-color: #fff">
   <div id="header">
      <div class="container">
         <div class="navbar-header" style="margin-top: 15px">
            <button type="button" class="navbar-toggle" id="menuSpan"
               data-toggle="collapse" data-target="#myNavbar">
               <span class="icon-bar"></span> <span class="icon-bar"
                  style="margin-top: 2px"></span> <span class="icon-bar"></span>
            </button>
            <a href="index.jsp"><img src="img/main_logo.png" width="150"
               height="47" style="background-color: transparent;"></a>
         </div>
         <!-- navbar-header -->

         <div class="collapse navbar-collapse navbar-right" id="myNavbar"
            style="margin-top: 15px">
            <form class="navbar-form navbar-left" action="getdata.do">
               <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="search" id="myInput">
                  <div class="input-group-btn">
                     <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                     </button>
                  </div>
               </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown"><a class="dropdown-toggle"
                  data-toggle="dropdown" href="#" id="userMenu"> <span
                     class="glyphicon glyphicon-user white"> <span
                        class="caret" style="margin-left: 10px"></span>
                  </span>
               </a> <c:choose>
                     <c:when test="${vo != null}">
                        <ul class="dropdown-menu">
                           <li><a href="logout.do"><span
                                 class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;로그아웃</a></li>
                           <li><a href="myreviews.do?id=${sessionScope.vo.id}"><span
                                 class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;내가 쓴 글</a></li>
                           <li><a href="scrap.do?id=${sessionScope.vo.id}"><span
                                 class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;스크랩</a></li>
                           <li><a href="myCourse.do?id=${sessionScope.vo.id}"><span
                                 class=""></span>&nbsp;&nbsp;나의 코스</a></li>
                           <li><a href="write.jsp"><span
                                 class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;글쓰기</a></li>
                           <li><a href="registerupdate.do?id=${sessionScope.vo.id}"><span
                                 class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;정보 수정</a></li>
                        </ul>
                     </c:when>

                     <c:otherwise>
                        <ul class="dropdown-menu">
                           <li><a href="login.jsp"><span
                                 class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;로그인</a></li>
                           <li><a href="register.jsp"><i class="fas fa-user-plus"></i>&nbsp;&nbsp;회원가입</a></li>
                        </ul>
                     </c:otherwise>
                  </c:choose></li>
            </ul>
         </div>
         <!-- myNavbar -->
      </div>
      <!-- container -->
   </div>
   <!-- header -->
   <div id="line"></div>
</nav>