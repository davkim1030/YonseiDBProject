<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>시뮬레이션 결과</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	
<%	request.setCharacterEncoding("UTF-8");
	String[] check = request.getParameterValues("war");
	String mon = request.getParameter("mon");
	
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt(), stmt1 = dbCon.getCon().createStatement();
	ResultSet rs;
	int warTotAtk = 0, warTotDef = 0, monAtk = 0, monDef = 0;
	
	rs = stmt.executeQuery("SELECT * FROM 마물군단 NATURAL JOIN 지휘관 NATURAL JOIN 마물장군 "
			+ " WHERE 마물군단이름='" + mon + "'");
	rs.next();
	monAtk = rs.getInt("총공격력") * rs.getInt("군단공격력보정");
	monDef = rs.getInt("총방어력") * rs.getInt("군단방어력보정");
	
	// 용사 데이터 만들기
	for(int i = 0; i < check.length; i++){
		ResultSet tmpData;
		String id, skill, tribe;
		int atk, def, hp, mp, pow, intel,
			atkInc = 0, defInc = 0, hpInc = 0, mpInc = 0, powInc = 0, intInc = 0,	
			atkCor = 1, defCor = 1, hpCor = 1, mpCor = 1, powCor = 1, intCor = 1;
		
		// 기본 능력치 가져오기
		tmpData = stmt1.executeQuery("SELECT * FROM 용사 WHERE 용사ID='" + check[i] +"'");
		tmpData.next();
		id = tmpData.getString("용사ID");
		skill = tmpData.getString("스킬");
		tribe = tmpData.getString("종족");
		atk = tmpData.getInt("공격력");
		def= tmpData.getInt("방어력");
		hp = tmpData.getInt("체력");
		mp = tmpData.getInt("마력");
		pow = tmpData.getInt("힘");
		intel = tmpData.getInt("지능");
		
		// 능력치 증가 가져오기
		tmpData = stmt1.executeQuery("SELECT 공격력증가, 방어력증가 FROM 아이템 WHERE 용사ID='" + id + "'");
		if(tmpData.next()){
			atkInc = tmpData.getInt("공격력증가");
			defInc = tmpData.getInt("방어력증가");
		}
		
		// 능력치 보정 가져오기
		tmpData = stmt1.executeQuery("SELECT 공격력보정, 방어력보정 FROM 종족 WHERE 종족='" + tribe + "'");
		if(tmpData.next()){
		atkCor = tmpData.getInt("공격력보정");
		defCor = tmpData.getInt("방어력보정");
		}

		warTotAtk += (atk + atkInc) * atkCor;
		warTotDef += (def + defInc) * defCor;

	
	}
	

	out.print("<h1>");
	if (warTotAtk > monDef && monAtk <= warTotDef)
		out.print("승리");
	else if (warTotAtk <= monDef && monAtk > warTotDef)
		out.print("패배");
	else if (warTotAtk > monDef && monAtk > warTotDef)
		out.print("전멸");
	else
		out.print("무승부");
	out.print("</h1>");

%>

</body>
</html>