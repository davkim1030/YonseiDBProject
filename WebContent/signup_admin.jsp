<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>관리자 등록</title>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>관리자 정보 입력</h1>
	<form method="POST" action="signup_action.jsp" id="administrate">
		ID : <input type="text" name="id"><br>
		PASSWORD : <input type="password" name="pw"><br>
		<input type="hidden" name="type" value="admin">
		<input type="submit" class="btn btn-primary" value="등록">
	</form>
</body>
</html>