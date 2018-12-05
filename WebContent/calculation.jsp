<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><% request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("type")
		+ ":" + request.getParameter("id")
		+ ":" + request.getParameter("att") + " 보정값 계산내용"); %></title>
</head>
<body>
	<h1><% request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("type")
		+ ":" + request.getParameter("id")
		+ ":" + request.getParameter("att") + " 보정값 계산내용");%></h1>
		
	<br>
</body>
</html>