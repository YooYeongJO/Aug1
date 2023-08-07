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
	
	// 댓글 삭제 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요. (8월 7일)
	function cdel(cno){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="./cdel?bno=${dto.bno}&cno="+cno;
		}
	}
	
	$(function(){  //JQuery 이용
		$(".commentBox").hide(); // class는 앞에 .이 붙는다. id는 #
		
		$("#openComment").click(function(){
			$(".commentBox").show('slow'); // 클릭을 하면 화면이 살아나요
			$("#openComment").remove();
		});
	
	
	// 댓글 삭제 다른 방법
	$(".cdel").click(function(){ // cdel이 class라 앞에 .을 붙여준다
		if(confirm("댓글을 삭제하시겠습니까?")){
			// alert("삭제합니다" + $(this).parent().siblings(".cid").text());
			
			let cno = $(this).parent().siblings(".cid").text();
			// $(this)는 이벤트를 트리거한 현재 요소를 가리킵니다. 
			// .parent()는 현재 요소의 부모 요소를 가져옵니다. 
			// .siblings(".cid")는 부모 요소의 모든 형제 요소들 중에서 클래스가 "cid"인 요소를 선택합니다. 
			// .text()는 선택된 요소의 텍스트 내용을 가져옵니다. 
			// 따라서 cno 변수에는 "cid" 클래스를 가진 형제 요소의 텍스트 값이 할당됩니다.
			
			let cno_comments = $(this).parents(".comment"); // 변수처리
			// 현재$(this) 요소를 기준으로 위로 올라가면서 모든 상위 요소들 중에서 클래스가 
			// "comment"인 요소들을 선택하여 변수 cno_comments에 저장합니다. 
			// 이후 cno_comments를 이용해 상위 요소들에 대해 다양한 작업을 수행할 수 있습니다.
			
			
			$.ajax({ // ajax 시작
				url: "./cdelR",
				type: "post",
				data : {bno:${dto.bno }, cno : cno},
				dataType: "json",			
				success: function(data){
					// alert(data.result);
					if(data.result == 1) {
						cno_comments.remove(); // 변수(cno_comments)에 담긴 html 삭제
						
					} else {
						alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");	
					}
				},
				error: function(error){
					alert("에러가 발생했습니다 " + error);
				}
				
			}); // ajax 끝 
			
			
			
			//location.href="./cdel?bno=${dto.bno }&cno="+cno;
			// 이 코드는 새로운 URL을 만들어서 페이지를 이동시키는 부분입니다.
			// 기본 URL은 "./cdel" 입니다. "./"은 현재 페이지가 있는 폴더를 의미하며, 
			// "cdel"은 해당 폴더 내의 "cdel" 파일을 가리킵니다.
			// ?는 URL에 쿼리 매개변수를 추가할 때 사용하는 구분자입니다.
			// bno=${dto.bno}는 URL에 "bno"라는 이름의 쿼리 매개변수를 추가합니다. 
			// dto라는 객체에서 bno라는 속성 값을 가져와서 사용합니다.
			// &는 두 개 이상의 쿼리 매개변수를 함께 사용할 때 구분하는 역할을 합니다.
			// "cno=" + cno는 cno 변수의 값을 URL에 "cno"라는 이름의 쿼리 매개변수로 추가합니다. 
			// 앞서 가져온 "cid" 클래스를 가진 요소의 텍스트 값이 이용됩니다.
			// 따라서 이 코드는 사용자가 어떤 동작을 하면, 현재 페이지에서 
			// "./cdel" 파일로 이동하면서 dto.bno와 cno라는 쿼리 매개변수를 함께 전달합니다. 
			// 이 때, dto.bno는 서버에서 처리되어야 할 변수이며, cno는 클라이언트 측에서 처리된 변수입니다. 
			// 이렇게 전달된 쿼리 매개변수는 "./cdel" 파일에서 사용되어 다른 작업을 수행할 수 있습니다.
			
		}
	}); 
	
	
	// 댓글 수정 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요. (8월 7일)
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
			<c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }"> <!-- ne(!=)  -->
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
							<div class="cname">${c.m_name }(${c.m_id })
								<c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }">
<!-- 									sessionScope.mid ne null 이걸 왜 붙이는 걸까... 문제해결 -->
									<img alt="" src="./img/update.png" onclick="cedit()">&nbsp; <!--수정 버튼   -->
			 						<img alt="" src="./img/trash.png" class="cdel" onclick="cdel1(${c.c_no })"> <!--삭제 버튼   -->
			 					</c:if>
			 				</div>
			<!-- 		위에 cdel은	댓글이 여러개 있는 경우 어떤 것을 삭제할지 모르니까 설정해주어야 한다 -->
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