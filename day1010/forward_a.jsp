<%@page import="day1004.TestVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="데이터 처리 페이지-화면을 만들지 않는다." %>

<% 
	List<TestVO> list = new ArrayList<TestVO>();
	list.add(new TestVO("sist_logo.png","쌍용교육센터","http://sist.co.kr"));
	list.add(new TestVO("daum.png","카카오","http://daum.net"));
	list.add(new TestVO("bootstrap.png","이젠 디자인 하면 트위터 부트스트랩이죠","http://getbootstrap.com"));
	
	String name="이동원";
	//0 -> 처리된 데이터를 뷰페이지로 보내기위해 scope객체로 설정한다.
	request.setAttribute("data",list);
	request.setAttribute("name", name);
	//1.이동할 페이지를 설정
	RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");
	//2. 이동
	rd.forward(request, response);

%>