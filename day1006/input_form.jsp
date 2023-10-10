<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="이름이 유일한 HTML Form Control" %>
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
   $("#getBtn").click(function() {
	   //유효성 검증
	   $("#getFrm").submit();
	   
   })//click
   
   $("#postBtn").click(function() {
	   //유효성 검증
	   $("#postFrm").submit();
	   
   })//click
});//ready
</script>

</head>
<body>
<div style="border: 1px solid #333; width:500px; padding:10px">
	<div>
	<h2>GET방식</h2>
	<form name="getFrm" id="getFrm" action="use_parameter.jsp" > 
	<label>text</label>
	<input type="text" name="text" class="inputBox" value="텍스트text"/><br>
	<label>password</label>
	<input type="password" name="pass" class="inputBox" value="패스워드pass"/><br>
	<label>hidden</label>
	<input type="hidden" name="hid" value="히든태그"/><br>
	<label>radio</label>
	<input type="radio" name="gender" value="m" checked="checked"/>남자
	<input type="radio" name="gender" value="m"/>여자
		<label>check</label>
		<!-- checkbox는 하나인 경우 배열로 처리되지 않는다. -->
	<input type="checkbox" name="check" value="save"/><br>
	<label>select</label>
	<select name="sel">
	<%for(int i=1;i<13;i++){%>
	<option value="<%=i %>월"><%=i  %>월</option>
		
	
	<%} %>
	
	</select><br>
	<textarea style="width:400px; height:80ox;" class="inputBox" name="ta">오늘은 금요일입니다.</textarea>
	<input type="button" value="GET요청" class="btn btn-success" id="getBtn"/>
	</form>
	</div>
	</div>
	
	<div style="border: 1px solid #333; width:500px; padding:10px; margin-top:20px">
	<div>
	<h2>POST방식</h2>
	<form name="postFrm" id="postFrm" action="use_parameter2.jsp"> 
	<label>text</label>
	<input type="text" name="text" class="inputBox" value="텍스트text"/><br>
	<label>password</label>
	<input type="password" name="pass" class="inputBox" value="패스워드pass"/><br>
	<label>hidden</label>
	<input type="hidden" name="hid" value="히든태그"/><br>
	<label>radio</label>
	<input type="radio" name="gender" value="m" checked="checked"/>남자
	<input type="radio" name="gender" value="m"/>여자
		<label>check</label>
		<!-- checkbox는 하나인 경우 배열로 처리되지 않는다. -->
	<input type="checkbox" name="check" value="save"/><br>
	<label>select</label>
	<select name="sel">
	<%for(int i=1;i<13;i++){%>
	<option value="<%=i %>월"><%=i  %>월</option>
		
	
	<%} %>
	
	</select><br>
	<textarea style="width:400px; height:80ox;" class="inputBox" name="ta">오늘은 금요일입니다.</textarea>
	<input type="button" value="POST요청" class="btn btn-info" id="postBtn"/>
	</form>
	</div>
	</div>
</body>
</html>