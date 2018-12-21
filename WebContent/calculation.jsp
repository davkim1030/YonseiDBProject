<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
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
		out.print(type + " : " + id + " : " + att + " 보정값 계산내용"); %></title>
</head>
<body>
	<h1><% out.print(type + " : " + id + " : " + att + " 보정값 계산내용"); %></h1><br>
		
	<table>
	<%
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	
	int var1, var2, var3;
	if(type.equals("용사")){
		rs = stmt.executeQuery("SELECT " + att + " FROM 용사 WHERE 용사ID='" + id + "'");
		rs.next();
		var1 = rs.getInt(att);
		if(att.equals("체력") || att.equals("마력")){
			rs = stmt.executeQuery("SELECT 용사ID, " + att +
					"증가 FROM 용사 NATURAL JOIN 스킬 WHERE 용사ID='" + id +"'");
			if(rs.next())
				var2 = rs.getInt(att + "증가");
			else
				var2 = 0;
		} else if(att.equals("공격력") || att.equals("방어력")
					||att.equals("힘") ||att.equals("지능")) {
			rs = stmt.executeQuery("SELECT 용사ID, " + att +
					"증가 FROM 용사 NATURAL JOIN 아이템 WHERE 용사ID='" + id +"'");
			if(rs.next())
				var2 = rs.getInt(att + "증가");
			else
				var2 = 0;
		} else {
			// 예외처리 필요
			var2 = 0;
		}
		
		rs = stmt.executeQuery("SELECT 종족.*, 용사ID FROM 용사 NATURAL JOIN 종족 WHERE 용사ID='" + id + "'");
		rs.next();
		var3 = rs.getInt(att + "보정");
		
		out.print("<th>(" + att + "</th><th>+"
				+ "</th><th>증가값)</th><th>*"
				+ "</th><th>보정값</th><th>="
				+ "</th><th>결과값</th>");
		out.print("<tr><td>(" + var1 + "</td>"
				+ "<td>+</td><td>" + var2 + ")</td>"
				+ "<td>*</td><td>" + var3 + "</td><td>"
				+ "=</td><td>" + (var1+var2)*var3 + "</td>");
		
	} else if(type.equals("마물군단")){
		rs = stmt.executeQuery("SELECT " + att + " FROM 마물군단 WHERE 마물군단이름='" + id + "'");
		rs.next();
		var1 = rs.getInt(att);
		
		rs = stmt.executeQuery("SELECT 마물군단.*, 마물장군.* "
				+ " FROM 마물군단, 마물장군, 지휘관"
				+ " WHERE 마물군단.마물군단이름='" + id + "'"
				+ " AND 마물장군.마물장군이름 = 지휘관.마물장군이름"
				+ " AND 마물군단.마물군단이름 = 지휘관.마물군단이름");

		out.print(var1);
		while(rs.next()){
			if(att.equals("총공격력")){
				out.print(" * " + rs.getInt("군단공격력보정"));
				var1 *= rs.getInt("군단공격력보정");
			} else if(att.equals("총방어력")){
				out.print(" * " + rs.getInt("군단방어력보정"));
				var1 *= rs.getInt("군단방어력보정");
			} else {
				out.print(" * " + rs.getInt("군단" + att + "보정"));
				var1 *= rs.getInt("군단" + att + "보정");
			}
		}
		out.print(" = " + var1);
		
	} else{ // 예외처리
		
	}
	%>
	</table>
		
	<br>
</body>
</html>