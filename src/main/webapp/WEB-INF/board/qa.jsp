<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
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
			
				<c:forEach items="${boardList}" var="board" varStatus="status">
					<tr onclick="selTr(${board.b_number})" style="cursor: pointer;">
						<td class="tdCenter">${board.b_number}</td>
						<td>${board.b_title}</td>
						<td class="tdCenter">${board.b_info}</td>
						<td class="tdCenter">${board.b_writer}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<a href="insertPage">추가</a>
		
		
		<script>
		function selTr(val){
			location.href = "getBoard?b_number="+val;
		}
			
		</script>
		
		
	
	<br><br><br><br><br><br><br><br><br>
	
</body>
</html>