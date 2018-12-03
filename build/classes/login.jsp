<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>로그인</title>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>로그인</h1>
	<form method="POST" action="login_action.jsp">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>