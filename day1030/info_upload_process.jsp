<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    File uploadDir = new File("E:/dev/Workspace/jsp_prj/src/main/webapp/upload");
    int maxSize=1024*1024*30;
    MultipartRequest mr = new MultipartRequest(request , uploadDir.getAbsolutePath(), maxSize,"UTF-8",new DefaultFileRenamePolicy());
    String fileName=mr.getFilesystemName("reviewImg");
    File uploadFile= new File(uploadDir.getAbsoluteFile()+"/"+fileName);
    boolean flag=false;
    int blockSize=1024*1024*5;
    if(uploadFile.length() > blockSize){
    	uploadFile.delete();
    	flag=true;
    }//end if 
    
    String id=mr.getParameter("id");
    JSONObject json = new JSONObject();
    json.put("uploadFlag", !flag);
    json.put("fileName", fileName);
    json.put("id",id);
    
    
    out.print(json.toJSONString());
    %>
    
    