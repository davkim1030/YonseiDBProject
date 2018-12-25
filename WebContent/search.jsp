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
	int itemPerPage = 10;	// 페이지당 보여줄 아이템 수
	request.setCharacterEncoding("UTF-8");
	String type;
	// GET방식으로 보낸 파라메터 type 값에 따라 변수 설정 및 제목 적용
	if(request.getParameter("type")==null)
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
	else if(request.getParameter("type").equals("관리자")){
		type = "관리자";
		if(session.getAttribute("id")==null){
			response.sendRedirect("error.jsp?type=403");
		}		
	}
	else{
		type = "용사";
		// TODO : 404로 리다이렉트, exception_handler 만들기
	}
	out.print(type); %> 정보 검색</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="center-block">
	<%
		DBConnection dbCon = new DBConnection();
		Statement stmt = dbCon.getStmt();
		ResultSet rs;
		int pageCount;
		// 페이지가 null 값이면 1로 예외처리
		int currPage = request.getParameter("page")==null ? 1 : Integer.valueOf(request.getParameter("page"));
		ResultSet rsTmp;

		out.print("<h1>" + type + " 정보 검색</h1>");

		// type 값에 따라 dropdown 버튼 만들기
	%>
	<form class="form-inline" method="GET" action="search.jsp">
		<input type="hidden" name="type" value="<% out.print(type); %>">
		<input type="hidden" name="page" value="1">
		<select class="custom-select mb3" name="column_number">
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
		<input class="form-control" type="text" name="search_key">
		<button type="submit" class="btn btn-primary">검색</button>
	</form>
	
	<!-- 테이블 생성 -->
	<table class="table table-striped">
		<%
		// 애트리뷰트 개수에 맞게 table head 지정
		for(int i = 0; i < rs.getMetaData().getColumnCount(); i++)
			out.print("<th>"
			+ rs.getMetaData().getColumnName(i + 1).toString()
			+ "</th>");
		
		// column_number나 search_key가 null 이면 전체 리스트 출력
		if(request.getParameter("column_number")==null ||
		request.getParameter("search_key")==null ||
		request.getParameter("search_key").equals("")) {
			rs = stmt.executeQuery("SELECT * FROM (SELECT T.*, ROWNUM R FROM "
			+ type + " T) WHERE R>=" + String.valueOf((currPage - 1) * itemPerPage + 1)
			+ " AND R<=" + String.valueOf(currPage * itemPerPage));
		
		// column_number나 search_key가 정해지면 해당 값을 기반으로 검색
		} else {
			String columnName = rs.getMetaData().getColumnName(Integer.valueOf(request.getParameter("column_number")));
			String searchKey = request.getParameter("search_key");
			rs.close();
			
			// search_key의 타입이 숫자인 경우와 string일 경우를 나눠서 쿼리문을 작성
			// int 경우에는 정확하게 같은 값만 검색
			if(columnName.equals("int")){
				rs = stmt.executeQuery("SELECT * FROM (SELECT T.*, ROWNUM R FROM "
						+ type + " T) WHERE "+ columnName + "=" + searchKey
						+ " AND R>=" + String.valueOf((currPage - 1) * itemPerPage + 1)
						+ " AND R<=" + String.valueOf(currPage * itemPerPage));
				
			} else {	// String의 경우는 포함하는 값까지 모두 검색
				rs = stmt.executeQuery("SELECT * FROM (SELECT T.*, ROWNUM R FROM " + type
						+ " T) WHERE "
						+ columnName + " LIKE '%" + searchKey + "%' OR "
						+ columnName + " LIKE '" + searchKey + "%' OR "
						+ columnName + " LIKE '%" + searchKey + "' OR "
						+ columnName + "='" + searchKey + "'"
						+ " AND R>=" + String.valueOf((currPage - 1) * itemPerPage + 1)
						+ " AND R<=" + String.valueOf(currPage * itemPerPage));
			}
		}

		// 위에서 지정한 값들을 기반으로 테이블 생성
		for(int i = 0; rs.next() && i < itemPerPage; i++){
			out.print("<tr>");
			for(int j = 1; j <= rs.getMetaData().getColumnCount() - 1; j++){
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
	<%
		if(request.getParameter("column_number")==null ||
		request.getParameter("search_key")==null ||
		request.getParameter("search_key").equals("")) {
			rs = stmt.executeQuery("SELECT * FROM " + type + " WHERE ROWNUM=1");
			rs.next();
			// 전방향 전용 결과를 해제하기 위한 코드
			Statement stmtTmp = dbCon.getCon().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmtTmp.executeQuery("SELECT " + rs.getMetaData().getColumnName(1) + " FROM " + type);
			rs.last();
		
			pageCount = (rs.getRow() / itemPerPage) + 1;
		} else {
			String columnName = rs.getMetaData().getColumnName(Integer.valueOf(request.getParameter("column_number")));
			String searchKey = request.getParameter("search_key");
			rs.close();
			
			Statement stmtTmp = dbCon.getCon().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			// search_key의 타입이 숫자인 경우와 string일 경우를 나눠서 쿼리문을 작성
			// int 경우에는 정확하게 같은 값만 검색
			if(columnName.equals("int")){
				rs = stmtTmp.executeQuery("SELECT * FROM " + type +
						" WHERE "+ columnName + "=" + searchKey);
			} else {	// String의 경우는 포함하는 값까지 모두 검색
				rs = stmtTmp.executeQuery("SELECT * FROM (SELECT T.*, ROWNUM R FROM " + type + " T)  WHERE "
						+ columnName + " LIKE '%" + searchKey + "%' OR "
						+ columnName + " LIKE '" + searchKey + "%' OR "
						+ columnName + " LIKE '%" + searchKey + "' OR "
						+ columnName + "='" + searchKey + "'");
			}
			
			rs.last();
			
			pageCount = (rs.getRow() / itemPerPage) + 1;
		}

		out.print("<ul class=\"pagination\" style=\"justify-content: center;\">");
		for(int i = 1; i <= pageCount; i++){
				out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"search.jsp?type=" + type
				+ "&page=" + String.valueOf(i) + "\">"
				+ String.valueOf(i) + "</a></li> ");
		}
		out.print("</ul>");
	%>
	</div>
</body>
</html>