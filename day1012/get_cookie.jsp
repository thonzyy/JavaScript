<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
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
//쿠키는 여러 개가 심어질 수 있기 때문에 Cookie의 배열로 얻어진다.
Cookie[] cookies=request.getCookies();
boolean flag= false;
if(cookies!=null){//쿠키가 존재하면
		String cookieName="",cookieValue="";
	for(Cookie cookie : cookies) {
		cookieName=cookie.getName();
		cookieValue=cookie.getValue();
		if(!"JSESSIONID".equals(cookieName)) {
			flag=true;
			out.println("쿠키명 : "+cookieName+ " 쿠키 값 : "+cookieValue);
		}//end if
		
	}//end for
}
		%>	

		<% 	
		if(flag){%>
			<a href="remove_cookie.jsp">쿠키삭제</a>
			<%}else{//쿠키 없음%>
			
			<a href="add_cookie.jsp">쿠키심기</a>
	<%
	
		}//end else
%>
</body>
</html>