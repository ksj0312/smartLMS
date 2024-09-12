<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
				</tr>
			</thead>
			
			<tbody>
					<tr style="cursor: pointer;">
						<td>${board.b_number}</td>
						<td>${board.b_title}</td>
						<td>${board.b_info}</td>
						<td>${board.b_writer}</td>
						<button onclick="del(${board.b_number})">삭제</button>
					</tr>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${board.b_type eq '게시판'}">
					<a href="getBoardList?b_type=게시판">목록</a>

			</c:when>		
			<c:when test="${board.b_type eq 'QNA'}">
					<a href="getBoardList?b_type=QNA">목록</a>

			</c:when>				
		</c:choose>
		
		<a href="insertPage">추가</a>
		<button onclick="update(${board.b_number})">수정</button>
		
		
		<script>
		function del(val){
			location.href = "deleteBoard?b_number="+val;
		}
		
		function update(val){
			location.href = "updatePage?b_number="+val;
		}
			
		</script>
		
		
		
		
		
		
	
	<br><br><br><br><br><br><br><br><br>
	
</body>
</html>