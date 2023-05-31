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
<body>
	<!-- navbar-de- -->
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>     
	      </button>
	      <a class="navbar-brand" href="${contextPath}">나의 스프링 홈페이지</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="${contextPath}">Home</a></li>
	      </ul>
	      
	      <c:if test="${empty mvo}">
	      	<ul class="nav navbar-nav navbar-right">
	        	<li><a href="${contextPath}/joinForm.do"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
	        	<li><a href="${contextPath}/loginForm.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	      	</ul>
	      </c:if>
	      
	      <c:if test="${not empty mvo}">
	      	<ul class="nav navbar-nav navbar-right">
	      		<li>
	      			<c:if test="${mvo.memProfile ne ''}">
		      			<img alt="" src="${contextPath}/resources/upload/${mvo.memProfile}" class="img-circle" style="width: 50px; height: 50px;">
		      			${mvo.memName}님 반갑습니다.
		      		</c:if>
		      		<c:if test="${mvo.memProfile eq ''}">	
		      			<img alt="" src="${contextPath}/resources/images/기본.jpg" class="img-circle" style="width: 50px; height: 50px;">
		      			${mvo.memName}님 반갑습니다.
		      		</c:if>	
	      		</li>
	        	<li><a href="${contextPath}/updateForm.do"><span class="glyphicon glyphicon-wrench"></span>회원정보수정</a></li>
	        	<li><a href="${contextPath}/imageForm.do"><span class="glyphicon glyphicon-camera"></span>프로필사진등록</a></li>
	      		<li><a href="${contextPath}/logout.do"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
	      	</ul>
	      </c:if>
	      
	      
	    </div>
	  </div>
	</nav>
</body>
</html>