<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
				<script src="${pageContext.request.contextPath }/resources/js/board.js"></script>

</head>
<body>
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
					<tr style="cursor: pointer;">
						<td>${board.b_number}</td>
						<td>${board.b_title}</td>
						<td>${board.b_info}</td>
						<td>${board.b_writer}</td>
						<td>${board.b_view}</td>
						
						<button onclick="board_del(${board.b_number})">삭제</button>
					</tr>
			</tbody>
		</table>
					<a href="downloadFile?filePath=${board.b_file1}">${board.b_file1}</a>
					
					
					
					<br><br><br><br><br><br><br><br><br><br>
					
					<style>
       				.toggleContent {
           				  opacity: 0; 
          				  transition: opacity 0.5s ease; 
            			  display: none; 
       								 }
     			   .toggleContent.visible {
    				      display: block; 
        				  opacity: 1; 
        }
    				</style>
					
					
					<button class="toggleButton">댓글</button>
				<div class="toggleContent hidden">
				
					<form action="insertComment" method="Post">
					<label for="b_nuimber">글번호:</label>
					<input type="text" name="b_number" value="${board.b_number}">
					
					<label for="id">아이디:</label>
					<input type="text" name="id" value="${userName}">
					
					<label for="co_info">내용:</label>
					<input type="text" name="co_info">
					
					<input type="submit" value="작성">
					
					</form>
					
					
					
					
			<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>내용</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
					<c:forEach items="${commentList}" var="comment">
				<tr>
						<td class="tdCenter">${comment.co_number}</td>
						<td>${comment.id}</td>
						<td class="tdCenter">${comment.co_info}</td>
						<td><button onclick="board_delComment(${comment.co_number})">삭제</button></td>
					</tr>
				</c:forEach>
						
			</tbody>
		</table>
		</div>
		
	
					
		<script>
		    const button = document.querySelector('.toggleButton');
	        const content = document.querySelector('.toggleContent');

	        button.addEventListener('click', function() {
	            if (content.classList.contains('visible')) {
	                content.classList.remove('visible'); // 보이는 상태에서 숨기기
	                setTimeout(() => {
	                    content.style.display = 'none'; // 완전히 숨김
	                }, 500); // 애니메이션 시간과 동일
	            } else {
	                content.style.display = 'block'; // 표시할 때
	                setTimeout(() => {
	                    content.classList.add('visible'); // 서서히 보이기
	                }, 10); // 조금 지연 후 클래스 추가
	            }
	        });
    </script>
		






		<br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br>
		<c:choose>
			<c:when test="${board.b_type eq '게시판'}">
					<a href="getBoardList?b_type=게시판">목록</a>

			</c:when>		
			<c:when test="${board.b_type eq 'QNA'}">
					<a href="getBoardList?b_type=QNA">목록</a>

			</c:when>				
		</c:choose>
		
		<a href="insertPage?b_type=${board.b_type }">추가</a>
		<button onclick="board_update(${board.b_number})">수정</button>
		
	<br><br><br><br><br><br><br><br><br>
	
</body>
</html>