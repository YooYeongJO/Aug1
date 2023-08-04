<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/detail.css">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css?version=10">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript"> 
<!-- 자바스크립트는 닫는 head 위쪽에 적는다 -->
	function edit() {
		if(confirm("수정하시겠습니까?")) { // 참 거짓으로 나옵니다.
			location.href="./edit?bno=${dto.bno }";
		}
	}

	function del() {
		let chk = confirm("삭제하시겠습니까?"); // 참 거짓으로 나옵니다.
		// alert(chk);
		if(chk) {
			location.href="./delete?bno=${dto.bno }";
			//http://172.30.1.53/delete?bno=121;
		}
	}
	$(function(){  //JQuery 이용
		$(".commentBox").hide(); // class는 앞에 .이 붙는다. id는 #
		
		$("#openComment").click(function(){
			$(".commentBox").show('slow'); // 클릭을 하면 화면이 살아나요
			$("#openComment").remove();
		});
	});
	
	
	
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
<h1>상세보기</h1>
<!-- 2023-07-18 / 데이터베이스 구현 / 메뉴만들기, 글쓰기 -->
	<div class="detail-content">
		<div class="title">
			${dto.bno } / ${dto.btitle }
			<c:if test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }"> <!-- ne(!=)  -->
<!-- 			            mid가 null 아니야??         dto 안에 m_id가 들어 있어?? -->
 			<img alt="" src="./img/update.png" onclick="edit()"> <!--수정 버튼   -->
			&nbsp; <img alt="" src="./img/trash.png" onclick="del()"> <!--삭제 버튼   -->
			</c:if>
			
		</div>
		<div class="name-bar">
			<div class="name">${dto.m_name }님</div>
			<div class="like">${dto.blike }</div>
			<div class="date">${dto.bdate }</div>
			<div class="ip">${dto.bip }</div>
		</div>
		<div class="content">${dto.bcontent }</div>
		<div class="commentList">
		<c:choose>
			<c:when test="${fn:length(commentList) gt 0 }"> <!--  댓글이 있을때 -->   
			<div class="comments"> 
				<c:forEach items="${commentList }" var="c">
					<div class="comment">
						<div class="commentHead">
							<div class="cname">${c.m_name }(${c.m_id })</div>
							<div class="cdate">${c.c_date }</div>
							<div class="cid">${c.c_no }</div>
						</div>
						<div class="commentBody">${c.c_comment }</div>	
					</div>
				</c:forEach>    
			</div>
			</c:when>
			
			<c:otherwise> <!--  댓글이 없을 때 -->
				<div><h2>댓글이 없습니다.</h2></div>
			</c:otherwise> 
			
		</c:choose>
		</div>
		
		
		<c:if test="${sessionScope.mid ne null }"> <!-- ne 다르다면 -->
		<button type="button" id="openComment">댓글창 열기</button>
		<!--  댓글쓰기 창 만들기 -->
		<div class="commentBox">
			<form action="./comment" method="post">
				<textarea id="commenttextarea" name="comment" placeholder="댓글을 입력하세요"></textarea>
				<button type="submit" id="comment">글쓰기</button>
				<input type="hidden" name="bno" value="${dto.bno }"> 
				<!-- value 값은 bno가 가져간다 -->
			</form>
		</div>
		</c:if>
	</div>
	
	
	
	
	
	
</body>
</html>