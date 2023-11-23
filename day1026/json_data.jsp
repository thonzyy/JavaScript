<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
JSONObject jsonObj=new JSONObject();
jsonObj.put("name","박상준");
jsonObj.put("age",25);
jsonObj.put("addr","서울시 강남구 역삼동");

out.print(jsonObj.toJSONString());
%>