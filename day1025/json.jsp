<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <%String name= "임태균" ;
    
    int age=25;
    String addr="용인시 죽전동";
    
    
    
    %>
    
    { "name": "<%= name %>" , "age": <%= age %>, "addr" : "<%= addr%>"}