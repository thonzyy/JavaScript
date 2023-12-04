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
	   var paramJson={name: $("#name").val()};
	   $.ajax({
		   url:"hello.xml.jsp",
		   type:"get",
		   data:paramJson,
		   dataType:"XML",
		   error:function(xhr){
			   alert("잠시 후 다시 시도");
			   console.log(xhr.status);
		   },
		   success:function(xml){
			   //1. 입력받은 XML 문서객체에서 파싱할 노드 찾기
			  // var msgNode=$(xml).find("msg");
			   //2. 검색한 노드에서 parsing
			   //var msg= msgNode.text();
			   var msg=$(xml).find("msg").text();
			   $("#output").html("<strong>"+msg+"</strong>")
			   //alert(xml);
		   }//success
	   })//ajax
   });//click
});//ready
</script>

</head>
<body>
<input type="text" name="name" id="name" class="inputBox"/>
<input type="button" value="입력" class="btn btn-success" id="btn">
<div id="output"></div>
</body>
</html>