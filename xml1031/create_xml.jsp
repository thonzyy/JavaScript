<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info=""  trimDirectiveWhitespaces="true"%>
    <%

  //1. XML문서객체 생성
  		Document doc =new Document();
  		//2. 최상위 부모 노드 생성
  		Element rootNode= new Element("root");
  		//3. 자식노드를 생성
  		Element subNode = new Element("msg");
  		Element subNode2 = new Element("name");
  		// 자식 노드의 값을 설정
  		subNode.setText("오늘은 화요일입니다.");
  		subNode2.setText("이동원");
  		
  		//4. 부모노드에 자식노드를 배치
  		rootNode.addContent(subNode);
  		rootNode.addContent(subNode2);
  		//5. 부모 노드를 문서노드의 배치
  		doc.setRootElement(rootNode);
  		//6. 부모노드를 가진 문서노드를 출력
  		try{
  		XMLOutputter xOut= new XMLOutputter(Format.getPrettyFormat());
  		xOut.output(doc, out); // out 내장객체를 사용하여 웹 브라우저로 출력한다.0
  			
  		}catch(IOException ie){
  			out.println("메둉!!!");
  		}
    %>
