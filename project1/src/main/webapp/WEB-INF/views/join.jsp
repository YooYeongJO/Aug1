<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/join.css?version=0.2">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script> <!-- jquery 선언문 반드시 필요 --> 
<script type="text/javascript">
$(function(){
	$("#idCheck").click(function() { // idCheck란 버튼을 클릭하면
		let id = $("#id").val();   // input 창에 있는 값을 뽑아낸다
		// console.log(id);
		// console.log(id.length);
		if(id == "" || id.length < 5) { // id가 비어있거나 길이가 5보다 작다면
			$("#resultMSG").text("아이디는 다섯글자 이상이어야 합니다.");
			$("#resultMSG").css("color", "red").css("font-weight", "bold").css("font-size", "15pt"); // 메시지창 css 변경하기
			// $("#resultMSG").css("font-weight", "bold"); // 메시지창 css 변경하기
			// $("#resultMSG").css("font-size", "15pt");
			
		} else { // id가 비어있지 않거나 5글자 이상이면
			$.ajax({ // ajax 시작
				url : "./checkID", // 주소
				type : "post", // 타입
				data : {"id" : id}, // 데이터
				dataType : "json", // {result : 0} 이런 형태로 날린다
				success: function(data){ // 성공했을 때
					// alert(data.result); // data.result 값만 뽑아내기
					if(data.result == 1) { // id 등록이 이미 된 사람
						$("#id").css("background-color", "red"); // input창 색 변경
						$("#id").focus(); // 깜빡이는 커서가 input창 안으로 들어간다
						$("#resultMSG").css("color", "red").text("이미 등록된 아이디입니다.");
						
					} else { // id 등록이 안되었을 때 (가입이 안된 상태)
						$("#id").css("background-color", "white"); // input창 색 변경
						$("#resultMSG").css("color", "green").text("가입할 수 있습니다.");
					}
					// $("#resultMSG").text("성공시 결과값 : " + data); 
				}, 
				error: function(request, status, error){ // 실패했을 때
					$("#resultMSG").text("오류가 발생했습니다. 가입할 수 없습니다.");
				} 
			}); // ajax 끝
			
		}
		return false; // 멈추기
	}); 
		
	
});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="join-div">
		<form action="./join" method="post">
		<!-- join은 get에 이미 있으니까 post로 다시  -->
		<h1>회원가입</h1>
		<hr>
		<div class="label-row">
			<div class="label-name">아이디</div>
			<div class="label-in">
				<input type="text" name="id" id="id">
				<button id="idCheck">중복검사</button>
			</div>
		</div>
		<div class="label-row" style="height: 40px" id="resultForm">
			<div class="label-name"></div>
			<div class="label-in"><span id="resultMSG"></span></div>
		</div>
		<div class="label-row">
			<div class="label-name">비밀번호</div>
			<div class="label-in">
				<input type="password" name="pw1">
				<input type="password" name="pw2">
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">이 름</div>
			<div class="label-in">
				<input type="text" name="name">
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">주 소</div>
			<div class="label-in">
				<input type="text" name="addr">
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">MBTI</div>
			<div class="label-in">
				<select name="mbti">
					<option value="0">선택하세요</option>
					<optgroup label="소심이">
						<option value="ISTJ">ISTJ</option>
						<option value="ISTP">ISTP</option>
						<option value="ISFJ">ISFJ</option>
						<option value="ISFP">ISFP</option>
						<option value="INTJ">INTJ</option>
						<option value="INTP">INTP</option>
						<option value="INFJ">INFJ</option>
						<option value="INFP">INFP</option>
					</optgroup>
					<optgroup label="활발이">
						<option value="ESTJ">ESTJ</option>
						<option value="ESTP">ESTP</option>
						<option value="ESFJ">ESFJ</option>
						<option value="ESFP">ESFP</option>
						<option value="ENTJ">ENTJ</option>
						<option value="ENTP">ENTP</option>
						<option value="ENFJ">ENFJ</option>
						<option value="ENFP">ENFP</option>
						</optgroup>
				</select>
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">생년월일</div>
			<div class="label-in">
				<input type="date" name="birth">
			</div>
		</div>
		<div class="label-row">
			<div class="label-name">성별</div>
			<div class="label-in">
				<input type="radio" name="gender" id="m" value="1">
				<label for="m">남자</label>
				<input type="radio" name="gender" id="f" value="0">
				<label for="f">여자</label>
			</div>
		</div>
		<hr>
		<div class="label-row lrbtn">
			<button type="reset">취소</button>
			<button type="submit">가입하기</button>
		</div>
		</form>
	</div>

	
	
	
	
</body>
</html>