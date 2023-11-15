<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="EL에서 제공하는 연산자 사용" isELIgnored="false"%>
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


산술연산자<br>
10+16=${ 10+16 }<br/>
10%2=${ 10%2 }(${10 mod 2} )<br/>
10 / 3 = ${10/3 }<br>
관계 연산자 <br/>
10 > 2 = ${10 > 2 } (${ 10 gt 2}) <br>
10 &lt; 2 = ${10 < 2 } (${ 10 lt 2}) <br>
10 >= 2 = ${10 >= 2 } (${ 10 ge 2}) <br>
10 &lt; 2 = ${10 <= 2 } (${ 10 le 2}) <br>
10 == 2 = ${10 == 2 } (${ 10 eq 2}) <br>
<%-- 10 != 2 = ${10 != 2 } (${ 10 ne 2}) <br> --%>

논리 연산자<br>
10>5 &amp;&amp;5&lt;10= ${10>5 && 5 < 10} (${10 gt  5 and 5 lt 10 })<br>

10 > 5 || 5 > 10  = ${10 > 5 || 5 > 10  } (${10 gt 5 or 5 gt 10 }) <br>

삼항 연산자<br>
10은 = ${10%2==0 ? "짝수" :"홀수" }<br> <!-- EL은 문자가 없으므로 문자열을 ",' 로 표현할 수 있다. -->
10은 = ${10%2==0 ? '짝수' :'홀수' }<br> <!-- EL은 문자가 없으므로 문자열을 ",' 로 표현할 수 있다. -->
10은 = ${10 mod 2 eq 0 ? '짝수' :'홀수' }


null은 출력하지 않는다.
파라미터 [${param.name}] / request 내장객체 [<%=request.getParameter("name") %> ] <br>
empty 비교할 때 사용<br/>
파라미터 EL[${ empty param.name}]<br> <!--  비어있으면 true , 있으면 false  -->
파라미터 EL[${ empty param.name?"아래의 링크를 클릭해주세요" :"링크가 클릭되었습니다"}]  
<br>
<a href="http://localhost/jsp_prj/day1016/el_operator.jsp?name=tk">name 요청</a> <!-- 현재 페이지의 파라미터 명이 name으로 값이 tk인 querystring을 가진 url을 href속성에 만들어서 넣어보세요 -->
<a href="http://localhost/jsp_prj/day1016/el_operator.jsp">그냥 요청</a> 
</body>
</html>