<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css"></script>
<script src="${pageContext.request.contextPath }/resources/js/board.js"></script>

</head>
<body>
	<div class="tdiv">
	<table class="btable">
        <tr class="btr trbar">
            <th class="bth btitle_bar bar">제목</th>
            <th class="bth btitle">${board.b_title}</th>
        </tr>
        <tr>
            <th class="bth bdate_bar bar">게시일</th>
            <th class="bth bdate"><span>${b_create_date }</span><span class="span_view"><img class="img_view" src="${pageContext.request.contextPath }/resources/img/view.png">&nbsp; ${board.b_view}</span></th>
        </tr>
        <tr class="btr trinfo">
            <th class="bth binfo_bar bar">내용</th>
            <th class="bth binfo">${board.b_info}</th>
        </tr>
        <tr class="btr trfile">
        	<th class="bth file_bar bar">파일</th>
        	<th class="bth file">
        		<c:if test="${board.b_file1 eq null }">
					<span>파일이 첨부되지 않았습니다</span>
				</c:if>
				<c:if test="${board.b_file1 ne null }">
					<a class="downtag" href="downloadFile?fileName=${board.b_file1}">${board.b_file1}</a>
				</c:if>
        	</th>
        </tr>
    </table>
   
						<button onclick="board_del(${board.b_number})">삭제</button>
						
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
		
		
		<br>
						
					
					
			<table class="comment_table">
<!-- 			<thead class="btn-primary"> -->
				<tr class="comment_bar">
					<th>댓글</th>
<!-- 					<th>아이디</th> -->
<!-- 					<th>내용</th> -->
<!-- 					<th>버튼</th> -->
				</tr>
<!-- 			</thead> -->
			
			<tbody>
					<c:forEach items="${commentList}" var="comment">
				<tr class="comment_tr">
<%-- 						<td class="">${comment.co_number}</td> --%>
						<td>
						<span>${comment.name}</span>&nbsp;<span>${comment.format_create_date }</span>
						<p>${comment.co_info}</p>
						</td>
						<td><button class="comment_del_button" onclick="board_delComment(${comment.co_number})">삭제</button></td>
					</tr>
				</c:forEach>
						
			</tbody>
		</table>
		
		

		
				
				<form action="insertComment" method="Post">
					<input type="text" name="b_number" class="comment_hide" value="${board.b_number}">
					
					<input type="text" name="id" class="comment_hide" value="${userId}">
					
					<input type="text" name="name" class="comment_hide" value="${userName}">
					
					
					<div class="comment_info_box">
						<textarea class="comment_info" cols="30" rows="10" name="co_info" placeholder="댓글을 입력해주세요"></textarea>
						<input class="comment_button" type="submit" value="등록">
					</div>
					
					
				</form>
		
		 </div>
		
	
					








	
</body>
</html>