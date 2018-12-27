<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>관리자 등록</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div class="row">
	<div class="col-xl-1"></div>
	<div class="col-xl-10">
		<h1>관리자 정보 입력</h1>
		<form class="form-group" method="POST" action="signup_action.jsp" id="administrate">
			<div class="input-group mb-3">
	    	  	<div class="input-group-prepend">
	      		  <span class="input-group-text">ID</span>
	      		</div>
		      	<input type="text" class="form-control" id="id" name="id">
   			</div>
   			<div class="input-group mb-3">
	    	  	<div class="input-group-prepend">
	      		  <span class="input-group-text">PASSWORD</span>
	      		</div>
		      	<input type="password" class="form-control" id="pw" name="pw">
   			</div>
			<input type="hidden" name="type" value="admin">
			<input type="submit" class="btn btn-primary" value="등록">
		</form>
	</div>
	<div class="col-xl-1"></div>
	</div>
</body>
</html>