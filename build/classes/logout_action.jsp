<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbPackage.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃중...</title>
</head>
<body>

<%
	session.invalidate();
	response.sendRedirect("main.jsp");
%>
</body>
</html>