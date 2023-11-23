<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
JSONObject jsonObj=new JSONObject();
jsonObj.put("name","박상준");
jsonObj.put("age",25);
jsonObj.put("addr","서울시 강남구 역삼동");

JSONObject jsonObj2=new JSONObject();
jsonObj2.put("name","홍지성");
jsonObj2.put("age",36);
jsonObj2.put("addr","인천시 부평구 부평동");

JSONObject jsonObj3=new JSONObject();
jsonObj3.put("name","임태균");
jsonObj3.put("age",24);
jsonObj3.put("addr","경기도 용인시 죽전동");

JSONArray jsonArr=new JSONArray();

jsonArr.add(jsonObj);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3);


out.print(jsonArr.toJSONString());
%>