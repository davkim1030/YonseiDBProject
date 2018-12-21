<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title><% request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
		out.print(type + " 데이터 통계"); %></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	request.setCharacterEncoding("UTF-8");
	out.print("<h1>" + type + " 데이터 통계</h1>");
	
	%> <table border="1">
	<th>종류</th><th>값</th> <%
	if(type.equals("용사")){
		
		rs = stmt.executeQuery("SELECT count(password) AS 총인원수, sum(나이) AS 나이총합, "
				+ " sum((공격력 + 공격력증가) * 공격력보정) AS 총공격력, sum((방어력 + 방어력증가) * 방어력보정) AS 총방어력, "
				+ " sum((체력 + 체력증가) * 체력보정) AS 총체력, sum((마력 + 마력증가) * 마력보정) AS 총체력, "
				+ " sum((힘 + 힘증가) * 힘보정) AS 총힘, sum((지능 + 지능증가) * 지능보정) AS 총지능 "
				+ " FROM 용사 NATURAL JOIN 아이템, 스킬, 종족");
		rs.next();
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
			out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>");
			out.print("<td>" + rs.getInt(rs.getMetaData().getColumnName(i)) + "</td></tr>");
		}
	} else if(type.equals("마물군단")) {
		
	} else { // 예외처리 필요
		response.sendRedirect("error.jsp?type=404");
	}

		stmt.close();
		dbCon.getCon().close();
	%>
	</table>
	
</body>
</html>