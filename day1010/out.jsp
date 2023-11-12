<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="웹브라우저로 출력하는 내장객체" %>
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
   
});//ready
</script>

</head>
<body>
<%
for(int i= 0; i <10; i++) {
	out.print(i);
}//end for

%>
<%
for(int i= 0; i <10; i++) {
	out.println(i);
}//end for
	%>
	<br>
	<% String[] url={"daum.net" , "sist.co.kr", "google.com"};
	String[] urlTitle={"다음" , "쌍용", "구글"};
	//위의 배열을 사용하여 링크를 만들어보세요.
	
	for(int j=0 ; j<3 ; j++){%>
		<a href="http://<%=url[j]  %>"><%=urlTitle[j] %></a>
		
	<% }%>


</body>
</html>