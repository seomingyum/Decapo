<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- jQuery -->
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
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
            name: "당근 10kg",
            amount: 1004,
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
    </script>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
  </head>
  <body>
    <button onclick="requestPay()">결제하기</button>
    <!-- 결제하기 버튼 생성 -->
  </body>
</html>