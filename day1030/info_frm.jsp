<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/servlet_prj/common/main/favicon.png">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
   $(function() {
      $("#btnImg").click(function(){
    	  if($("#profileImg").val()==""){
    		  alert("이미지를 선택해주세요.");
    		  return
    	  }//end if
    	  //1. 폼얻기
    	  var frm=$("#frm")[0];
    	  //2. AJAX로 전송할 폼 객체 생성
    	  var formData= new FormData(frm);
    	  
    	  
    	  $.ajax({
    		
    		  url:"info_upload_process.jsp" ,
    		  type: "post",
    		  processData:false,
    		  contentType:false,
    		  data: formData,
    		  async:false,
    		  dataType:"json",
    		  error:function(xhr) {
    			 $("#imgResult").html("이미지 업로드 실패");
    			 console.log(xhr.status);
    		  },
    		  success:function(jsonObj){
    			  var msg="이미지 업로드 실패";
    			  if(jsonObj.uploadFlag){
    				  msg=jsonObj.id+"님 이미지가 업로드 되었습니다.";
    			  }//end if
    			  
    			  $("#imgResult").html(msg);
    			  var img="<img src='http://localhost/jsp_prj/upload/"+jsonObj.fileName+"' style='width:100px'/>"
    			//  $("#output").html("<img src='"+$("#profileImg").val()+"' width='100px'/>")
    			  $("#output").html(img);
    			  //alert(jsonObj.uploadFlag+ "/ "+jsonObj.id)
    		  }//success
    	  })//ajax
      })//click
      //이미지 미리보기 
      $('#profileImg').change(function(){
    	  if($("#profileImg").val()==""){
    		  alert("이미지를 선택해주세요.");
    		  return;
    	  }//end if
    	  
    	  var file=event.target.files[0];
    	  var reader=new FileReader( );
    	  reader.onload=function(e){
    		  $("#previewProfile").attr("src",e.target.result);
    	  }
    	  
    	  reader.readAsDataURL(file);
      });//change
      
      $("#btnSubmit").click(function(){
    	 // alert('adasdasdasd');
    	  $("#frm").submit();
      })
      
   });//ready 
</script>
</head>
<body>
<form action="info_frm_process.jsp" method="post" id="frm" name="frm">
   프로필 이미지<input type="file" name="profileImg" id="profileImg" class="inputBox">
   <input type="button" value="이미지 업로드" class="btn btn-success" id="btnImg" >
   <span id="imgResult"></span>
   <br>
   
 <img id="previewProfile" src="../common/images/default.png" style="width:100px;"/>
   ID : <input type="text" name="id" id="id" class="inputBox" value="hong" readonly="readonly">
   이름 : <input type="text" name="name" id="name" class="inputBox">
   <input type="button" value="전송" id="btnSubmit" class="btn btn-warning">
</form>
</body>
</html>