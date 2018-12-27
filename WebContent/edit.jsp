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
	String ski = request.getParameter("skill");
		out.print(type + " : " + prevId + " 수정"); %></title>
	<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<% DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	request.setCharacterEncoding("UTF-8");
	%>
	<div class="row">
	<div class="col-xl-1"></div>
	<div class="col-xl-10">
	<h1><%=type + " : " + prevId + "수정" %></h1>
	<form method="POST" action="edit_action.jsp" id="edit">
		<input type="hidden" name="type" value="<%= type %>">
		<input type="hidden" name="prev_id" value="<%= prevId %>">
	
	<%
	if(type.equals("용사")){
		%>
		
	    <div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">용사ID</span>
      		</div>
	      	<input type="text" class="form-control" id="id" name="id">
   		</div>
   		
	    <div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">Password</span>
      		</div>
	      	<input type="password" class="form-control" id="pw" name="pw">
   		</div>
		
	    <div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">이름</span>
      		</div>
	      	<input type="text" class="form-control" id="name" name="name">
   		</div>
   		
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">나이</span>
      		</div>
	      	<input type="number" class="form-control" id="age" name="age">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">출생지</span>
      		</div>
	      	<input type="text" class="form-control" id="birthPlace" name="birthPlace">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">공격력</span>
      		</div>
	      	<input type="number" class="form-control" id="attack" name="attack">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">방어력</span>
      		</div>
	      	<input type="number" class="form-control" id="defense" name="defense">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">체력</span>
      		</div>
	      	<input type="number" class="form-control" id="hp" name="hp">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">마력</span>
      		</div>
	      	<input type="number" class="form-control" id="mp" name="mp">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">힘</span>
      		</div>
	      	<input type="number" class="form-control" id="power" name="power">
   		</div>
   		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">지능</span>
      		</div>
	      	<input type="number" class="form-control" id="intel" name="intel">
   		</div>
   		
		<select class="custom-select" name="skill" form="administrate">
		<option>스킬</option>
		<%
		rs = stmt.executeQuery("SELECT 스킬이름 FROM 스킬"
				+ " WHERE 스킬이름 NOT IN (SELECT 스킬이름 FROM"
				+ " 스킬 NATURAL JOIN 용사 WHERE 스킬이름=스킬)");
		while(rs.next()){
				out.print("<option value=\"" + rs.getString("스킬이름")
				 + "\">" + rs.getString("스킬이름") + "</option>");
			}
		%>	
		</select>
		<select class="custom-select" name="tribe" form="administrate">
		<%
			rs = stmt.executeQuery("SELECT 종족 FROM 종족");
			while(rs.next()){
				out.print("<option value=\"" + rs.getString("종족")
				 + "\">" + rs.getString("종족") + "</option>");
			}
		%>	
		</select>
		
	<%
	} else if(type.equals("스킬") || type.equals("종족") || 
			type.equals("마물군단")) {
		rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
			out.print("<div class=\"input-group mb-3\"><div class=\"input-group-prepend\">"
					+ "<span class=\"input-group-text\">"+ rs.getMetaData().getColumnName(i) 
					+"</span></div>"
					+ "<input class=\"form-control\"type=\"" + (i==1 ? "text" : "number") + "\" name=\"col"
					+ i + "\" id=\"col" + i + "\"></div>");
		}
	} else if(type.equals("아이템")){
		rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
		
		for(int i = 1; i <= rs.getMetaData().getColumnCount() - 1; i++){
			if(i!=2)
				out.print("<div class=\"input-group mb-3\"><div class=\"input-group-prepend\">"
					+ "<span class=\"input-group-text\">"+ rs.getMetaData().getColumnName(i) 
					+"</span></div>"
					+ "<input class=\"form-control\"type=\"" + (i==1 ? "text" : "number") + "\" name=\"col"
					+ i + "\" id=\"col" + i + "\"></div>");
			else
				out.print(rs.getMetaData().getColumnName(i)
						+ "<select class=\"custom-select\" name=\"col" + i
						+ "\" form=\"administrate\">"
						+ "<option value=\"칼\">칼</option>"
						+ "<option value=\"창\">창</option>"
						+ "<option value=\"활\">활</option>"
						+ "<option value=\"갑옷\">갑옷</option>"
						+ "<option value=\"방패\">방패</option>"
						+ "</select><p>");
		}
		out.print("용사ID<select class=\"custom-select\" name=\"col"
				+ rs.getMetaData().getColumnCount() +"\" form=\"administrate\">");
		
		rs = stmt.executeQuery("SELECT 용사ID FROM 용사 WHERE 용사ID NOT IN "
				+ " (SELECT 용사ID FROM 아이템) ORDER BY 용사ID ASC");
		while(rs.next()){
			out.print("<option value=\"" + rs.getString("용사ID") +"\">"
					+ rs.getString("용사ID") + "</option>");
		}
		out.print("</select><p>");
	} else if(type.equals("지휘관")) {
		out.print("<tr><td>마물장군이름</td><td><select class=\"custom-select\" form=\"administrate\" name=\"col1\">");
		rs = stmt.executeQuery("SELECT * FROM 마물장군");
		while(rs.next()){
			out.print("<option value=\"" + rs.getString("마물장군이름") + "\">"
					+ rs.getString("마물장군이름") + "</option>");
		}
		out.print("</select></td></tr>");
		
		out.print("<tr><td>마물군단이름</td><td><select class=\"custom-select\" form=\"administrate\" name=\"col2\">");
		rs = stmt.executeQuery("SELECT * FROM 마물군단");
		while(rs.next()){
			out.print("<option value=\"" + rs.getString("마물군단이름") + "\">"
					+ rs.getString("마물군단이름") + "</option>");
		}
		out.print("</select></td></tr>");
	} else if(type.equals("마물장군")){
		rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
			
		for(int i = 1; i <= rs.getMetaData().getColumnCount() - 1; i++){
			out.print("<tr><td>" + rs.getMetaData().getColumnName(i) + "</td>"
					+ "<td><input class=\"form-control\" type=\"" + (i==1 ? "text" : "number") + "\" name=\"col"
					+ i + "\"></td></tr>");
		}
		out.print("<tr><td>천적종족</td><td><select class=\"custom-select\" name=\"col"
			+ rs.getMetaData().getColumnCount() + "\" form=\"administrate\">");
		
		rs = stmt.executeQuery("SELECT 종족 FROM 종족");
		while(rs.next()){
			out.print("<option value=\"" + rs.getString("종족")
			 + "\">" + rs.getString("종족") + "</option>");
		}
		out.print("</select></td></tr>");
	} else if(type.equals("관리자")){
		%>
		<div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">ID</span>
      		</div>
	      	<input type="text" class="form-control" id="id" name="id">
   		</div>
   		
	    <div class="input-group mb-3">
    	  	<div class="input-group-prepend">
      		  <span class="input-group-text">Password</span>
      		</div>
	      	<input type="password" class="form-control" id="password" name="password">
   		</div>
		<%
	}
	%>
		
		<br>
		<input type="submit" class="btn btn-primary" value="수정">
	</form>

	<%
		stmt.close();
		dbCon.getCon().close();
	%>
	</div>
	<div class="col-xl-1"></div>
	</div>
</body>
</html>