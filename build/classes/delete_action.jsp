<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>삭제 중</title>
</head>
<body>
<%
	// 디비 객체 선언부
	DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	String prevId = request.getParameter("id");
	String type = request.getParameter("type");
	//.decode(request.getParameter("type"), "UTF-8");

	try{
		if(type.equals("용사")) {
			stmt.execute("UPDATE 아이템 "
					+ "SET 용사ID=null "
					+ "WHERE 용사ID='" + prevId + "'");
		} else if(type.equals("스킬")) {
			stmt.execute("UPDATE 용사"
					+ "SET 스킬=null "
					+ "WHERE 스킬='" + prevId +"'");
		} else if(type.equals("종족")) {
			stmt.execute("UPDATE 용사"
					+ "SET 종족=null "
					+ "WHERE 종족='" + prevId +"'");
			stmt.execute("UPDATE 마물장군 "
					+ "SET 천적종족=null "
					+ "WHERE 천전종족='" + prevId +"'");
		} else if(type.equals("마물군단")) {
			stmt.execute("DELETE FROM 지휘관 "
					+ "WHERE 마물군단이름='" + prevId +"'");
		} else if(type.equals("마물장군")) {
			stmt.execute("DELETE FROM 지휘관 "
					+ "WHERE 마물장군이름='" + prevId +"'");
		} else {
			out.print("예외처리 필요");
		}
		
		rs = stmt.executeQuery("SELECT * FROM " + type);
		// prevId와 같은 primary key를 갖는 레코드를 해당 테이블에서 삭제
		stmt.execute("DELETE FROM " + type
				+ " WHERE " + rs.getMetaData().getColumnName(1) + "=" + prevId);
		stmt.execute("COMMIT");
	} catch(Exception e){
		rs = stmt.executeQuery("SELECT * FROM " + type);
		out.print(type + " : " + prevId + " : " + rs.getMetaData().getColumnName(1));
		out.print(e);
	}

	response.sendRedirect("search.jsp?type=" + type);
	
	request.setCharacterEncoding("UTF-8");
		
%>

</body>
</html>