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
		
		rs = stmt.executeQuery("SELECT count(용사ID) AS 총인원수, sum(나이) AS 나이총합, "
				+ " sum(공격력) AS 총공격력, sum(방어력) AS 총방어력, "
				+ " sum(체력) AS 총체력, sum(마력) AS 총마력, "
				+ " sum(힘) AS 총힘, sum(지능) AS 총지능 "
				+ " FROM 용사");
		rs.next();
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
			out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>");
			out.print("<td>" + rs.getInt(rs.getMetaData().getColumnName(i)) + "</td></tr>");
		}
	} else if(type.equals("마물군단")) {
		rs = stmt.executeQuery("SELECT count(마물군단이름) AS 총군단수, sum(병력수) AS 총병력수, "
				+ " sum(총공격력 * 군단공격력보정) AS 총군단공격력, sum(총방어력 * 군단방어력보정) AS 총군단방어력, "
				+ " sum(이동력 * 군단이동력보정) AS 총군단이동력, sum(사기 * 군단사기보정) AS 총군단사기 "
				+ " FROM 마물군단 NATURAL JOIN 지휘관, 마물장군");
		rs.next();
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
			out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>");
			out.print("<td>" + rs.getInt(rs.getMetaData().getColumnName(i)) + "</td></tr>");
		}
	} else { // 예외처리 필요
		response.sendRedirect("error.jsp?type=404");
	}

		stmt.close();
		dbCon.getCon().close();
	%>
	</table>
	
</body>
</html>