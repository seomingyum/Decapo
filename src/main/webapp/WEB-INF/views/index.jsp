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
<script type="text/javascript">
	$(document).ready(function(){
		if(${not empty msgType}) {
			if(${msgType eq "성공 메세지"}) {
				$("#checkType").attr("class", "modal-content panel-success");
			}
			$("#myModal").modal("show");
		}
		
	});
</script>
</head>
<body>
	<jsp:include page="common/header.jsp"></jsp:include>
	<a href="${contextPath}/posture"><div>자세진단</div></a>
	<a href="${contextPath}/trainLog"><div>훈련일지</div></a>
	<a href="${contextPath}/coach"><div>코치매칭</div></a>	  

	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
</body>
</html>