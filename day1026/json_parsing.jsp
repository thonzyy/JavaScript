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
   $("#btn").click(function() {
	 $.ajax({
		url: "json_data.jsp",
		type:"get",
		dataType:"json",
		error:function(xhr){
			console.log(xhr.status);
		},
		
		success:function(jsonObject){
			$("#nameUl").append("<li>이름 : "+jsonObject.name+"</lt>");
			$("#nameUl").append("<li>나이 : "+jsonObject.age+"</lt>");
			$("#nameUl").append("<li>주소 : "+jsonObject.addr+"</lt>");
		}
	 })
   });
});//ready
</script>

</head>
<body>
<input type="button" value="클릭" class="btn btn-info" id="btn"/>
<ul id="nameUl">
	<li>홍지성</li>
</ul>
</body>
</html>