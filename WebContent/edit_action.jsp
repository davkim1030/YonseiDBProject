<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정보 수정 중</title>
<link href="http://localhost:8080/YonseiDBProject/images/favicon.ico" rel="icon" type="image/x-icon" />
</head>
<body>
<%
	// 디비 객체 선언부
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	PwdEncryption pe = new PwdEncryption();
	request.setCharacterEncoding("UTF-8");
	String prevId = request.getParameter("prev_id");
	String type = request.getParameter("type");
//	String prevId = URLEncoder.encode(request.getParameter("prev_id"), "UTF-8");
//	String type = URLEncoder.encode(request.getParameter("type"), "UTF-8");
	%>


	<%
	if(type.equals("용사")){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String birthPlace = request.getParameter("birth_place");
		String attack = request.getParameter("attack");
		String defense = request.getParameter("defense");
		String hp = request.getParameter("hp");
		String mp = request.getParameter("mp");
		String power = request.getParameter("power");
		String intel = request.getParameter("intel");
		String skill = request.getParameter("skill");
		String tribe = request.getParameter("tribe");
		try{
			stmt.execute("UPDATE 아이템 SET 용사ID='" + id + "' WHERE 용사ID='" + prevId + "'");
			stmt.execute("UPDATE 용사 SET 용사ID='" + id + "', password='"
					+ pe.encrypt(pw) + "', 이름='"
					+ name + "', 나이="
					+ age + ", 출생지='"
					+ birthPlace + "', 공격력="
					+ attack + ", 방어력="
					+ defense + ", 체력="
					+ hp + ", 마력="
					+ mp + ", 힘="
					+ power + ", 지능="
					+ intel + ", 스킬='"
					+ skill + "', 종족='"
					+ tribe + "' WHERE 용사id='" + prevId + "'");
			stmt.execute("COMMIT");
		} catch(Exception e){
			out.print(e.toString());
		}
		System.out.print("ID : " + id +
				"\nPassword : " + pw + 
				"\n이름 : " + name +
				"\n나이 : " + age + 
				"\n출생지 : " + birthPlace + 
				"\n공격력 : " + attack + 
				"\n방어력 : " + defense + 
				"\n체력 : " + hp + 
				"\n마력 : " + mp + 
				"\n힘 : " + power + 
				"\n지능 : " + intel + 
				"\n스킬 : " + skill + 
				"\n종족 : " + tribe);
	} else if(type.equals("스킬")) {
		String skillName = request.getParameter("col1");
		String hpInc = request.getParameter("col2");
		String mpInc = request.getParameter("col3");
		try{
			stmt.execute("UPDATE 용사 "
					+ "SET 스킬='" + skillName
					+ "' WHERE 스킬='" + prevId + "'");
			stmt.execute("UPDATE " + type +
					" SET 스킬이름='" + skillName
					+ ", 체력증가=" + hpInc
					+ ", 마력증가=" + mpInc
					+ "WHERE 스킬이름='" + prevId +"'");
			stmt.execute("COMMIT");
		} catch(Exception e){
			out.print(e.toString());
		}
	} else if(type.equals("종족")) {
		String tribeName = request.getParameter("col1");
		String atkCorr = request.getParameter("col2");
		String defCorr = request.getParameter("col3");
		String hpCorr = request.getParameter("col4");
		String mpCorr = request.getParameter("col5");
		String powCorr = request.getParameter("col6");
		String intCorr = request.getParameter("col7");
		try{
			stmt.execute("UPDATE 용사"
					+ " SET 종족='" + tribeName
					+ "' WHERE 종족='" + prevId +"'");
			stmt.execute("UPDATE 마물장군"
					+ " SET 천적종족='" + tribeName
					+ "' WHERE 천적종족='" + prevId +"'");
			stmt.execute("UPDATE 종족"
					+ " SET 종족='" + tribeName
					+ "', 공격력보정=" + atkCorr
					+ ", 방어력보정=" + defCorr
					+ ", 체력보정=" + hpCorr
					+ ", 마력보정=" + mpCorr
					+ ", 힘보정=" + powCorr
					+ ", 지능보정=" + intCorr
					+ "WHERE 종족='" + prevId +"'");
			stmt.execute("COMMIT");
		} catch(Exception e){
			out.print(e);
		}
	} else if(type.equals("아이템")){
		String itemName = request.getParameter("col1");
		String itemType = request.getParameter("col2");
		String atkInc = request.getParameter("col3");
		String defInc = request.getParameter("col4");
		String powInc = request.getParameter("col5");
		String intInc = request.getParameter("col6");
		String warId = request.getParameter("col7");
		try{
			stmt.execute("UPDATE 아이템"
					+ " SET 아이템이름='" + itemName
					+ "', 종류='" + itemType
					+ "', 공격력증가=" + atkInc
					+ ", 방어력증가=" + defInc
					+ ", 힘증가=" + powInc
					+ ", 지능증가=" + intInc
					+ ", 용사ID='" + warId +"'");
			stmt.execute("COMMIT");
		}catch (Exception e){
			out.print(e);
		}
	} else if(type.equals("마물군단")) {
		String corpsName = request.getParameter("col1");
		String troopsNumber = request.getParameter("col2");
		String totAtk = request.getParameter("col3");
		String totDef = request.getParameter("col4");
		String speed = request.getParameter("col5");
		String morale = request.getParameter("col6");
		try{
			stmt.execute("UPDATE 지휘관"
					+ " SET 마물군단이름='" + corpsName
					+ "' WHERE 마물군단이름='" + prevId +"'");
			stmt.execute("UPDATE 마물군단"
					+ " SET 마물군단이름='" + corpsName
					+ "', 병력수=" + troopsNumber
					+ ", 총공격력=" + totAtk
					+ ", 총방어력=" + totDef
					+ ", 이동력=" + speed
					+ ", 사기=" + morale
					+ "WHERE 마물군단이름='" + prevId +"'");
			stmt.execute("COMMIT");
		} catch(Exception e) {
			out.print(e);
		}
	} else if(type.equals("마물장군")) {
		String generalName = request.getParameter("col1");
		String age = request.getParameter("col2");
		String corpsAtkCorr = request.getParameter("col3");
		String corpsSpeedCorr = request.getParameter("col4");
		String corpsMoraleCorr = request.getParameter("col5");
		String enemy = request.getParameter("col6");
		try{
			stmt.execute("UPDATE 지휘관"
					+ " SET 마물장군이름='" + generalName
					+ "' WHERE 마물장군이름='" + prevId +"'");
			stmt.execute("UPDATE 마물장군"
					+ " SET 마물장군이름='" + generalName
					+ "', 나이=" + age
					+ ", 군단공격력보정=" + corpsAtkCorr
					+ ", 군단이동력보정=" + corpsSpeedCorr
					+ ", 군단사기보정=" + corpsMoraleCorr
					+ ", 천적종족='" + enemy
					+ "' WHERE 마물장군이름='" + prevId +"'");
			stmt.execute("COMMIT");
		} catch(Exception e){
			out.print(e);
		}
	} else if(type.equals("관리자")) {
		String id = URLEncoder.encode(request.getParameter("id"), "UTF-8");
		String pw = URLEncoder.encode(request.getParameter("password"), "UTF-8");
		try{
			stmt.execute("UPDATE 관리자 "
					+ "SET ID='" + id
					+ "', PASSWORD='" + pe.encrypt(pw)
					+ "' WHERE id='" + prevId +"'");
			stmt.execute("COMMIT");
		} catch (Exception e){
			e.printStackTrace();
		}
	}else {	// 예외처리 필요
		out.print("예외처리 필요");
	}
	
//	out.print(type + " : " + id);
	response.sendRedirect("detail.jsp?type=" + URLEncoder.encode(type, "UTF-8")
			+ "&id=" + request.getParameter("id"));
	
	
%>

</body>
</html>