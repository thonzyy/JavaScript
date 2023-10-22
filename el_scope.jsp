<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="el에서 변수의 사용. scope 객체가 필요하다." %>
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
String msg="오늘은 월요일입니다.";
%>
Expression : <%=msg %><br/>
EL : (${msg})<br/>
<!-- el에서는 변수에 직접 접근이 안 된다. -->
<%
//1. scope객체에 값을 할당.
pageContext.setAttribute("msg",msg);
%>

2. 사용 : ${pageScope.msg}

<%//객체에 값을 할당
pageContext.setAttribute("pageName","페이지 scope");
request.setAttribute("reqName","리퀘스트 scope");
session.setAttribute("sesName","세션 scope");
application.setAttribute("appName","어플리케이션 scope");
%>
<br>
pageScope : ${pageScope.pageName} (${pageName})<br>
requestScope : ${requestScope.reqName} (${reqName})<br>
sessionScope : ${sessionScope.sesName} (${sesName})<br>
applicationScope : ${applicationScope.appName} (${appName})<br>
<%
//이름이 같은 경우 : 사용 객체가 다르므로 값이 다르게 들어간다 .
pageContext.setAttribute("name","페이지 name");
application.setAttribute("name","어플리케이션 name");
%>
page : ${pageScope.name } / app : ${applicationScope.name }<br/>
scope객체를 생략하면 ${name }
</body>
</html>