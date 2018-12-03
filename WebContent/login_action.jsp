<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 중...</title>
</head>
<body>
<%
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	LogInOut log = new LogInOut(dbCon.getCon(), stmt);
	
	request.setCharacterEncoding("UTF-8");
	String id, pw;
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	
	try{
		if(log.logIn(id, pw)){
			session.setAttribute("id", id);
			session.setAttribute("isLogin", "true");
		} else{
			session.setAttribute("isLogin","false");
			request.setAttribute("isLogin", "false");
		}
		response.sendRedirect("main.jsp");
	} catch(Exception e){
		out.print(e.toString());
	}
	
%>

</body>
</html>