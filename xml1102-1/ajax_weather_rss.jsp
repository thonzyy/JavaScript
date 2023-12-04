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
   $.ajax({
	   url:"https://www.kma.go.kr/w/rss/dfs/hr1-forecast.do?zone=1168064000",
		type:"get",
		dataType:"XML",
		error:function(xhr){
			alert("날씨 로드 중 문제 발생");
			console.log(xhr.status);
		},
		success:function(xml){
			
		}
			   
   })
});//ready
</script>

</head>
<body>
<input type="button" value="날시정보" id="btn btn-info btn-sm" name="btn">
<div id="djv"></div>
</body>
</html>