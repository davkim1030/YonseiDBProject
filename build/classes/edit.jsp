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
		<div class="form-group">
		    <label for="id">용사 ID : </label>
		    <input type="text" class="form-control" id="id" name="id">
		</div>
		<div class="form-group">
		    <label for="pw">Password : </label>
		    <input type="text" class="form-control" id="id" name="pw">
		</div>
		<div class="form-group">
		    <label for="name">이름 : </label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		    <label for="age">나이 : </label>
		    <input type="number" class="form-control" id="age" name="age">
		</div>
		<div class="form-group">
		    <label for="birth_place">출생지 : </label>
		    <input type="text" class="form-control" id="birth_place" name="birth_place">
		</div>
		<div class="form-group">
		    <label for="attack">공격력 : </label>
		    <input type="number" class="form-control" id="attack" name="attack">
		</div>
		<div class="form-group">
		    <label for="defense">방어력 : </label>
		    <input type="number" class="form-control" id="defense" name="defense">
		</div>
		<div class="form-group">
		    <label for="hp">체력 : </label>
		    <input type="number" class="form-control" id="hp" name="hp">
		</div>
		<div class="form-group">
		    <label for="mp">마력 : </label>
		    <input type="number" class="form-control" id="mp" name="mp">
		</div>
		<div class="form-group">
		    <label for="power">힘 : </label>
		    <input type="number" class="form-control" id="power" name="power">
		</div>
		<div class="form-group">
		    <label for="intel">지능 : </label>
		    <input type="number" class="form-control" id="intel" name="intel">
		</div>
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
			rs = stmt.executeQuery("SELECT 종족 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족")
				 + "\">" + rs.getString("종족") + "</option>");
			}

			rs.close();
		%>	
		</select><br>
		
	<%
	} else if(type.equals("스킬")) {
		%>
		<div class="form-group">
		    <label for="name">스킬이름 : </label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		    <label for="hp_inc">체력증가 : </label>
		    <input type="number" class="form-control" id="hp_inc" name="hp_inc">
		</div>
		<div class="form-group">
		    <label for="mp_inc">용사 ID : </label>
		    <input type="number" class="form-control" id="mp_inc" name="mp_inc">
		</div>
		<%
	} else if(type.equals("종족")) {
		%>
		
		<div class="form-group">
		    <label for="name">종족 : </label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		    <label for="atk_corr">공격력보정 : </label>
		    <input type="number" class="form-control" id="atk_corr" name="atk_corr">
		</div>
		<div class="form-group">
		    <label for="def_corr">방어력보정 : </label>
		    <input type="number" class="form-control" id="def_corr" name="def_corr">
		</div>
		<div class="form-group">
		    <label for="hp_corr">체력보정 : </label>
		    <input type="number" class="form-control" id="hp_corr" name="hp_corr">
		</div>
		<div class="form-group">
		    <label for="mp_corr">마력보정 : </label>
		    <input type="number" class="form-control" id="mp_corr" name="mp_corr">
		</div>
		<div class="form-group">
		    <label for="pow_corr">힘보정 : </label>
		    <input type="number" class="form-control" id="pow_corr" name="pow_corr">
		</div>
		<div class="form-group">
		    <label for="int_corr">지능보정 : </label>
		    <input type="number" class="form-control" id="mp_corr" name="mp_corr">
		</div>
		<%
	} else if(type.equals("아이템")) {
		%>
		<div class="form-group">
		    <label for="name">아이템 이름 : </label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		종류 : <select name="item_type" form="edit">
			<option value="갑옷">갑옷</option>
			<option value="방패">방패</option>
			<option value="창">창</option>
			<option value="칼">칼</option>
			<option value="활">활</option>
		</select><br>
		<div class="form-group">
		    <label for="atk_inc">공격력증가 : </label>
		    <input type="number" class="form-control" id="atk_inc" name="atk_inc">
		</div>
		<div class="form-group">
		    <label for="def_int">방어력증가 : </label>
		    <input type="number" class="form-control" id="def_inc" name="def_inc">
		</div>
		<div class="form-group">
		    <label for="pow_inc">힘증가 : </label>
		    <input type="number" class="form-control" id="pow_inc" name="pow_inc">
		</div>
		<div class="form-group">
		    <label for="int_inc">지능증가 : </label>
		    <input type="number" class="form-control" id="int_inc" name="int_inc">
		</div>
		<div class="form-group">
		    <label for="war_id">용사 ID : </label>
		    <input type="text" class="form-control" id="war_id" name="war_id">
		</div>
		<%
	} else if(type.equals("마물군단")) {
		%>
		<div class="form-group">
		    <label for="name">마물군단이름 : </label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		    <label for="troops_number">병력수 : </label>
		    <input type="number" class="form-control" id="troops_number" name="troops_number">
		</div>
		<div class="form-group">
		    <label for="tpt_atk">총공격력 : </label>
		    <input type="number" class="form-control" id="tot_atk" name="tot_atk">
		</div>
		<div class="form-group">
		    <label for="tot_def">총방어력 : </label>
		    <input type="number" class="form-control" id="tot_def" name="tot_def">
		</div>
		<div class="form-group">
		    <label for="speed">이동력 : </label>
		    <input type="number" class="form-control" id="speed" name="speed">
		</div>
		<div class="form-group">
		    <label for="morale">사기 : </label>
		    <input type="number" class="form-control" id="morale" name="morale">
		</div>
		<%
	} else if(type.equals("마물장군")) {
		%>
		
		<div class="form-group">
		    <label for="name">마물군단이름 : </label>
		    <input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
		    <label for="age">나이 : </label>
		    <input type="number" class="form-control" id="age" name="age">
		</div>
		<div class="form-group">
		    <label for="corps_atk_corr">군단공격력보정 : </label>
		    <input type="number" class="form-control" id="corps_atk_corr" name="corps_atk_corr">
		</div>
		<div class="form-group">
		    <label for="corps_def_corr">군단방어력보정 : </label>
		    <input type="number" class="form-control" id="corps_def_corr" name="corps_def_corr">
		</div>
		<div class="form-group">
		    <label for="corps_speed_corr">군단이동력보정 : </label>
		    <input type="text" class="form-control" id="corps_speed_corr" name="corps_speed_corr">
		</div>
		<div class="form-group">
		    <label for="corps_morale_corr">군단사기보정 : </label>
		    <input type="number" class="form-control" id="corps_morale_corr" name="corps_morale_corr">
		</div>
		천적종족 : <select name="enemy" form="edit">
		<%
			rs = stmt.executeQuery("SELECT 종족 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족")
				 + "\">" + rs.getString("종족") + "</option>");
			}
		%>	
		</select>
		<%
	} else if(type.equals("관리자")) {
		if(session.getAttribute("id")==null) response.sendRedirect("error.jsp?type=403");
		else { %>
		<div class="form-group">
		    <label for="id">ID : </label>
		    <input type="text" class="form-control" id="id" name="id">
		</div>
		<div class="form-group">
		    <label for="password">PASSWORD : </label>
		    <input type="password" class="form-control" id="password" name="password">
		</div>
			<%
		}
	} else { // 예외처리 필요
		response.sendRedirect("error.jsp?type=404");
	}
		%>
		
		<br>
		<input type="submit" class="btn btn-primary" value="수정">
	</form>

	<%
		stmt.close();
		dbCon.getCon().close();
	%>
	
</body>
</html>