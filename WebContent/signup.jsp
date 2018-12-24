<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title><%String type = request.getParameter("type"); out.print(type);%> 등록</title>

</head>
<%
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	request.setCharacterEncoding("UTF-8");
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1><%=type %> 정보 입력</h1>
	<form method="POST" action="signup_action.jsp" id="administrate">
	<table>
	<%
	if(type==null)
		response.sendRedirect("error.jsp");
	else if(type.equals("용사")){
	%>
		<tr><td>용사 ID</td><td><input type="text" name="id"></td></tr>
		<tr><td>Password</td><td><input type="password" name="pw"></td></tr>
		<tr><td>이름</td><td><input type="text" name="name"></td></tr>
		<tr><td>나이</td><td><input type="number" name="age"></td></tr>
		<tr><td>출생지</td><td><input type="text" name="birthPlace"></td></tr>
		<tr><td>공격력</td><td><input type="number" name="attack"></td></tr>
		<tr><td>방어력</td><td><input type="number" name="defense"></td></tr>
		<tr><td>체력</td><td><input type="number" name="hp"></td></tr>
		<tr><td>마력</td><td><input type="number" name="mp"></td></tr>
		<tr><td>힘</td><td><input type="number" name="power"></td></tr>
		<tr><td>지능</td><td><input type="number" name="intel"></td></tr>
		
		<tr><td>스킬</td><td><select name="skill" form="administrate">
		<%
		rs = stmt.executeQuery("SELECT 스킬이름 FROM 스킬"
				+ " WHERE 스킬이름 NOT IN (SELECT 스킬이름 FROM"
				+ " 스킬 NATURAL JOIN 용사 WHERE 스킬이름=스킬)");
		while(rs.next()){
				out.print("<option value=\"" + rs.getString("스킬이름")
				 + "\">" + rs.getString("스킬이름") + "</option>");
			}
		%>	
		</select></td></tr>
		<tr><td>종족</td><td><select name="tribe" form="administrate">
		<%
			rs = stmt.executeQuery("SELECT 종족 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족")
				 + "\">" + rs.getString("종족") + "</option>");
			}
		%>	
		</select></td></tr>
		
	<%
	} else if(type.equals("스킬") || type.equals("종족") || 
			type.equals("마물군단")) {
		rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
			out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>"
					+ "<td><input type=\"" + (i==1 ? "text" : "number") + "\" name=\"col"
					+ i + "\"></td></tr>");
		}
	} else if(type.equals("아이템")){
		rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount() - 1; i++){
			if(i!=2)
				out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>"
					+ "<td><input type=\"" + (i==1 ? "text" : "number") + "\" name=\"col"
					+ i + "\"></td></tr>");
			else
				out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>"
						+ "<td><select name=\"col" + i
						+ "\" form=\"administrate\">"
						+ "<option value=\"칼\">칼</option>"
						+ "<option value=\"창\">창</option>"
						+ "<option value=\"활\">활</option>"
						+ "<option value=\"갑옷\">갑옷</option>"
						+ "<option value=\"방패\">방패</option>"
						+ "</select></td></tr>");
		}
		out.print("<tr><td>용사ID</td><td><select name=\"col"
				+ rs.getMetaData().getColumnCount() +"\" form=\"administrate\">");
		
		rs = stmt.executeQuery("SELECT 용사ID FROM 용사 WHERE 용사ID NOT IN "
				+ " (SELECT 용사ID FROM 아이템) ORDER BY 용사ID ASC");
		while(rs.next()){
			out.print("<option value=\"" + rs.getString("용사ID") +"\">"
					+ rs.getString("용사ID") + "</option>");
		}
		out.print("</select></td></tr>");
	} else if(type.equals("지휘관")) {
		
	} else if(type.equals("마물장군")){
		rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
			
		for(int i = 1; i <= rs.getMetaData().getColumnCount() - 1; i++){
			out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>"
					+ "<td><input type=\"" + (i==1 ? "text" : "number") + "\" name=\"col"
					+ i + "\"></td></tr>");
		}
		out.print("<tr><td>천적종족</td><td><select name=\"col" + rs.getMetaData().getColumnCount()
				+ "\" form=\"administrate\">");
		
		rs = stmt.executeQuery("SELECT 종족 FROM 종족");
		while(rs.next()){
			out.print("<option value=\"" + rs.getString("종족")
			 + "\">" + rs.getString("종족") + "</option>");
		}
		out.print("</select></td></tr>");
	}
	%>
		</table>
		<br>
		
		<input type="hidden" name="type" value="<%= type %>">
		<input type="submit" value="등록">
	</form>
</body>
</html>