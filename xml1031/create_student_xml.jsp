<%@page import="java.io.FileOutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="kr.co.sist.member.vo.StudentVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.dao.StuDAO"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" trimDirectiveWhitespaces="true"%>
 <% 
 //1. 문서 객체 생성
 Document doc = new Document();
 //2. 최상위 부모 노드 생성
 Element studentsNode = new Element("students");
 StuDAO sDAO = StuDAO.getInstance();
 boolean errFlag= false;
 List<StudentVO> list=null;
 File file = new File("E:/dev/Workspace/jsp_prj/src/main/java/xml1031/student.xml");
 try{
	 
 list = sDAO.selectAllStudent();
	 Element dataSizeNode = new Element("dataSize");
	 dataSizeNode.setText(String.valueOf(list.size()));
	 studentsNode.addContent(dataSizeNode);
	 
 }catch(SQLException se) {
	 errFlag=true;
	 se.printStackTrace();
 }//end catch
 
 Element requestUrlNode = new Element("requestURL");
 requestUrlNode.setText("http://localhost/jsp_prj/xml1031/"+file.getName() );
 studentsNode.addContent(requestUrlNode);
 //3. 자식 노드을 생성
 Element errFlagNode = new Element("isErrFlag");
 errFlagNode.setText(String.valueOf(errFlag));
 studentsNode.addContent(errFlagNode);
 
 
 if(!errFlag) {
	 Element studentNode = null;
	 Element numNode = null;
	 Element nameNode = null;
	 Element ageNode = null;
	 Element emailNode = null;
	 Element input_dateNode = null;
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd EEEE");
	 
	 
	 for(StudentVO sVO : list){
		 studentNode= new Element("student");
		 numNode= new Element("num");
		 numNode.setText(String.valueOf(sVO.getNum()));
		 
		 nameNode= new Element("name");
		 nameNode.setText(sVO.getName());
		 
		 ageNode= new Element("age");
		 ageNode.setText(String.valueOf(sVO.getAge()));
		 
		 
		 emailNode= new Element("age");
		 emailNode.setText(sVO.getEmail());
		 
		 input_dateNode= new Element("input_date");
		 input_dateNode.setText(sdf.format(sVO.getInput_date()));
		 
		 studentNode.addContent(numNode);
		 studentNode.addContent(nameNode);
		 studentNode.addContent(ageNode);
		 studentNode.addContent(emailNode);
		 
		 studentsNode.addContent(studentNode);
		 
	 }//end for
 }//end if
 	
 
 //4.
 //5.
 doc.setRootElement(studentsNode);
 //6.
 XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
 xOut.output(doc, out);

 FileOutputStream fos = new FileOutputStream(file);
 xOut.output(doc, fos);
 //7.
 
 
 %>