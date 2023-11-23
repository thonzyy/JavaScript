<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   $("#btn").click(function(){
	   //ajax사용
	  $.ajax({
		  url:"html_response.html",
          type:"GET",
     
          dataType:"html",
          error:function(xhr) {
            alert("에러 발생!! ");
          },
          success:function(data) {
            //dataType 속성에 정의된 값이 데이터 형이 매개변수로 입력된다.
           $("#resultDiv").html(data);
          }
	  });//ajax
   });//click
   
   $("#btn2").click(function(){
	   $.ajax({
		 
		   url:"text_response.txt",
		   type:"GET",
		   dataType:"text",
		   error:function(xhr){
			   alert("문제발생"+xhr.status); 
			},
		   success:function(data){
			  alert(data)
              $("#resultDiv").html("<input type='text' value='"+data+"'/>")
              $("#msg").val(data);
		   }
	   });//ajax
   });//click
   
   $("#btn3").click(function() {
	   $.ajax({
		   url:"xml_response.xml",
		   type:"GET",
		   dataType:"xml",
		   error:function(xhr){
			   alert(xhr.statusText+" / "+xhr.status); 
			},
		   success:function(data){
			$("#msg").val($(data).find("msg").text());
        
		   }
		   
	   })
   })
   
      $("#btn4").click(function() {
	   $.ajax({
		   url:"json_response.json",
		   type:"GET",
		   dataType:"json",
		   error:function(xhr){
			 console.log(xhr.statusText+" / " + xhr.status);
			 
			},
		   success:function(data){
		$("#msg").val(data.msg);
		   }
	   });
   });
   
   
});//ready
</script>

</head>
<body>
<div>
<input type="button" value="HTML요청" class="btn btn-success" id="btn"/>
<input type="button" value="TEXT요청" class="btn btn-success" id="btn2"/>
<input type="button" value="XML요청" class="btn btn-success" id="btn3"/>
<input type="button" value="JSON요청" class="btn btn-success" id="btn4"/>
</div>
<div id="resultDiv"></div>

<input type="text" id="msg"/>
</body>
</html>