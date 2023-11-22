<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.sist.member.vo.StudentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.StuDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.dao.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="복합 정보 jsonObj" %>
    
    <%
    String tempAge = request.getParameter("age");
    
    int age=0;
    if (tempAge!=null) {
    	age=Integer.parseInt(tempAge);
    }// end if
    
    StuDAO sDAO= StuDAO.getInstance();
    

    JSONObject jsonObj=  new JSONObject();
    //부가 정보를 넣어준다.
    SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM--dd HH:mm:ss");
    jsonObj.put("resultDate",sdf.format(new Date()) );
    jsonObj.put("writer","임태균");
    jsonObj.put("version","1.0");
    jsonObj.put("license","LPL - 누구나 마음대로 수정, 배포 쌉가능!!");
    try{
    	List<StudentVO> list = sDAO.selectAgeStudent(age);
    	JSONArray jsonArr = new JSONArray();
    	JSONObject jsonTemp = null;
    	
    	for(StudentVO sVO:list) {
    		jsonTemp = new JSONObject();
    		jsonTemp.put("num", sVO.getNum());
    		jsonTemp.put("name", sVO.getName());
    		jsonTemp.put("age", sVO.getAge());
    		jsonTemp.put("email", sVO.getEmail());
    		jsonTemp.put("input_date", sdf.format(sVO.getInput_date()));
    		
    		
    		jsonArr.add(jsonTemp);
    		
    	}
    	
    	jsonObj.put("data", jsonArr);
    	jsonObj.put("dataSize", list.size());
    	jsonObj.put("resultFlag", list.size() !=0);
    }catch(SQLException se) {
    	jsonObj.put("resultFlag", false);
    	se.printStackTrace();
    }
    
    pageContext.setAttribute("jsonObj", jsonObj);
    %>
    
    ${jsonObj }
  