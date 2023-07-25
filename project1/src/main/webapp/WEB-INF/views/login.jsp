<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">

<script type="text/javascript">
// 스크립트 영역
let text = "<p>올바른 아이디를 입력하세요.</p>"; // 전역변수

// 호이스팅이 뭐에요? (자바스크립트 하면 이런 질문이 많이 들어온다)
// let(현재 위치부터 사용) vs var(아래에서 변수를 선언하면 위에서도 쓸 수있다(Java는 불가능)) ?? 
// json? const ? (찾아보세요 -_-)
		
function checkID(){ // onchange=checkID를 실행할때마다 alert 메시지를 띄운다
	// alert("!");
	
	let msg = document.getElementById("msg"); // 지역변수
	msg.innerHTML = "<p>" + document.getElementById("id").value + "아이디를 변경했습니다.</p>" //
}

function check() { // check를 실행하면 alert 창이 뜰거에요
	// alert("!");
	let msg = document.getElementById("msg");
	let id = document.getElementById("id"); // Id 값은 하나만 주어야 한다
	// alert(id.value); // 1234
	// alert(id.value.length); // 4
	if(id.value.length <= 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		msg.innerHTML = text; // p태그는 엔터 효과
		id.focus(); // input 창 마우스 커서가 안으로 들어간다.
		return false; // 이동하겠습니다.
	}
	
	let pw = document.getElementById("pw"); // pw 값은 하나만 주어야 한다
	// alert(pw.value); // 1234
	// alert(pw.value.length); // 4
	
	if(pw.value.length <= 4) { // 비밀번호
		alert("암호는 4글자 이상이어야 합니다.");
		pw.focus(); 
		return false; // 이동하겠습니다.
	}
}

</script>

</head>


<body>
	<%@ include file="menu.jsp" %>
	
	<div class="main">
		<!-- <h1>login</h1> -->
		<div class="login-box">
			<div class="login-image">
				<img alt="logo" src="./img/캡처fff.PNG" height="350px">
			</div>
			<div class="login-form">
				<form action="./login" method="post" onsubmit="return check()">
					<input type="text" name="id" id="id" placeholder="ID" required="required" maxlength="10" onchange="checkID()">
					<input type="password" name="pw" id="pw" placeholder="PW" required="required" maxlength="15">
					<button type="submit" class="login">LOGIN</button>
<!-- 					check를 클릭하면 위에 스크립트 영역을 부른다     -->
					<span id="msg"></span>
				</form>
			</div>
		</div>
	</div>
</body>
</html>