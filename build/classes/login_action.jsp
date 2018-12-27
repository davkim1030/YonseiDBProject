<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 중...</title>
<link href="http://localhost:8080/YonseiDBProject/images/favicon.ico" rel="icon" type="image/x-icon" />
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
			response.sendRedirect("main.jsp");
		} else{
			%><script>alert("ID나 password가 틀렸습니다.");
			window.location.href = 'http://localhost:8080/YonseiDBProject/login.jsp';</script><%
			session.setAttribute("isLogin","false");
			request.setAttribute("isLogin", "false");
		}
	} catch(Exception e){
		out.print(e.toString());
	}
	
%>

</body>
</html>