<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.member.vo.BoardUtilVO"%>
<%@page import="kr.co.sist.member.dao.BoardDAO"%>
<%@page import="kr.co.sist.member.vo.BoardRangeVO"%>
<%@page import="kr.co.sist.member.vo.WebMemberVO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.member.vo.WebMemberVO"%>
<%@page import="kr.co.sist.member.vo.BoardRangeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="회원리스트" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty sesId }">
   <c:redirect url="login_frm.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   $("#btn").click(function() {
      $("#frm").submit();
   });
   
   $("#btnSearch").click(function() {
      chkNull();
   });
   
   $("#keyword").keyup(function(evt) {
      if(evt.which == 13) {
         chkNull();
      }
   });
});//ready

function memberDetail(id) {
   $("#id").val(id);
   $("#hidFrm").submit();
}

function chkNull() {
   var keyword = $("#keyword").val();
   if(keyword.trim() == "") {
      alert("검색 키워드를 입력해주세요.");
   }
   
   $("#frmSearch").submit();
}
</script>

</head>
<body>
<%
BoardDAO bDAO= BoardDAO.getInstance();
BoardRangeVO brVO = new BoardRangeVO();
//페이지가 최초 호출 시에는 field나 key가 없다. 검색을 하지 않는 경우에도 값이 없다.
String field=request.getParameter("field");
String keyword=request.getParameter("keyword");
brVO.setField(request.getParameter("field"));
brVO.setKeyword(request.getParameter("keyword"));



//1. 총 레코드의 수 
int totalCount=bDAO.totalCount(brVO);
//2. 한 화면에 보여줄 게시물의 수
int pageScale=10;
//3. 총 페이지 수 
int totalPage=0;

totalPage=(int)Math.ceil(totalCount/(double)pageScale);// 올림(정수 / 실수 )
//딱 떨어지지 않는 경우 1 장 더 추가
//totalPage= totalCount/pageScale;

//if(totalCount%pageScale !=0) {
   //totalPage++;
//}

//현재 페이지의 시작 번호를 구하기
String tempPage = request.getParameter("currentPage");
int currentPage = 1;
if(tempPage!=null) {
   currentPage = Integer.parseInt(tempPage);
}//end ifs
//시작 페이지 구하기 
int startNum = currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);
//끝 페이지 구하기
int endNum = startNum+pageScale-1;

//Dynamic Query에 의해서 구해진 시작번호와 끝번호에 VO를 넣는다.

brVO.setStartNum(startNum);
brVO.setEndNum(endNum);
%>

총 레코드의 수: <%= totalCount %><br>
한 화면에 보여줄 게시물의 수 : <%=pageScale %>건<br>
총 페이지 수  : <%=totalPage %>장<br>
현재 페이지 번호 : <%=currentPage %><br>
시작 번호 : <%=startNum %><br>
끝페이지 번호 : <%=endNum%><br>

<%

   try{
      List<WebMemberVO> list = bDAO.selectMember(brVO);

      String id = (String)session.getAttribute("sesId");
      if("1".equals(request.getParameter("dataFlag"))){
         if("tuna".equals(id)) { //관리자 권한 있음
            DataDecrypt dd = new DataDecrypt("a12345678901234567");
              for(int i = 0; i < list.size(); i++) {
                 list.get(i).setName(dd.decryption(list.get(i).getName()));
                 list.get(i).setCell(dd.decryption(list.get(i).getCell()));
                 list.get(i).setEmail(dd.decryption(list.get(i).getEmail()));
              }
         }
         if("hyo".equals(id)) {
            %>
            <script type="text/javascript">
               alert("해당 계정은 관한이 없습니다.");
            </script>
            <%
         }
      }
      
      pageContext.setAttribute("memberList", list);
      
   }catch (SQLException se) {
      se.printStackTrace();
   }//end catch
   

%>
<div>
<form method="post" id="frm">
<input type="button" value="데이터 보기" class="btn btn-warning" id="btn">
<input type="hidden" name="dataFlag" value="1">
</form>
<form id="hidFrm" method="post" action="../day1020/member_detail.jsp" >
<input type="hidden" name="id" id="id">
</form>
<a href="member_list.jsp?dataFlag=1" class="btn btn-warning">전체보기</a>
<table class="table table-striped">
<thead>
<tr>
<th style="width:80px">#</th>
<th style="width:150px">아이디</th>
<th style="width:150px">이름</th>
<th style="width:120px">생년월일</th>
<th style="width:180px">전화번호</th>
<th style="width:300px">이메일</th>
<th style="width:80px">성별</th>
<th style="width:180px"></th>

