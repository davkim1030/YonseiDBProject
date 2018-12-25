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
	<form method="POST" class="form-inline" action="login_action.jsp">
		<label for="id">ID : </label>
		<input type="text" class="form-control" id="id" name="id"><br>
		<label for="pw">PW : </label>
		<input type="password" class="form-control" id="pw" name="pw"><br>
		<input type="submit" class="btn btn-primary" value="로그인">
	</form>
</body>
</html>