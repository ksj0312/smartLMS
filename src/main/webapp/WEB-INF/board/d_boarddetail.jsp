<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세보기</title>
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
		<a href="getBoardList">목록</a>
		<a href="insertPage">추가</a>
		
		
		<script>
		function del(val){
			location.href = "deleteBoard?b_number="+val;
		}
			
		</script>
		
		
		
		
		
		
	
	<br><br><br><br><br><br><br><br><br>
	
</body>
</html>