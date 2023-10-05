<%@page import="day1004.TestVO"%>
<%@page import="day1004.TestDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
td{text-align:center; font-weight:bold}
td:hover{background-color:#E6E6E6; cursor:pointer;}
#numTitle{width:80px}
#imgTitle{width:120px}
#infoTitle{width:300px}
</style>
<script type="text/javascript">
$(function(){

});//ready

function result(val){
	alert(val);
}

function getValue(val){
	var output="";
	
	output +=val;
	 $("#div").html('���: '+output);
}
</script>

</head>
<body>
<%
//scriptlet: method ���� java code�� ������ �� ���
String msg="������";
%>
<mark><%= msg %></mark>
<%
msg="�̹��ִ� ��Ʋ�� ��......";
%>
<div>
<marquee scrollamount="25"><%= msg %></marquee>
</div>
<%
for(int i=0; i<7; i++){
%>
<h<%= i %>>�ȳ��ϼ���</h<%= i %>>
<%   
}//end for
%>
<!-- 1~100���� �ɼ��� ������ �ִ� select ��� -->

<%
//Java���� �����ϴ� ��ü�� ��� ����� �� �ִ�.
Calendar cal = Calendar.getInstance();
int nowYear = cal.get(Calendar.YEAR);
      
int nowMonth = cal.get(Calendar.MONTH)+1;

int lastDate = cal.getActualMaximum(Calendar.DATE)+1;

int nowdate = cal.get(Calendar.DAY_OF_MONTH);

%>

<select>
<option>---��---</option>
<%for(int i=-2; i<3; i++){%>
<%if(i==0){%>
<option selected=selected><%=nowYear+i %></option>
<%}else{%>
<option><%=nowYear+i %></option>
<%}%>
<%}%>
</select>

<select>
<option>---��---</option>
<%for(int i=1; i<13; i++){ %>
<option<%= i==nowMonth?" selected='selected'":"" %>><%=i %></option>
<% } %>
</select>

<select>
<option>---��---</option>
<%for(int i=1; i<lastDate; i++){ %>
<option<%=i==nowdate?" selected='selected'":"" %>><%=i %></option>
<% } %>
</select>
<div style="width:800px">
<div id="div" style="height:30px"></div>



<table class="table table-bordered border-primary">

<%for(int i =2 ; i<10; i++){%>
	<tr>
	<%for(int j=1 ; j<10; j++) {%>
	<td onclick="result('<%=i*j %>'),getValue('<%=i%> x <%=j%> = <%=i*j %>')"><%=i%>x<%=j%></td>
<%} %>	
</tr>
<%} %>	


</table>
</div>
<div>
<table class="table table-hover">
<thead>
<tr>
	<th id="numTitle">��ȣ</th>
	<th id="imgTitle">�̹���</th>
	<th id="infoTitle">����</th>
</tr>

</thead>
<tbody>
<!-- selectURL() method�� ȣ���Ͽ� ��ȣ,�̹���,����
	�̹����� Ŭ���ϸ� �ش� site�� �̵��ϵ��� link ���� -->
	<% TestDAO tDAO= new TestDAO();
		List<TestVO> list= tDAO.selectURL();
		TestVO tVO=null;
		for(int i =0; i<list.size();i++){
		tVO=list.get(i);
		%> 
	
	<tr>
	<td><%=i+1 %></td>
	<td><a href="http://<%=tVO.getUrl() %>">
	<img src="http://localhost/jsp_prj/common/images/<%=tVO.getImg()%>"
	style="width:80px; height:50px"/></a></td>
	<td><%= tVO.getInfo() %></td>
	</tr>
<%} %>
	
</tbody>
</table>
</div>
</body>
</html>
