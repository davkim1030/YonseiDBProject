<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<a href="main.jsp"><img alt="logo" src="images/logo.jpg"></a>
	
	<%
	String log;	// 로그인인지 로그아웃인지 넣어줄 string 값
	try{
		// 로그인 돼 있으면 id 출력 부분
		if(session.getAttribute("id")!=null){
			out.print("<br>" + session.getAttribute("id") + " | ");
			log = "로그아웃";
		} // 로그인 안 돼 있으면 출력할 부분
		else
			log = "로그인";
	}// 로그인 안 돼 있으면 세션 부분 예외 처리
	catch(NullPointerException e){
		out.print("");
		log = "로그인";
	}
	// 로그인 여부에 따라 로그인 / 로그아웃 버튼 구현
	out.print("<form method=\"POST\" action=\"" +
		(log.equals("로그아웃") ? "logout_action" : "login")
		+ ".jsp\"><input type=\"submit\" value=\"" + log + "\"></form>");
	
	
	// page List 부분
	%>
	
	<ul>
		<li><a href="main.jsp">메인</a></li>
		<li><a href="login.jsp">로그인</a></li>
		<li><a href="signup.jsp">용사등록</a></li>
		<li>정보검색
			<ul>
				<li><a href="search.jsp?type=용사&page=1">용사 정보 검색</a></li>
				<li><a href="search.jsp?type=스킬&page=1">스킬 정보 검색</a></li>
				<li><a href="search.jsp?type=종족&page=1">종족 정보 검색</a></li>
				<li><a href="search.jsp?type=아이템&page=1">아이템 정보 검색</a></li>
				<li><a href="search.jsp?type=마물군단&page=1">마물군단 정보 검색</a></li>
				<li><a href="search.jsp?type=마물장군&page=1">마물장군 정보 검색</a></li>
			</ul>
		</li>
	</ul>

</body>
</html>