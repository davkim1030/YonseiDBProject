<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><% if(request.getParameter("type")==null) out.print("404");
		else out.print(request.getParameter("type"));%></title>
</head>
<body>
	<% if(request.getParameter("type")==null) response.sendError(404);
	else response.sendError(Integer.valueOf(request.getParameter("type"))); %>
</body>
</html>