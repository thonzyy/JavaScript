<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="이름이 유일한 HTML Form Control 값 받기"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.143/servlet_prj/common/main/favicon.png">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
   
</style>
<script type="text/javascript">
   $(function() {
      $("#btn").click(function() {
         window.history.back();
      });
   });
</script>
</head>
<body>
   <%
   //GET방식인 경우 한글이 깨지지 않는다.
   //text=텍스트text&pass=패스워드pass&hid=히든태그&gender=M&sel=1월&ta=오늘은+금요일+입니다.
   request.setCharacterEncoding("UTF-8");
   
   String text = request.getParameter("text");
   String pass = request.getParameter("pass");
   String hid = request.getParameter("hid");
   String gender = request.getParameter("gender");
   String save = request.getParameter("check"); //checkBox null 발생 주의!
   String sel = request.getParameter("sel");
   String ta = request.getParameter("text");
   %>
   
<div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
   <div class="toast-header">
      <svg class="bd-placeholder-img rounded me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#007aff"></rect></svg>
      <strong class="me-auto">이름이 유일한 Form Control들</strong>
      <small>알빠노</small>
      <button id="btn" type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
   </div>
   <div class="toast-body">
      <span class="badge bg-danger"><%=request.getMethod() %>방식</span><br>
       <%-- <label>text</label> : <%=URLDecoder.decode(URLEncoder.encode(text, "8859_1"), "UTF-8") %><br> --%>
       <label>text</label> : <%=text %><br>
       <label>password</label> : <%=pass %><br>
       <label>hidden</label> : <%=hid %><br>
       <label>gender</label> : <%=gender %><br>
       <label>save</label> : <%=save %><br>
       <label>select</label> : <%=sel %><br>
       <label>textarea</label> : <%=ta %><br>
       <a href="http://192.168.10.142/jsp_prj/day1006/input_form.jsp">뒤로</a>
   </div>
</div>
</body>
</html>