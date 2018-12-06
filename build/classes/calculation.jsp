<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><% request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String id = request.getParameter("id");
	String att = request.getParameter("att");
		out.print(type + ":" + id + ":" + att + " 보정값 계산내용"); %></title>
</head>
<body>
	<h1><% out.print(type + ":" + id + ":" + att + " 보정값 계산내용"); %></h1><br>
		
	<%
		if(type.equals("용사")){
			
		} else if(type.equals("마물군단")){
			
		} else{ // 예외처리
			
		}
	%>
		
	<br>
</body>
</html>