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
		// var list = [];  // 보드 내용 가져오기
		// []표시는 배열에 담겠다는 의미이다.
		
		let totalCount = 0; // 전체 글 수가 몇개야??
		let pageNo = 1;
		
		// ajax 호출
		ajax_call(1);
		function ajax_call(pageNo) {
			// alert(pageNo);
			$.ajax({ // ajax 시작
				url : "./boardList2",  //http://localhost/boardList2?pageNo=1
				type : "get",
				data : {"pageNo" : pageNo}, // 페이징 대비해서 미리 보낸다
				dataType : "json",
				success: function(data){ // 성공했을 때
					// alert("정상입니다. : " + data.list[0].btitle);
					totalCount = data.totalCount;
					pageNo = data.pageNo; // 위에 있는 let pageNo 값으로 저장한다
					let startPage = pageNo; // 페이지 시작
					let endPage = pageNo + 9; // 페이지 끝
					
					// console.log(totalCount);
					let list = data.list;
					// console.log(list);
					
					$(".tableHead").empty();// 수정했습니다.
					$(".paging").empty();// 수정했습니다.
					let html = "";
					
					$.each(list, function(index){
						html += "<tr>";
						html += "<td>" + list[index].bno + "</td>";
						html += "<td>" + list[index].btitle + "</td>";
						html += "<td>" + list[index].m_name + "</td>";
						html += "<td>" + list[index].bdate + "</td>";
						html += "<td>" + list[index].blike + "</td>";
						html += "</tr>";
					});
					$(".tableHead").append(html);
					<!-- append 기존의 글을 남겨두고 글 추가 -->
					
					// 페이징하기
					//$(".paging").text(data.pageNo + ":" + data.totalCount); // data.pageNO 현재 내 페이지는??
					// data.pageNo 값과 data.totalCount 두 개 찍어준다
					
					let pages = totalCount / 10; 
					// 페이징 계산하기 (전체글 수를 보여주면 몇 개의 페이징이 보여지는지)
										
					if(totalCount % 10 != 0){pages += 1;}
					startPage = pageNo;
					endPage = startPage + 10 < pages ? startPage + 9 : pages;
					
					//    << < 1 2 3 4 5 6 7 8 9 10 > >>
					if(pageNo - 10 > 0){
						$(".paging").append("<button class='start'>◀◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀◀</button>");
						//버튼을 클릭했을 때 끝에 도달했을 때 비활성화 시키기 
					}
					if(pageNo - 1 > 0){
						$(".paging").append("<button class='backward'>◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀</button>");
					}
					for (let i=startPage; i <= endPage; i++) {
						$(".paging").append("<button type='button' class='page'>" + i + "</button>");
						// 버튼을 클릭하면 pageNo가 이동할 수 있게 하겠습니다.
					}
					if(pageNo + 1 < pages){						
						$(".paging").append("<button class='forward'>▶</button>");
						//버튼을 클릭했을 때 이벤트 주기
					}else{
						$(".paging").append("<button disabled='disabled'>▶</button>");
					}
					if(pageNo + 10 < pages){
						$(".paging").append("<button class='end'>▶▶</button>");
						// 버튼을 클릭했을 때 페이징 끝으로 
					}else{
						$(".paging").append("<button disabled='disabled'>▶▶</button>");
					}
						
				},
				error: function(error){ // 실패했을 때
					alert("에러가 발생했습니다. : " + error);
				}
			}); // ajax 끝	
		}// ajax call
				
		$(document).on("click", ".page", function() { // 동적으로 생성된 버튼 클릭하기
			pageNo = $(this).text(); //this는 내가 클릭한 녀석에 대해서 값을 가져온다
			ajax_call(pageNo); 
		});
		
		$(document).on("click", ".start", function(){
			pageNo = pageNo - 10;
			ajax_call(pageNo);
		});
		$(document).on("click", ".backward", function(){
			pageNo = pageNo - 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".forward", function(){ // forward는 class라 .을 찍는다 id는 #
			pageNo = pageNo + 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".end", function(){
			pageNo = pageNo + 10;
			ajax_call(pageNo);
		});
		
		// const = 수정불가,  json 형태로 쓰려면 {}로 써야된다.
 		
 		// []표시는 배열에 담겠다는 의미이다.	 
 		
 		// alert(list[i].btitle);	
	});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="board-div">
	<h1>보드2</h1>
	<table>
		<thead>
		<tr>
			<td class="td1">번호</td>
			<td class="title">제목</td>
			<td class="td1">글쓴이</td>
			<td class="td2">날짜</td>
			<td class="td1">읽음</td>
		</tr>
		</thead>
	<tbody class="tableHead"></tbody>
	</table>
	<div class="paging"></div>
</div>
</body>
</html>