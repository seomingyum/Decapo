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
	function registerCheck() {
		let memID = $("#memID").val();
		
	 $.ajax({
			url : "${contextPath}/registerCheck.do",
			type : "get",
			data : {"memID" : memID},
			dataType : "json",
			success : function(data) {
				console.log(data);
				// 중복 유무 (data = 1 : 사용가능, data = 0 : 사용불가능)
				if(data == 1) {
					$("#checkMessage").text(memID + "은(는) 사용가능합니다.");
					$("#checkMessage").css("color", "blue");
					$("#checkType").attr("class", "modal-content panel-success");
					$("#titleMsg").text("성공 메세지");
				} else {
					$("#checkMessage").text(memID + "은(는) 사용 불가능합니다.");
					$("#checkMessage").css("color", "red");
					$("#checkType").attr("class", "modal-content panel-warning");
					$("#titleMsg").text("실패 메세지");
				}
				$("#myModal").modal("show");
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	function passwordCheck() {
		let memPassword1 = $("#memPassword1").val();
		let memPassword2 = $("#memPassword2").val();
		console.log(memPassword1+"/"+memPassword2);
		if(memPassword1 != memPassword2) {
			$("#passMessage").text("비밀번호가 서로 일치하지 않습니다.");
			$("#passMessage").css("color", "red");
		} else {
			$("#passMessage").text("");
			$("#memPassword").val(memPassword1);	
		}
	}
	
	$(document).ready(function(){
		if(${not empty msgType}) {
			
			if(${msgType eq "실패 메세지"}){
				$("#checkType").attr("class", "modal-content panel-warning");
			}
			$("#myModal").modal("show");
		}
	});
	
	
	
</script>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"></jsp:include>
	  <h2>Spring MVC03</h2>
	  	<div class="panel panel-default">
	  		<div class="panel-heading">회원가입</div>
	  		<div class="panel-body">
	  			<form action="${contextPath}/join.do" method="post">
	  			
	  				<input type="hidden" id="memPassword" name="memPassword" value="">
	  				
	  				<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">아이디</td>
	  						<td><input required="required" type="text" id="memID" name="memID" class="form-control" placeholder="아이디를 입력하세요." maxlength="20"></td>
	  						<td style="width: 110px;"><button onclick="registerCheck()" type="button" class="btn btn-sm btn-primary">아이디 중복확인</button></td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">비밀번호</td>
	  						<td colspan="2"><input required="required" onkeyup="passwordCheck()" id="memPassword1" type="password" name="memPassword1" class="form-control" placeholder="비밀번호를 입력하세요." maxlength="20"></td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">비밀번호 확인</td>
	  						<td colspan="2"><input required="required" onkeyup="passwordCheck()" id="memPassword2" type="password" name="memPassword2" class="form-control" placeholder="비밀번호를 확인하세요." maxlength="20"></td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">사용자 이름</td>
	  						<td colspan="2"><input required="required" type="text" name="memName" class="form-control" placeholder="이름을 입력하세요." maxlength="20"></td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">사용자 나이</td>
	  						<td colspan="2"><input required="required" type="number" name="memAge" class="form-control" placeholder="나이를 입력하세요." maxlength="20"></td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">성별</td>
	  						<td colspan="2">
								<div class="form-group" style="text-align: center; margin: 0 auto;"></div>
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="memGender" autocomplete="off" value="남자" checked="checked"/> 남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="memGender" autocomplete="off" value="여자" /> 여자
									</label>
								</div>	  						
	  						</td>
	  					</tr>
	  					<tr>
	  						<td style="width: 110; vertical-align: middle;">이메일</td>
	  						<td colspan="2"><input required="required" type="email" name="memEmail" class="form-control" placeholder="이메일을 입력하세요." maxlength="50"></td>
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
          <h4 id="titleMsg" class="modal-title">${msgType}</h4>
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