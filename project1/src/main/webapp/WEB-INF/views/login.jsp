<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/login.css">
</head>
<body>
	<div class = "front"><h1>Login</h1></div>
	<div class="login-div">
		<form action="./login" method="post">
		<input type="text" name="id">
		<input type="password" name="pw">
		<button type="submit">로그인</button>
		</form>
		<form action="./board" >
		<br>
		<button type ="submit">돌아가기</button>
		</form>
	</div>

</body>
</html>