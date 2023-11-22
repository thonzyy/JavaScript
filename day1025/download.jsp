<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/octet-stream"
    pageEncoding="UTF-8"%>
    <%@ page info="다운로드" %>
  

  
 <%
 String fileName=request.getParameter("file_name");
 
 if(fileName==null) {
	 response.sendRedirect("../day1024/file_list.jsp");
	 return;
 }//end if
 //한글 파일명을 처리하기 위해
 fileName = new String(fileName.getBytes("UTF-8"),"8859_1");
 
 //2. 응답 헤더 변경
 response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
 
 //3. 다운로드할 파일의 정보 얻기
 fileName = new String(fileName.getBytes("8859_1"),"UTF-8");
 
 File downFile=new File("E:/dev/Workspace/jsp_prj/src/main/webapp/upload/"+fileName);

 
 //4. 다운로드 할 파일에 Stream연결
 	FileInputStream fis = new FileInputStream(downFile.getAbsolutePath());
 //5. HTML을 응답하기 위한 Stream을 초기화
 out.clear();
 //6.초기화된 스트림을 재설정 (HTML응답 -> FILE응답)
 out =pageContext.pushBody();
 //7. 출력 스트림 얻기
 OutputStream os=response.getOutputStream() ;
 
 //8. 파일의 내용을 읽어들여 출력
 byte[] temp=new byte[512];
 int readSize=0;
 
 while( (readSize=fis.read(temp)) != -1) {
	 //9.파일을 스트림에 기록
	 os.write(temp,0,readSize);
 
 }//end while
//10. 분출 
	 os.flush();
 %>