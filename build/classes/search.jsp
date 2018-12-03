<%@page import="java.sql.*" %>
<%@page import="dbPackage.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>
	<% 
	request.setCharacterEncoding("UTF-8");
	String type;
	// GET방식으로 보낸 파라메터 type 값에 따라 변수 설정 및 제목 적용
	if(request.getParameter("type")==null
			||request.getParameter("type").equals("용사"))
		type = "용사";
	else if(request.getParameter("type").equals("스킬"))
		type = "스킬";
	else if(request.getParameter("type").equals("종족"))
		type = "종족";
	else if(request.getParameter("type").equals("아이템"))
		type = "아이템";
	else if(request.getParameter("type").equals("마물군단"))
		type = "마물군단";
	else if(request.getParameter("type").equals("마물장군"))
		type = "마물장군";
	else{
		// TODO : 404로 리다이렉트, exception_handler 만들기
		type = "용사";
	}
	out.print(type); %> 정보 검색</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		DBConnection dbCon = new DBConnection();
		Statement stmt = dbCon.getStmt();
		ResultSet rs;
		
		out.print("<h1>" + type + " 정보 검색</h1>");

		// type 값에 따라 dropdown 버튼 만들기
	%>
	<form method="GET" action="search.jsp">
		<input type="hidden" name="type" value="<% out.print(type); %>">
		<select name="column_number">
		<%
			// 해당 테이블에서 한 개의 쿼리만 가져오기
			rs = stmt.executeQuery("SELECT * FROM " + type
					+ " WHERE ROWNUM=1");
			for(int i = 1; i <= rs.getMetaData().getColumnCount(); i++)
				out.print("<option value=\"" + i + "\">"
				+ rs.getMetaData().getColumnName(i).toString()
				+ "</option>");
		%>
		</select>
		<input type="text" name="search_key">
		<input type="submit" value="검색">
	</form>
	
	<!-- 테이블 생성 -->
	<table border="1">
		<%
		// 애트리뷰트 개수에 맞게 table head 지정
		for(int i = 0; i < rs.getMetaData().getColumnCount(); i++)
			out.print("<th>"
			+ rs.getMetaData().getColumnName(i + 1).toString()
			+ "</th>");
		
		// column_number나 search_key가 null 이면 전체 리스트 출력
		if(request.getParameter("column_number")==null ||
		request.getParameter("search_key")==null ||
		request.getParameter("search_key").equals(""))
			rs = stmt.executeQuery("SELECT * FROM " + type);
		
		// column_number나 search_key가 정해지면 해당 값을 기반으로 검색
		else{
			String columnName = rs.getMetaData().getColumnName(Integer.valueOf(request.getParameter("column_number")));
			String searchKey = request.getParameter("search_key");
			rs.close();
			
			// search_key의 타입이 숫자인 경우와 string일 경우를 나눠서 쿼리문을 작성
			// int 경우에는 정확하게 같은 값만 검색
			if(columnName.equals("int")){
				rs = stmt.executeQuery("SELECT * FROM " + type +
						" WHERE "+ columnName + "=" + searchKey);
			} else {	// String의 경우는 포함하는 값까지 모두 검색
				rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE "
						+ columnName + " LIKE '%" + searchKey + "%' OR "
						+ columnName + " LIKE '" + searchKey + "%' OR "
						+ columnName + " LIKE '%" + searchKey + "' OR "
						+ columnName + "='" + searchKey + "'");
			}
		}
		
		// 위에서 지정한 값들을 기반으로 테이블 생성
		while(rs.next()){
			out.print("<tr>");
			for(int j = 1; j <= rs.getMetaData().getColumnCount(); j++){
				out.print("<td>");
				if(j==1) {	// 첫 번째 어트리뷰트의 경우 링크 추가
					out.print("<a href=\"detail.jsp?type="
					+ type + "&id=" + rs.getObject(j).toString() + "\">"
					+ rs.getObject(j).toString() + "</a>");
				}
				else{
					try{out.print(rs.getObject(j).toString());}
					// 스킬이나 종족이 없을 경우 널포인터 익셉션으로 빈 값 출력
					catch(NullPointerException e){
						out.print("");
					}
				}
				out.print("</td>");
			}
			out.print("</tr>");
		}

		%>
	</table>
</body>
</html>