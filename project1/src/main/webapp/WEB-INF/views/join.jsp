<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
</head>
<body>
<%@ include file="menu.jsp" %>
<div>
		<h1> 회원가입 </h1>
		<div>
			<div>아이디</div>
			<div>
				<input type="text" name="id">
			</div>
		</div>
		<div>
			<div>비밀번호</div>
			<div>
				<input type="text" name="pw1">
				<input type="text" name="pw2">
			</div>
		</div>
		<div>
			<div>이름</div>
			<div>
				<input type="text" name="name">
			</div>
		</div>
		<div>
			<div>주소</div>
			<div> 
				<input type="text" name="addr">
			</div>
		</div>
		<div>MBTI</div>
		<div>생년월일</div>
		
		<div>성별 </div>
		<div>남자 여자</div>
		<button type="reset">취소</button>
		<button type="submit">가입하기</button>

	</div>



</body>
</html>