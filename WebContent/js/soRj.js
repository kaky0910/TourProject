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