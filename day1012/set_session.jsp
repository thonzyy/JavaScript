<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="세션에 값을 설정" %>
    <%@ page session="true" %>
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
//세션 생존시간(interval : 요청이 끝난 후 다음 요청이 들어오기 까지의 시간) 설정
session.setMaxInactiveInterval(60);
//세션(내장객체)의 값을 설정, 바로 사용할 수 있다.
session.setAttribute("name","임태균");
session.setAttribute("age",20);
List<String> list=new ArrayList<String>();
list.add("유투브 감상");
list.add("게임");
list.add("낚시");
session.setAttribute("hobby", list);

%>
세션의 값이 설정되었습니다.<br>
<a href="get_session.jsp">값얻기</a>
</body>
</html>

