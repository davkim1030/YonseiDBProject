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
<link href="http://localhost:8080/YonseiDBProject/images/favicon.ico" rel="icon" type="image/x-icon" />
</head>
<body>
<%
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	PwdEncryption pe = new PwdEncryption();
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
%>

<%
	if(type.equals("admin"))
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
	else if(type.equals("용사")){

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
		skill = request.getParameter("skill")=="null" 
				? "" : "'" + request.getParameter("skill") +"'";
		tribe = request.getParameter("tribe")=="null"
				? "" : "'" + request.getParameter("tribe") +"'";
		
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
					+ String.valueOf(intel) + ", "
					+ skill + ", "
					+ tribe + ")");
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
					+ ", "
					+ tribe + ")");
			stmt.execute("COMMIT");
		}
		
	} else if(type.equals("스킬")){
		stmt.execute("INSERT INTO " + type + " VALUES('" + request.getParameter("col1")
				+ "', " + request.getParameter("col2")
				+ ", " + request.getParameter("col3") +")");
	} else if(type.equals("종족")) {
		stmt.execute("INSERT INTO " + type + " VALUES('" + request.getParameter("col1")
				+ "', " + request.getParameter("col2")
				+ ", " + request.getParameter("col3")
				+ ", " + request.getParameter("col4")
				+ ", " + request.getParameter("col5")
				+ ", " + request.getParameter("col6")
				+ ", " + request.getParameter("col7")+")");
	} else if(type.equals("아이템")) {
		stmt.execute("INSERT INTO " + type + " VALUES('" + request.getParameter("col1")
		+ "', '" + request.getParameter("col2")
		+ "', " + request.getParameter("col3")
		+ ", " + request.getParameter("col4")
		+ ", " + request.getParameter("col5")
		+ ", " + request.getParameter("col6")
		+ ", '" + request.getParameter("col7") +"')");
	} else if(type.equals("마물군단")) {
		stmt.execute("INSERT INTO " + type + " VALUES('" + request.getParameter("col1")
		+ "', " + request.getParameter("col2")
		+ ", " + request.getParameter("col3")
		+ ", " + request.getParameter("col4")
		+ ", " + request.getParameter("col5")
		+ ", " + request.getParameter("col6") +")");
	} else if(type.equals("마물장군")) {
		stmt.execute("INSERT INTO " + type + " VALUES('" + request.getParameter("col1")
		+ "', " + request.getParameter("col2")
		+ ", " + request.getParameter("col3")
		+ ", " + request.getParameter("col4")
		+ ", " + request.getParameter("col5")
		+ ", " + request.getParameter("col6")
		+ ", '" + request.getParameter("col7") +"')");
	} else if(type.equals("지휘관")){
		stmt.execute("INSERT INTO " + type + " VALUES('" + request.getParameter("col1")
		+ "', '" + request.getParameter("col2") +"')");
	}
	stmt.execute("COMMIT");
	
	if(!type.equals("지휘관"))
		response.sendRedirect("search.jsp?type=" + URLEncoder.encode(type, "UTF-8") + "&page=1");
	else
		response.sendRedirect("search.jsp?type=마물군단");
%>

</body>
</html>