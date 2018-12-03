<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>용사 정보 입력</title>

</head>
<%
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>용사 정보 입력</h1>
	<form method="POST" action="signup_action.jsp" id="administrate">
		용사 ID : <input type="text" name="id"><br>
		Password : <input type="password" name="pw"><br>
		이름 : <input type="text" name="name"><br>
		나이 : <input type="number" name="age"><br>
		출생지 : <input type="text" name="birthPlace"><br>
		공격력 : <input type="number" name="attack"><br>
		방어력 : <input type="number" name="defense"><br>
		체력 : <input type="number" name="hp"><br>
		마력 : <input type="number" name="mp"><br>
		힘 : <input type="number" name="power"><br>
		지능 : <input type="number" name="intel"><br>
		
		스킬 : <select name="skill" form="administrate">
		<%
		rs = stmt.executeQuery("SELECT 스킬이름 FROM 스킬"
				+ " WHERE 스킬이름 NOT IN (SELECT 스킬이름 FROM"
				+ " 스킬 NATURAL JOIN 용사 WHERE 스킬이름=스킬)");
		while(rs.next()){
				out.print("<option value=\"" + rs.getString("스킬이름")
				 + "\">" + rs.getString("스킬이름") + "</option>");
			}
		%>	
		</select><br>
		종족 : <select name="tribe" form="administrate">
		<%
			rs = stmt.executeQuery("SELECT 종족명 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족명")
				 + "\">" + rs.getString("종족명") + "</option>");
			}
		%>	
		</select><br>
		<br>
		<input type="submit" value="Sign Up">
		<%
		rs.close();
		stmt.close();
		dbCon.getCon().close();
		
		%>
	</form>
</body>
</html>