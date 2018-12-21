<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title><% request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String prevId = request.getParameter("id");
		out.print(type + " : " + prevId + " 수정"); %></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	request.setCharacterEncoding("UTF-8");
	out.print("<h1>" + type + " : " + prevId + " 수정</h1>");
	%>
	<form method="POST" action="edit_action.jsp" id="edit">
		<input type="hidden" name="type" value="<%= type %>">
		<input type="hidden" name="prev_id" value="<%= prevId %>">
	
	<%
	if(type.equals("용사")){
		%>
		용사 ID : <input type="text" name="id"><br>
		Password : <input type="password" name="pw"><br>
		이름 : <input type="text" name="name"><br>
		나이 : <input type="number" name="age"><br>
		출생지 : <input type="text" name="birth_place"><br>
		공격력 : <input type="number" name="attack"><br>
		방어력 : <input type="number" name="defense"><br>
		체력 : <input type="number" name="hp"><br>
		마력 : <input type="number" name="mp"><br>
		힘 : <input type="number" name="power"><br>
		지능 : <input type="number" name="intel"><br>
		
		스킬 : <select name="skill" form="edit">
		<%
			// 사용하고 있지 않는 스킬들만 출력
			rs = stmt.executeQuery("SELECT 스킬이름 FROM 스킬"
					+ " WHERE 스킬이름 NOT IN (SELECT 스킬이름 FROM"
					+ " 스킬 NATURAL JOIN 용사 WHERE 스킬이름=스킬)");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("스킬이름")
				 + "\">" + rs.getString("스킬이름") + "</option>");
			}
		%>	
		</select><br>
		종족 : <select name="tribe" form="edit">
		<%
			rs = stmt.executeQuery("SELECT 종족명 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족명")
				 + "\">" + rs.getString("종족명") + "</option>");
			}

			rs.close();
		%>	
		</select><br>
		
	<%
	} else if(type.equals("스킬")) {
		%>
		스킬이름 : <input type="text" name="name"><br>
		체력증가 : <input type="number" name="hp_inc"><br>
		마력증가 : <input type="number" name="mp_inc"><br>
		<%
	} else if(type.equals("종족")) {
		%>
		종족명 : <input type="text" name="name"><br>
		공격력보정 : <input type="number" name="atk_corr"><br>
		방어력보정 : <input type="number" name="def_corr"><br>
		체력보정 : <input type="number" name="hp_corr"><br>
		마력보정 : <input type="number" name="mp_corr"><br>
		힘보정 : <input type="number" name="pow_corr"><br>
		지능보정 : <input type="number" name="int_corr"><br>
		<%
	} else if(type.equals("아이템")) {
		%>
		아이템이름 : <input type="text" name="name"><br>
		종류 : <select name="item_type" form="edit">
			<option value="갑옷">갑옷</option>
			<option value="방패">방패</option>
			<option value="창">창</option>
			<option value="칼">칼</option>
			<option value="활">활</option>
		</select><br>
		공격력증가 : <input type="number" name="atk_inc"><br>
		방어력증가 : <input type="number" name="def_inc"><br>
		힘증가 : <input type="number" name="pow_inc"><br>
		지능증가 : <input type="number" name="int_inc"><br>
		용사ID : <input type="text" name="war_id"><br>
		<%
	} else if(type.equals("마물군단")) {
		%>
		마물군단이름 : <input type="text" name="name"><br>
		병력수 : <input type="number" name="troops_number"><br>
		총공격력 : <input type="number" name="tot_atk"><br>
		총방어력 : <input type="number" name="tot_def"><br>
		이동력 : <input type="number" name="speed"><br>
		사기 : <input type="number" name="morale"><br>
		<%
	} else if(type.equals("마물장군")) {
		%>
		마물군단이름 : <input type="text" name="general_name"><br>
		나이 : <input type="number" name="age"><br>
		군단공격력보정 : <input type="number" name="corp_atk_corr"><br>
		군단이동력보정 : <input type="number" name="corp_speed_corr"><br>
		군단사기보정 : <input type="number" name="corp_morale_corr"><br>
		천적종족 : <select name="enemy" form="edit">
		<%
			rs = stmt.executeQuery("SELECT 종족명 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족명")
				 + "\">" + rs.getString("종족명") + "</option>");
			}
		%>	
		</select>
		<%
	} else if(type.equals("관리자")) {
		if(session.getAttribute("id")==null) response.sendRedirect("error.jsp?type=403");
		else { %>
			ID : <input type="text" name="id"><br>
			PASSWORD : <input type="text" name="password"><br>
			<%
		}
	} else { // 예외처리 필요
		response.sendRedirect("error.jsp?type=404");
	}
		%>
		
		<br>
		<input type="submit" value="수정">
	</form>

	<%
		stmt.close();
		dbCon.getCon().close();
	%>
	
</body>
</html>