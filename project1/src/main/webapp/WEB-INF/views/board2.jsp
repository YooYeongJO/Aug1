<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드2</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script> <!-- jquery 선언문 반드시 필요 --> 
<script type="text/javascript">
	$(function() {
		// 보드 내용 가져오기
		var lists = []; // []표시는 배열에 담겠다는 의미이다.
		$.ajax({
			url : "./boardList2", 
			type : "get",
			data : {"pageNo" : 1}, // 페이징 대비해서 미리 보낸다
			dataType : "json",
			success: function(data){ // 성공했을 때
				alert("정상입니다. : " + data);
			},
			error: function(error){ // 실패했을 때
				alert("에러가 발생했습니다. : " + error);
			}
		});
		
		
		// const = 수정불가,  json 형태로 쓰려면 {}로 써야된다.
 		const list = [
 			{bno:10, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:9, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:8, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:7, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:6, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:5, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:4, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:3, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:2, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}, 
 			{bno:1, btitle:'제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike:15}
 			];
 			// []표시는 배열에 담겠다는 의미이다.
 			 
 		
 		// alert(list[i].btitle);
 		
 		for(let i = 0; i <list.length; i++) {
			$(".tableHead").append("<tr><td>"+list[i].bno+"</td><td>"+list[i].btitle+
					"</td><td>"+list[i].m_name+"</td><td>"+list[i].bdate+"</td><td>"+list[i].blike+"</td></tr>");	
 		}
 		
		<!-- append 기존의 글을 남겨두고 글 추가 -->
		
	});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<h1>보드2</h1>
	<table class="tableHead">
		<tr >
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>날짜</td>
			<td>읽음</td>
		</tr>
	</table>
</body>
</html>