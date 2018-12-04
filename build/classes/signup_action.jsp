<%@page import="java.sql.*" %>
<%@page import="dbPackage.DBConnection" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Sign Up Result</title>
</head>
<body>
<%
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
%>

<%
	request.setCharacterEncoding("UTF-8");
	String id, pw, name, birthPlace, skill, tribe;
	int age, attack, defense, hp, mp, power, intel;
	
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	name = request.getParameter("name");
	age = Integer.parseInt(request.getParameter("age"));
	birthPlace = request.getParameter("birthPlace");
	attack = Integer.parseInt(request.getParameter("attack"));
	defense = Integer.parseInt(request.getParameter("defense"));
	hp = Integer.parseInt(request.getParameter("hp"));
	mp = Integer.parseInt(request.getParameter("mp"));
	power = Integer.parseInt(request.getParameter("power"));
	intel = Integer.parseInt(request.getParameter("intel"));
	skill = request.getParameter("skill");
	tribe = request.getParameter("tribe");
	
	
	
	try{
		stmt.execute("INSERT INTO 용사 VALUES('" + id + "', '"
				+ pw + "', '"
				+ name + "', "
				+ String.valueOf(age) + ", '"
				+ birthPlace + "', "
				+ String.valueOf(attack) + ", "
				+ String.valueOf(defense) + ", "
				+ String.valueOf(hp) + ", "
				+ String.valueOf(mp) + ", "
				+ String.valueOf(power) + ", "
				+ String.valueOf(intel) + ", '"
				+ skill + "', '"
				+ tribe + "')");
		stmt.execute("COMMIT");
	} catch(SQLException sqle){
		stmt.execute("INSERT INTO 용사 VALUES('" + id + "', '"
				+ pw + "', '"
				+ name + "', "
				+ String.valueOf(age) + ", '"
				+ birthPlace + "', "
				+ String.valueOf(attack) + ", "
				+ String.valueOf(defense) + ", "
				+ String.valueOf(hp) + ", "
				+ String.valueOf(mp) + ", "
				+ String.valueOf(power) + ", "
				+ String.valueOf(intel) + ", null"
				+ ", '"
				+ tribe + "')");
		stmt.execute("COMMIT");
	}
	out.print("ID : " + id +
			"<br>Password : " + pw + 
			"<br>이름 : " + name +
			"<br>나이 : " + String.valueOf(age) + 
			"<br>출생지 : " + birthPlace + 
			"<br>공격력 : " + String.valueOf(attack) + 
			"<br>방어력 : " + String.valueOf(defense) + 
			"<br>체력 : " + String.valueOf(hp) + 
			"<br>마력 : " + String.valueOf(mp) + 
			"<br>힘 : " + String.valueOf(power) + 
			"<br>지능 : " + String.valueOf(intel) + 
			"<br>스킬 : " + skill + 
			"<br>종족 : " + tribe);
	
	response.sendRedirect("search.jsp?type=용사");
	
%>

</body>
</html>