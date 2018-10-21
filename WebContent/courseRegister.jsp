<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/fontAndScroll.css">

<title>Insert title here</title>
   <script type="text/javascript">
      $(function() {
         $('input[type=button]').one('click',function() {
            var of = window.opener.document;
            of.location.href = "saveCourse.do?id=${param.id}&&courseName="+$('#courseName').val();
            self.close();
         });
      });
   </script>

   <style type="text/css">
      .modal-body {
           margin: 15px 0;
       }
   </style>
</head>
<body>
   <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="text-center">Course Registration</h2>
            </div>
            <div class="modal-body">
               <input type="hidden" name="command" value="courseRegister">
               <div class="form-group">
                   ID : <input type="text" class="form-control input-lg" name="id"value="${param.id}" readonly="readonly" autofocus/>
               </div>
   
               <div class="form-group">
                   Course Name : <input type="text" class="form-control input-lg" name="courseName" id="courseName" placeholder="해당 코스의 이름을 입력해주세요." required="required"/>
               </div>
   
               <div class="form-group">
                   <input type="button" class="btn btn-block btn-lg btn-primary" value="Registration" />
               </div>
            </div>
        </div>
    </div>
</body>
</html>