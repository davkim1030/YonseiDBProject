<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
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
	PwdEncryption pe = new PwdEncryption();
%>

<%
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("type").equals("admin"))
		if(session.getAttribute("id")!=null){
			String id, pw;
			id = request.getParameter("id");
			pw = request.getParameter("pw");
			try{
				stmt.execute("INSERT INTO 관리자 VALUES('"
						+ id + "', '"
						+ pe.encrypt(pw) + "')");
			} catch(Exception e){
				e.printStackTrace();
			}
			response.sendRedirect("search.jsp?type=" + URLEncoder.encode("관리자", "UTF-8") + "&page=1");
		} else
			response.sendRedirect("error.jsp?type=403");
	else{

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
					+ pe.encrypt(pw) + "', '"
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
					+ pe.encrypt(pw) + "', '"
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
		
		response.sendRedirect("search.jsp?type=용사&page=1");
		
	}
%>

</body>
</html>