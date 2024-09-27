<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세보기</title>
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
		<a href="getBoardList?b_type=${board.b_type }">목록</a>
		<a href="insertPage">추가</a>
		
		
		<script>
		function del(val){
			const result = confirm("정말로 이 게시글을 삭제하시겠습니까?");
			 if (result) {
			        alert("삭제가 완료되었습니다.");
			        location.href = "deleteBoard?b_number=" + val;
			    } else {
			        // 취소 시 아무 작업도 하지 않음
			        alert("삭제가 취소되었습니다.");
			    }
		}
			
		</script>
		
		
		
		
		
		
	
	<br><br><br><br><br><br><br><br><br>
	
</body>
</html>