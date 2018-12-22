<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page import="java.net.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title><% request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("type")
		+ " : " + request.getParameter("id") + " 상세 정보"); 
		if(request.getParameter("type").equals("관리자") &&
				session.getAttribute("id")==null){
			response.sendRedirect("error.jsp?type=403");
		}
		%></title>
</head>
<body>
	<script type="text/javascript">
	function popupOpen(type, id, att){
		var popUrl = "calculation.jsp?type=" + type + "&id=" + id + "&att=" + att;	//팝업창에 출력될 페이지 URL
		var popOption = "width=720, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
		}
	</script>
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
		
		// 테이블 내용 채우기
		out.print("<tr>");
		for(int i = 0; i < 5; i++)
			out.print("<td>"
			+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString()));
		for(int i = 11; i < 13; i++)
			out.print("<td><a href=\"detail.jsp?type="
			+ rs.getMetaData().getColumnName(i + 1) + "&id="
			+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString())
			+ "\">"
			+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString())
			+ "</a></td>");
		out.print("</tr>");
		
		int atkInc = 0, defInc = 0, hpInc = 0, mpInc = 0, powInc = 0, intInc = 0,
			atkCorr = 1, defCorr = 1, hpCorr = 1, mpCorr = 1, powCorr = 1, intCorr = 1;
		// 보정값을 가져오기위한 쿼리문
		
		// 스킬에서 애트리뷰트 가져오기
		if(stmt.executeQuery("SELECT 스킬 FROM 용사 NATURAL JOIN 스킬 "
				+ "WHERE 스킬=스킬이름 AND 용사ID='" + request.getParameter("id") + "'").next()) {
			// 아이템만 없을 경우
			rs = stmt.executeQuery("SELECT 공격력, 방어력, 체력, 마력, 힘, 지능, "
					+ "체력증가, 마력증가, "
					+ "공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 "
					+ "FROM 용사 NATURAL JOIN 스킬, 종족 "
					+ "WHERE 스킬=스킬이름 AND 용사.용사ID='"
					+ request.getParameter("id") +"'");
			rs.next();
			hpInc = rs.getInt("체력증가"); mpInc = rs.getInt("마력증가");
		}
		// 아이템에서 애트리뷰트 가져오기
		if(stmt.executeQuery("SELECT 아이템이름 "
				+ "FROM 아이템 WHERE 용사ID='" + request.getParameter("id") + "'").next()) {
			// 스킬만 없을 경우
			rs = stmt.executeQuery("SELECT 공격력, 방어력, 체력, 마력, 힘, 지능, "
					+ "공격력증가, 방어력증가, 힘증가, 지능증가, "
					+ "공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 "
					+ "FROM 용사 NATURAL JOIN 종족, 아이템 "
					+ "WHERE 용사.용사ID=아이템.용사ID AND "
					+ "용사.용사ID='" + request.getParameter("id") +"'");
			rs.next();
			atkInc = rs.getInt("공격력증가"); defInc = rs.getInt("방어력증가");
			powInc = rs.getInt("힘증가"); intInc = rs.getInt("지능증가");
		} 
		// 용사 애트리뷰트 가져오기
		rs = stmt.executeQuery("SELECT 공격력, 방어력, 체력, 마력, 힘, 지능, "
					+ "공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 "
					+ "FROM 용사 NATURAL JOIN 종족 "
					+ "WHERE "
					+ "용사.용사ID='" + request.getParameter("id") +"'");
		rs.next();
		atkCorr = rs.getInt("공격력보정"); defCorr = rs.getInt("방어력보정");
		hpCorr = rs.getInt("체력보정"); mpCorr = rs.getInt("마력보정");
		powInc = rs.getInt("힘보정"); intCorr = rs.getInt("지능보정");

		
		// 보정값과 초기값 출력
		out.print("</table><br><table border=\"1\">"
				+ "<th>분류</th> <th>초기값</th> <th>보정값</th>");
		out.print("<tr><td>공격력</td> <td>"
				+ String.valueOf(rs.getInt("공격력")) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '공격력');\">"
				+ String.valueOf((rs.getInt("공격력") + atkInc) * atkCorr)
				+ "</a></td> </tr>");
		out.print("<tr><td>방어력</td> <td>"
				+ String.valueOf(rs.getInt("방어력")) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '방어력');\">"
				+ String.valueOf((rs.getInt("방어력") + defInc) * defCorr)
				+ "</a></td> </tr>");
		out.print("<tr><td>체력</td> <td>"
				+ String.valueOf(rs.getInt("체력")) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '체력');\">"
				+ String.valueOf((rs.getInt("체력") + hpInc) * hpCorr)
				+ "</a></td> </tr>");
		out.print("<tr><td>마력</td> <td>"
				+ String.valueOf(rs.getInt("마력")) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '마력');\">"
				+ String.valueOf((rs.getInt("마력") + mpInc) * mpCorr)
				+ "</a></td> </tr>");
		out.print("<tr><td>힘</td> <td>"
				+ String.valueOf(rs.getInt("힘")) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '힘');\">"
				+ String.valueOf((rs.getInt("힘") + powInc) * powCorr)
				+ "</a></td> </tr>");
		out.print("<tr><td>지능</td> <td>"
				+ String.valueOf(rs.getInt("지능")) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '지능');\">"
				+ String.valueOf((rs.getInt("지능") + intInc) * intCorr)
				+ "</a></td> </tr> </table>");
		
	} else if(request.getParameter("type").equals("마물군단")){
		int troops, totAtk, totDef, speed, morale,
			atkCorr = 1, defCorr = 1, spdCorr = 1, moraleCorr = 1;
		
		rs = stmt.executeQuery("SELECT * FROM 마물군단"
			+ " WHERE 마물군단이름='" + request.getParameter("id") + "'");
		rs.next();
		out.print("<table border=\"1\">");
		// 애트리뷰트 개수에 맞게 table head 지정
		for(int i = 0; i < 6; i++)
			out.print("<th>"
			+ rs.getMetaData().getColumnName(i + 1).toString()
			+ "</th>");
		
		// 테이블 내용 채우기
		out.print("<tr>");
		for(int i = 0; i < 6; i++)
			out.print("<td>"
			+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString())
			+ "</td>");
		out.print("</tr></table><br>");
		
		
		// 보정값을 가져오기위한 쿼리문
		rs = stmt.executeQuery("SELECT 마물장군이름 FROM 지휘관 "
				+ "WHERE 마물군단이름='" + request.getParameter("id") +"'");

		// rs.next()가 SQLException을 뱉어서 예외처리
		try{
			while(rs.next()){
				ResultSet tmpRs = stmt.executeQuery("SELECT 군단공격력보정, 군단방어력보정, 군단이동력보정, 군단사기보정 "
						+ "FROM 마물장군 WHERE 마물장군이름='" + rs.getString("마물장군이름") + "'");
				tmpRs.next();
				atkCorr *= tmpRs.getInt("군단공격력보정");
				defCorr *= tmpRs.getInt("군단방어력보정");
				spdCorr *= tmpRs.getInt("군단이동력보정");
				moraleCorr *= tmpRs.getInt("군단사기보정");
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		rs = stmt.executeQuery("SELECT 병력수, 총공격력, 총방어력, 이동력, 사기 "
				+ "FROM 마물군단 WHERE 마물군단이름='" + request.getParameter("id") +"'");
		rs.next();
		totAtk = rs.getInt("총공격력"); totDef = rs.getInt("총방어력");
		speed = rs.getInt("이동력"); morale = rs.getInt("사기");
		troops = rs.getInt("병력수");
		
		out.print("<table border=\"1\">"
				+ "<th>분류</th> <th>초기값</th> <th>보정값</th>");
		out.print("<tr><td>총공격력</td><td>"
				+ String.valueOf(totAtk) + "</td><td>" 
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '총공격력');\">"
				+ String.valueOf(totAtk * atkCorr) + "</a></td><tr>");
		out.print("<tr><td>총방어력</td> <td>"
				+ String.valueOf(totDef) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '총방어력');\">");
		out.print(String.valueOf(totDef * defCorr) + "</a></td> </tr>");
		out.print("<tr><td>이동력</td> <td>"
				+ String.valueOf(speed) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '이동력');\">");
		out.print(String.valueOf(speed * spdCorr) + "</a></td> </tr>");
		out.print("<tr><td>사기</td> <td>"
				+ String.valueOf(morale) + "</td> <td>"
				+ "<a href=\"javascript:popupOpen('" + request.getParameter("type")
				+ "', '" + request.getParameter("id") + "', '사기');\">");
		out.print(String.valueOf(morale * moraleCorr) + "</a></td> </tr> </table>");
		
	} else if(request.getParameter("type").equals("아이템")) { // 아이템
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
		for(int i = 0; i < rs.getMetaData().getColumnCount() - 1; i++)
			out.print("<td>"
					+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString()).toString()
					+ "</td>");
		// FK 애트리뷰트에 링크 적용
		out.print("<td><a href=\"detail.jsp?type=용사" + "&id="
				+ rs.getObject(rs.getMetaData().getColumnName(rs.getMetaData().getColumnCount()).toString())
				+ "\">"
				+ rs.getObject(rs.getMetaData().getColumnName(rs.getMetaData().getColumnCount()).toString())
				+ "</a></td>");
		out.print("</tr></table>");

	} else if(request.getParameter("type").equals("마물장군")) { // 마물장군
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
		for(int i = 0; i < rs.getMetaData().getColumnCount() - 1; i++)
			out.print("<td>"
					+ rs.getObject(rs.getMetaData().getColumnName(i + 1).toString()).toString()
					+ "</td>");
		// FK 애트리뷰트에 링크 적용
		out.print("<td><a href=\"detail.jsp?type=종족" + "&id="
				+ rs.getObject(rs.getMetaData().getColumnName(rs.getMetaData().getColumnCount()).toString())
				+ "\">"
				+ rs.getObject(rs.getMetaData().getColumnName(rs.getMetaData().getColumnCount()).toString())
				+ "</a></td>");
		out.print("</tr></table>");

	} else if(request.getParameter("type").equals("관리자")) { // 관리자
		out.print("<table border=\"1\">");
		
		rs = stmt.executeQuery("SELECT * FROM " + URLDecoder.decode(request.getParameter("type"), "UTF-8"));
		rs = stmt.executeQuery("SELECT * FROM " + URLDecoder.decode(request.getParameter("type"), "UTF-8")
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

	} else { // FK가 없는 스킬, 종족 페이지에서만 프린트
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
	
	<form method="GET" action="delete_action.jsp">
		<input type="hidden" name="type" value="<% out.print(request.getParameter("type")); %>">
		<input type="hidden" name="id" value= "<% out.print(request.getParameter("id")); %>">
		<input type="submit" value="삭제">
	</form>
</body>
</html>