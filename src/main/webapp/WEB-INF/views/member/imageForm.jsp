<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		if(${not empty msgType}) {
			if(${msgType eq "실패 메세지"}) {
				$("#checkType").attr("class", "modal-content panel-warning");
			}
			$("#myModal").modal("show");
		}
	})
</script>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"></jsp:include>
	  <h2>Spring MVC03</h2>
	  	<div class="panel panel-default">
	  		<div class="panel-heading">이미지 등록</div>
	  		<div class="panel-body">
	  			<form action="${contextPath}/imageUpload.do" method="post" enctype="multipart/form-data">
	  				
	  				<input type="hidden" name="memID" value="${mvo.memID}">
	  				<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">아이디</td>
	  						<td>${mvo.memID}</td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">사진업로드</td>
	  						<td><input type="file" name="memProfile"></td>
	  					</tr>
	  					<tr>
	  						<td colspan="3">
	  							<span id="passMessage"></span>
	  							<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록">
	  						</td>
	  					</tr>
	  				</table>
	  			</form>
	  		</div>
	  		<div class="panel-footer">패널 푸터</div>		
	  	</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="checkType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${msgType}</h4>
        </div>
        <div class="modal-body">
          <p id="checkMessage">${msg}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
</html>	
	
</body>
</html>