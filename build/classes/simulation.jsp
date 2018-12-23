<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<% request.setCharacterEncoding("UTF-8"); %>
<title>모의 전투</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt(), stmt1 = dbCon.getCon().createStatement();
	ResultSet rs;
	request.setCharacterEncoding("UTF-8");
	%>
	<h1>모의 전투</h1>

	<form action="simul_result.jsp">
	<!--  테이블 헤더 추가 -->
	<h2>용사 목록</h2>
	<table border="1">
		<th>  </th>
		<th>용사ID</th>
		<th>이름</th>
		<th>보정공격력</th>
		<th>보정방어력</th>
		<th>보정체력</th>
		<th>보정마력</th>
		<th>보정힘</th>
		<th>보정지능</th>
		<th>종족</th>

	<%
	// 각 루프문마다 rs를 받아서 데이터 받기
	
	rs = stmt.executeQuery("SELECT 용사ID, 이름, 공격력, 방어력, 체력, 마력, 힘, 지능, 스킬, 종족 "
			+ " FROM 용사");

	for(int i = 0; rs.next(); i++){
		out.print("<tr>");
		ResultSet tmpData;
		int atk, def, hp, mp, pow, intel,
			atkInc = 0, defInc = 0, hpInc = 0, mpInc = 0, powInc = 0, intInc = 0,	
			atkCor = 1, defCor = 1, hpCor = 1, mpCor = 1, powCor = 1, intCor = 1;
		
		// 기본 능력치 가져오기
		atk = rs.getInt("공격력");
		def = rs.getInt("방어력");
		hp = rs.getInt("체력");
		mp = rs.getInt("마력");
		pow = rs.getInt("힘");
		intel = rs.getInt("지능");
		
		// 능력치 증가 가져오기
		tmpData = stmt1.executeQuery("SELECT * FROM 스킬 WHERE 스킬이름='" + rs.getString("스킬") +"'");
		if(tmpData.next()){
			hpInc = tmpData.getInt("체력증가");
			mpInc = tmpData.getInt("마력증가");			
		}
			
		tmpData = stmt1.executeQuery("SELECT * FROM 아이템 WHERE 용사ID='" + rs.getString("용사ID") + "'");
		if(tmpData.next()){
			atkInc = tmpData.getInt("공격력증가");
			defInc = tmpData.getInt("방어력증가");
			powInc = tmpData.getInt("힘증가");
			intInc = tmpData.getInt("지능증가");
		}
		
		// 능력치 보정 가져오기
		tmpData = stmt1.executeQuery("SELECT * FROM 종족 WHERE 종족='" + rs.getString("종족") + "'");
		if(tmpData.next()){
		atkCor = tmpData.getInt("공격력보정");
		defCor = tmpData.getInt("방어력보정");
		hpCor = tmpData.getInt("체력보정");
		mpCor = tmpData.getInt("마력보정");
		powCor = tmpData.getInt("힘보정");
		intCor = tmpData.getInt("지능보정");
		}
		
		// 테이블 그리기
		out.print("<td><input type=\"checkbox\" name=\"w" + i + "\" value=\"" + rs.getString("용사ID") + "\"></td>"
				+ "<td>" + rs.getString("용사ID") + "</td>"
				+ "<td>" + rs.getString("이름") + "</td>"
				+ "<td>" + String.valueOf((atk + atkInc) * atkCor) + "</td>"
				+ "<td>" + String.valueOf((def + defInc) * defCor) + "</td>"
				+ "<td>" + String.valueOf((hp + hpInc) * hpCor) + "</td>"
				+ "<td>" + String.valueOf((mp + mpInc) * mpCor) + "</td>"
				+ "<td>" + String.valueOf((pow + powInc) * powCor) + "</td>"
				+ "<td>" + String.valueOf((intel + intInc) * intCor) + "</td>"
				+ "<td>" + rs.getString("종족") + "</td>");
		
		out.print("</tr>");
	}

	stmt.close();
	dbCon.getCon().close();
	%>
	</table>
	
	<h2>마물군단 목록</h2>
	<table border="1">
		<th>  </th>
		<th>마물군단이름</th>
		<th>병력수</th>
		<th>보정군단공격력</th>
		<th>보정군단방어력</th>
		<th>보정이동력</th>
		<th>보정사기</th>
	<%
	dbCon = new DBConnection();
	stmt = dbCon.getStmt();
	stmt1 = dbCon.getCon().createStatement();
	
	rs = stmt.executeQuery("SELECT * FROM 마물군단 NATURAL JOIN 지휘관 NATURAL JOIN 마물장군");

	for(int i = 0; rs.next(); i++){
		out.print("<tr>");
		
		// 테이블 그리기
		out.print("<td><input type=\"radio\" name=\"m\" value=\"" + rs.getString("마물군단이름") + "\"></td>"
				+ "<td>" + rs.getString("마물군단이름") + "</td>"
				+ "<td>" + rs.getInt("병력수") + "</td>"
				+ "<td>" + String.valueOf((rs.getInt("총공격력") * rs.getInt("군단공격력보정"))) + "</td>"
				+ "<td>" + String.valueOf((rs.getInt("총방어력") * rs.getInt("군단방어력보정"))) + "</td>"
				+ "<td>" + String.valueOf((rs.getInt("이동력") * rs.getInt("군단이동력보정"))) + "</td>"
				+ "<td>" + String.valueOf((rs.getInt("사기") * rs.getInt("군단사기보정"))) + "</td>");
		
		out.print("</tr>");
	}

	stmt.close();
	dbCon.getCon().close();
	
	
	%>
		</table>
		<br><br><input type="submit" value="시뮬레이션 실행">
	</form>
	<%
	%>
	
</body>
</html>