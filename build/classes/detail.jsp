<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title><% request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("type")
		+ " : " + request.getParameter("id") + " 상세 정보"); %></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% DBConnection dbCon = new DBConnection();
	Statement stmt = dbCon.getStmt();
	ResultSet rs;
	
	out.print("<h1>" + request.getParameter("type")
	+ " : " + request.getParameter("id") + " 상세 정보</h1>");
	
	if(request.getParameter("type").equals("용사")) {
		rs = stmt.executeQuery("SELECT * FROM 용사 WHERE 용사id='" + request.getParameter("id") + "'");
		
		rs.next();
		out.print("<table border=\"1\">");
		// 애트리뷰트 개수에 맞게 table head 지정
		for(int i = 0; i < 5; i++)
			out.print("<th>"
			+ rs.getMetaData().getColumnName(i + 1).toString()
			+ "</th>");
		for(int i = 11; i < 13; i++)
			out.print("<th>"
			+ rs.getMetaData().getColumnName(i + 1).toString()
			+ "</th>");
		
		out.print("<tr>");
		for(int i = 0; i < 5; i++)
			out.print("<td>"
			+ (i!=3 ? rs.getString(rs.getMetaData().getColumnName(i + 1).toString())
					: rs.getInt(rs.getMetaData().getColumnName(i + 1).toString()))
			+ "</td>");
		for(int i = 11; i < 13; i++)
			out.print("<td>"
			+ rs.getString(rs.getMetaData().getColumnName(i + 1).toString())
			+ "</td>");
		out.print("</tr>");
		
		// 보정값을 가져오기위한 쿼리문
		rs = stmt.executeQuery("SELECT 공격력, 방어력, 체력, 마력, 힘, 지능, "
				+ "체력증가, 마력증가, 공격력증가, 방어력증가, 힘증가, 지능증가, "
				+ "공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 "
				+ "FROM 용사 NATURAL JOIN 스킬, 종족, 아이템 "
				+ "WHERE 용사.용사ID=아이템.용사ID AND 종족=종족명 AND "
				+ "스킬=스킬이름 AND 용사.용사ID='" + request.getParameter("id") +"'");
		
		if(!rs.next()){
			rs = stmt.executeQuery("SELECT 공격력, 방어력, 체력, 마력, 힘, 지능, "
					+ "공격력증가, 방어력증가, 힘증가, 지능증가, "
					+ "공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 "
					+ "FROM 용사 NATURAL JOIN 종족, 아이템 "
					+ "WHERE 용사.용사ID=아이템.용사ID AND 종족=종족명 AND "
					+ "용사.용사ID='" + request.getParameter("id") +"'");
			rs.next();
		}
		out.print("</table><br><table border=\"1\">"
				+ "<th>분류</th> <th>초기값</th> <th>보정값</th>");
		out.print("<tr><td>공격력</td> <td>"
				+ String.valueOf(rs.getInt("공격력")) + "</td> <td>"
				+ String.valueOf((rs.getInt("공격력") + rs.getInt("공격력증가"))*rs.getInt("공격력보정"))
				+ "</td> </tr>");
		out.print("<tr><td>방어력</td> <td>"
				+ String.valueOf(rs.getInt("방어력")) + "</td> <td>"
				+ String.valueOf((rs.getInt("방어력") + rs.getInt("방어력증가"))*rs.getInt("방어력보정"))
				+ "</td> </tr>");
		out.print("<tr><td>체력</td> <td>"
				+ String.valueOf(rs.getInt("체력")) + "</td> <td>"
				+ String.valueOf(rs.getInt("체력") * rs.getInt("체력보정"))
				+ "</td> </tr>");
		out.print("<tr><td>마력</td> <td>"
				+ String.valueOf(rs.getInt("마력")) + "</td> <td>"
				+ String.valueOf(rs.getInt("마력") * rs.getInt("마력보정"))
				+ "</td> </tr>");
		out.print("<tr><td>힘</td> <td>"
				+ String.valueOf(rs.getInt("힘")) + "</td> <td>"
				+ String.valueOf((rs.getInt("힘") + rs.getInt("힘증가"))*rs.getInt("힘보정"))
				+ "</td> </tr>");
		out.print("<tr><td>지능</td> <td>"
				+ String.valueOf(rs.getInt("지능")) + "</td> <td>"
				+ String.valueOf((rs.getInt("지능") + rs.getInt("지능증가"))*rs.getInt("지능보정"))
				+ "</td> </tr> </table>");
	} else if(request.getParameter("type").equals("마물군단")){
		// TODO : 쿼리부터 아예 다시 다 짜야함
		
		// 보정값을 가져오기위한 쿼리문
		rs = stmt.executeQuery("SELECT 병력수, 총공격력, 군단공격력보정 "
				+ "FROM 마물군단 NATURAL JOIN 지휘관, 마물장군 "
				+ "WHERE 마물군단이름='" + request.getParameter("id") +"'");
		
		out.print("<table border=\"1\">"
				+ "<th>분류</th> <th>초기값</th> <th>보정값</th>");
		out.print("<tr><td>총공격력</td> <td>"
				+ String.valueOf(rs.getInt("총공격력")) + "</td> <td>");
		int atkSum = 1;
			while(rs.next()){
				atkSum *= rs.getInt("군단공격력보정");
			}
		out.print(String.valueOf(rs.getInt("총공격력") * atkSum) + "</td> </tr>");
		
		rs = stmt.executeQuery("SELECT 병력수, 총방어력, 군단이동력보정 "
				+ "FROM 마물군단 NATURAL JOIN 지휘관, 마물장군 "
				+ "WHERE 마물군단이름='" + request.getParameter("id") +"'");
		out.print("<tr><td>총방어력</td> <td>"
				+ String.valueOf(rs.getInt("총방어력")) + "</td> <td>");
		atkSum = 1;
			while(rs.next()){
				atkSum *= rs.getInt("군단방어력보정");
			}
		out.print(String.valueOf(rs.getInt("총방어력") * atkSum) + "</td> </tr>");
		
		rs = stmt.executeQuery("SELECT 병력수, 이동력, 군단이동력보정"
				+ "FROM 마물군단 NATURAL JOIN 지휘관, 마물장군 "
				+ "WHERE 마물군단이름='" + request.getParameter("id") +"'");
		out.print("<tr><td>총공격력</td> <td>"
				+ String.valueOf(rs.getInt("이동력")) + "</td> <td>");
		atkSum = 1;
			while(rs.next()){
				atkSum *= rs.getInt("군단이동력보정");
			}
		out.print(String.valueOf(rs.getInt("이동력") * atkSum) + "</td> </tr>");
		
		rs = stmt.executeQuery("SELECT 사기 , 군단사기보정 "
				+ "FROM 마물군단 NATURAL JOIN 지휘관, 마물장군 "
				+ "WHERE 마물군단이름='" + request.getParameter("id") +"'");
		out.print("<tr><td>사기</td> <td>"
				+ String.valueOf(rs.getInt("군단사기보정")) + "</td> <td>");
		atkSum = 1;
			while(rs.next()){
				atkSum *= rs.getInt("군단사기보정");
			}
		out.print(String.valueOf(rs.getInt("사기") * atkSum) + "</td> </tr> </table>");
		
	} else {
		out.print("<table border=\"1\">");
		
		rs = stmt.executeQuery("SELECT * FROM " + request.getParameter("type"));
		rs = stmt.executeQuery("SELECT * FROM " + request.getParameter("type")
		 + " WHERE " + rs.getMetaData().getColumnName(1).toString()
		 + "='" + request.getParameter("id") + "'");
		rs.next();
		
		// 애트리뷰트 개수에 맞게 table head 지정
		for(int i = 0; i < rs.getMetaData().getColumnCount(); i++)
			out.print("<th>"
			+ rs.getMetaData().getColumnName(i + 1).toString()
			+ "</th>");
		out.print("<tr>");
		for(int i = 0; i < rs.getMetaData().getColumnCount(); i++)
			out.print("<td>"
					+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString()).toString()
					+ "</td>");
		out.print("</tr></table>");
	}
	%>
	<form method="POST" action="edit.jsp">
		<input type="hidden" name="type" value="<% out.print(request.getParameter("type")); %>">
		<input type="hidden" name="id" value= "<% out.print(request.getParameter("id")); %>">
		<input type="submit" value="수정">
	</form>
	
	<form method="POST" action="delete.jsp">
		<input type="hidden" name="type" value="<% out.print(request.getParameter("type")); %>">
		<input type="hidden" name="id" value= "<% out.print(request.getParameter("id")); %>">
		<input type="submit" value="삭제">
	</form>
</body>
</html>