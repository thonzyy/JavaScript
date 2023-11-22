<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.member.vo.StudentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.dao.StuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>

<%
//StuDAO를 사용하여 검색된 결과로 JSONOBECJT을 생성하여 , JSONARRAY에 추가하고 
//출력하는 코드를 작성해보세요.

// JSONOBJECT 이름 : NUM . NAME. AGE. EMAIL, INPUT_DATE

StuDAO sDAO= StuDAO.getInstance();

JSONArray jsonArr= new JSONArray();
	JSONObject jsonObj = null;
try{
List<StudentVO> list = sDAO.selectAllStudent();

for (StudentVO sVO : list ) {
	jsonObj = new JSONObject();
	
	jsonObj.put("num", sVO.getNum());
	jsonObj.put("name", sVO.getName());
	jsonObj.put("age", sVO.getAge());
	jsonObj.put("email", sVO.getEmail());
	jsonObj.put("input_date", sVO.getInput_date());
	
	jsonArr.add(jsonObj);
}//end for

	pageContext.setAttribute("jsonArr", jsonArr);

}catch(SQLException se) {
	se.printStackTrace();

}



%>
${jsonArr }