</tr>
</thead>

<tbody>

<c:if test="${empty memberList }">
<tr>
   <td colspan="8" style="text-align: center;">회원정보가 없습니다.</td>
</tr>
</c:if>
<c:forEach var="member" items="${memberList}" varStatus="i">
<tr>
   <td><c:out value="${startNum + i.index}"/></td>
   <td><c:out value="${member.id}"/></td>
   <td><a href="#void" onclick="memberDetail('${member.id}')"><c:out value="${member.name}"/></a></td>
   <td><c:out value="${member.birthday}"/></td>
   <td><c:out value="${member.cell}"/></td>
   <td><c:out value="${member.email}"/></td>
   <td><c:out value="${member.gender == 1?'남자':'여자'}"/></td>
   <td><fmt:formatDate value="${member.inputDate}" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div style="text-align: center;">
<form name="frmSearch" id="frmSearch" action="member_list.jsp" method="get">
<select name="field">
   <option value="1" ${param.field eq '1'? "selected='selected'":"" }>아이디</option>
   <option value="2" ${param.field eq '2'? "selected='selected'":"" }>주소</option>
   <option value="3" ${param.field eq '3'? "selected='selected'":"" }>소개</option>
</select>
<input type="text" name="keyword" class="inputBox" id="keyword" value="${param.keyword ne 'null'? param.keyword : '' }"/>
<input type="text" style="display: none;">
<input type="hidden" name="dataFlag" value="1">
<input type="button" value="btnSearch" class="btn btn-info" id="btnSearch">
</form>
</div>
<div style="text-align: center">
<%-- <%for(int i=1;i<totalPage+1;i++) { %>
   [<a href="member_list.jsp?currentPage=<%=i %>&dataFlag=1&keyword=${param.keyword}&field=${param.field}"><%=i %></a>]
<%} %> --%>
<%String dataFlag=request.getParameter("dataFlag");
BoardUtilVO buVO= new BoardUtilVO("member_list.jsp"
		, dataFlag ,keyword,field,currentPage,totalPage);
		
out.println(BoardUtil.getInstance().pageNation(buVO));
		%>
<%-- <%

//화면에 보여줄 페이지 인덱스 수
int pageNumber=3;


//2. 화면에 보여줄 시작페이지 번호 
int startPage=((currentPage-1)/pageNumber)*pageNumber+1;

//out.println("시작번호"+startPage);


//3.화면에 보여줄 마지막 페이지 번호 
int endPage  =(((startPage-1)+pageNumber)/pageNumber)*pageNumber;

//out.println("끝번호"+endPage);


//4. 구해진 끝 페이지의 끝 번호가 총 페이지보다 작다면 총 페이지수가 끝 페이지 번호가 된다.
if (totalPage<=endPage) {
	endPage=totalPage;
}//end if


//5. 첫 페이지가 인덱스 화면이 아닌 경우
int movePage=0;
String pervLink="[<<]";
if (currentPage>pageNumber){ //시작 페이지보다 1적은 페이지로 이동
	movePage=startPage-1;
	%>
		[<a href="member_list.jsp?currentPage=<%=movePage %>&dataFlag=1&keyword=${param.keyword}&field=${param.field}">&lt;&lt;</a>] ...
	
	<% 
 

}else{


	%>
[&lt;&lt;]
<%
}

//7. 시작 번호부터 끝 번호 까지 반복 시킨다.
movePage=startPage;
while(movePage<=endPage) {
	if(movePage==currentPage) {//현재 페이지와 이동할 페이지가 같다면 링크 없이 인덱스 리스트를 제공
		%>
		[<span style="font-size: 25px"> <%=movePage %></span>]
		 <%
	}else{
		%>
		[<a href="member_list.jsp?currentPage=<%=movePage%>&dataFlag=1&keyword=${param.keyword}&field=${param.field}"><%=movePage %></a>]
		<%
	}//end else
	movePage++;
}//end while
	
	//8. 뒤에 페이지가 더 있는 경우
	if(totalPage>endPage) {
		movePage = endPage+1;
		%>
		...[<a href="member_list.jsp?currentPage=<%=movePage %>&dataFlag=1&keyword=${param.keyword}&field=${param.field}">&gt;&gt;</a>]
		 <%
	}else {
		out.println("[>>]");
	}


%>  --%>
</div>
</body>
</html>