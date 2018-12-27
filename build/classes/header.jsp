<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="http://localhost:8080/YonseiDBProject/images/favicon.ico" rel="icon" type="image/x-icon" />
</head>
<style>
body{
margin-top:60px;}
</style>
<body>

	<%
	String log;	// 로그인이면 "로그아웃", 로그아웃이면 "로그인" 넣어줄 string 값
	try{
		// 로그인 돼 있으면 id 출력 부분
		if(session.getAttribute("id")!=null){
			log = "로그아웃";
		} // 로그인 안 돼 있으면 출력할 부분
		else
			log = "로그인";
	}// 로그인 안 돼 있으면 세션 부분 예외 처리
	catch(NullPointerException e){
		out.print("");
		log = "로그인";
	}

	
	
	// page List 부분
	%>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="main.jsp"
			style="font-weight:bolder;">연세왕국</a></li>
		<%if(log.equals("로그아웃")) {%>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       			정보 등록
      		</a>
      		<div class="dropdown-menu" id="register">
        		<a class="dropdown-item" href="signup.jsp?type=용사">용사 등록</a>
        		<a class="dropdown-item" href="signup.jsp?type=스킬">스킬 등록</a>
        		<a class="dropdown-item" href="signup.jsp?type=종족">종족 등록</a>
        		<a class="dropdown-item" href="signup.jsp?type=아이템">아이템 등록</a>
        		<a class="dropdown-item" href="signup.jsp?type=마물군단">마물군단 등록</a>
        		<a class="dropdown-item" href="signup.jsp?type=마물장군">마물장군 등록</a>
        		<a class="dropdown-item" href="signup.jsp?type=지휘관">지휘관 등록</a>
        		<a class="dropdown-item" href="signup_admin.jsp">관리자 등록</a>
      		</div>
      	</li>
      	<%} %>
      	<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       			데이터 통계
      		</a>
      		<div class="dropdown-menu" id="statistics">
        		<a class="dropdown-item" href="statistics.jsp?type=용사">용사 데이터 통계</a>
        		<a class="dropdown-item" href="statistics.jsp?type=마물군단">마물군단 데이터 통계</a>
      		</div>
      	</li>
      	
      	<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       			정보검색
      		</a>
      		<div class="dropdown-menu" id="search">
        		<a class="dropdown-item" href="search.jsp?type=용사&page=1">용사 정보 검색</a>
        		<a class="dropdown-item" href="search.jsp?type=스킬&page=1">스킬 정보 검색</a>
        		<a class="dropdown-item" href="search.jsp?type=종족&page=1">종족 정보 검색</a>
        		<a class="dropdown-item" href="search.jsp?type=아이템&page=1">아이템 정보 검색</a>
        		<a class="dropdown-item" href="search.jsp?type=마물군단&page=1">마물군단 정보 검색</a>
        		<a class="dropdown-item" href="search.jsp?type=마물장군&page=1">마물장군 정보 검색</a>
        		<% if(log.equals("로그아웃")){%><a class="dropdown-item" href="search.jsp?type=관리자&page=1">관리자 정보 검색</a><%} %>
      		</div>
      	</li>
      	
		<li class="nav-item"><a class="nav-link" href="simulation.jsp">모의전투</a></li>
	</ul>
		<span class="navbar-text" style="padding-right:10px;">
		    <%=session.getAttribute("id")==null ? "" : session.getAttribute("id")%>
	    </span>
	    <form method="GET" class="form-inline" action="<%=log.equals("로그아웃") ? "logout_action" : "login"%>.jsp">
			<button class="btn btn-success" type="submit" ><%=log %></button>
		</form>
	</nav>

</body>
</html>