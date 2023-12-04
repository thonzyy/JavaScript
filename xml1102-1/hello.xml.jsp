<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="java.util.Random"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="랜덤 인사를 응답하는 XML" %>
    <%
    String[] msgArr={"안녕하세요?","기분 좋은 하루 되세요!","오늘은 당신의 날이에요. i am 신뢰에요" , "피곤한 아침"};
    //jdom2 Parser를 사용한 XML 생성
    String name = request.getParameter("name");
    Document doc = new Document();
    Element rootNode = new Element("root");//최상위 부모노드 <root/>
    Element msgNode = new Element("msg");//<msg/>
    
    msgNode.setText(name+" 님 "+msgArr[new Random().nextInt(msgArr.length)]);
    rootNode.addContent(msgNode);
    doc.setRootElement(rootNode);
    
    XMLOutputter xOut= new XMLOutputter(Format.getPrettyFormat());
    xOut.output(doc, out);
    %>
   
