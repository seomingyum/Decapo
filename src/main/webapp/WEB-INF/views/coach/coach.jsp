<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.spring.entity.Coach"%>
<%@ page import = "java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<!-- 부스스트랩 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
  .modal-header, h4, .close {
    background-color: #5cb85c;
    color: white;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
  </style>

    
    <!-- iamport.payment.js -->
    <script
      type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    
    <script>
      var IMP = window.IMP;
      IMP.init("imp17858560");
 
      function requestPay() {
        IMP.request_pay(
          {
            pg: "T5102001",
            pay_method: "card",
            merchant_uid: "57008833-33004",
            name: "코치1",
            amount: 15000,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
        	  if(rsp.success) {
        		  console.log("성공");
        	  } else {
        		  alert("실패")
        		  console.log("실패");
        	  }
            // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
          }
        );
      }
      
      
      
      // 모달창 띄우기 + 모달창 안에 데이터 뿌리기
      function goModal(coachIdx) {
    		
    	  	// 모달창 띄우기
    	 	$("#myModal").modal();
    	  
    		let fData = {"coachIdx" : coachIdx};
    		
    		// 비동기통신 시작(모달창 안에 데이터 뿌리기)
    		$.ajax({
    			url : "coachModal/"+coachIdx,
    			data : fData,
    			method : "get",
    			dataType : "json",
    			success : function(data) {
    				$("#modalNmae").text(data.name);
    				$("#modalCareer").text(data.career);
    				$("#modalRegion").text(data.region);
    				$("#modalImg").empty();
    				$("#modalImg").append("<img src='${contextPath}/resources/images/coachPicture/"+ data.img +".jpg'>");
    			},
    			erro : function(){ alert("error") }
    		});
    	}
      
    </script>
<body> 
    
<div>
	<h2>코치 데이터 검색</h2>
</div>
<div>
<form action="${contextPath}/regionSerch.do" method="post">
	<select name="region">
		<option value="서초구">서초구</option>
		<option value="중구">중구</option>
		<option value="강남구">강남구</option>
		<option value="용산구">용산구</option>
		<option value="서구">서구</option>
		<option value="북구">북구</option>
	</select>
	<input type="submit" value="검색">
</form>
</div>

<div>
	<h2>코치 데이터 불러오기</h2>
</div>    
<table>
<% ArrayList<Coach> list = (ArrayList<Coach>)request.getAttribute("list");%>
	<!-- 반복문을 통해서 코치 출력하기 -->
	<c:forEach var="vo" items="${ list }" varStatus="i">
		<tr>
	    	<td>${ vo.coachIdx }</td>
	    	<td>${ vo.name }</td> 
	    	<td>${ vo.region }</td>
	    	<td>${ vo.career }</td>
	    	<td><img id="coachPicture" alt="" src="${contextPath}/resources/images/coachPicture/${ vo.img }.jpg"></td>
	    	<td><input onclick="goModal(${vo.coachIdx})"id="myBtn" type="button" value="선택하기"></td>
	     </tr>
	</c:forEach>
</table>


  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>코치</h4>
        </div>
        
        <div id="modalNmae" class="modal-body" style="padding:40px 50px;">
        </div>
        	      
        <div id="modalCareer" class="modal-body" style="padding:40px 50px;">
        </div>
        
        <div id="modalImg" class="modal-body" style="padding:40px 50px;">
        </div>
        
        
        <div>
        	<button onclick="requestPay()" type="button" class="btn btn-success btn-block">결제하기</button>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
      
    </div>
  </div> 
</div>











    
   
</body>
</html>