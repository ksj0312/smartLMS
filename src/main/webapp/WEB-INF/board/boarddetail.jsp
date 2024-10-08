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

<input class="b_type" value="${board.b_type }" style="display : none;">

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
					<a class="downtag" href="/downloadFile?fileName=${board.b_file1}">${board.b_file1}</a>
				</c:if>
        	</th>
        </tr>
    </table>
   
   
   <div class="board_option_button">
   			
   			


		<c:choose>
			<c:when test="${board.b_type eq '게시판'}">
					<a href="/board?b_type=게시판"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
				</svg></a>

			</c:when>		
			<c:when test="${board.b_type eq 'QNA'}">
					<a href="/board?b_type=QNA"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
				</svg></a>

			</c:when>				
		</c:choose>

   			<c:if test="${board.b_id eq userId  }">
				<button class="btn b_option_btn" onclick="board_del(${board.b_number})">삭제</button>
				<button class="btn b_option_btn" onclick="board_update(${board.b_number})">수정</button>
			</c:if>
		<br>
		</div>

					
			<table class="comment_table">
				<tr class="comment_bar">
					<th>댓글</th>
				</tr>
			
			<tbody>
					<c:forEach items="${commentList}" var="comment">
				<tr class="comment_tr">
<%-- 						<td class="">${comment.co_number}</td> --%>
						<td>
						<span>${comment.name}</span>&nbsp;<span>${comment.format_create_date }</span>
						<p style="width:850px;">${comment.co_info}</p>
						<c:if test="${comment.id eq userId }">
						<span><a class="comment_del_button" onclick="board_delComment(${comment.co_number})">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  						<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
						</svg></a></span>
						</c:if>
						
						
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		
<!-- 		댓글 페이징 -->
		<section class="contents-footer">
                        <div>
                                <nav aria-label="Page navigation example" style="margin: auto;">
                                        <ul class="pagination justify-content-center">
                                                <c:if test="${pagination.prev}">
                                                        <li class="page-item"><a class="page-link" id="page-btn" href="#"
                                                                onClick="fn_prev_comment('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
                                                </c:if>
                                                <c:forEach begin="${pagination.startPage}"
                                                    end="${pagination.endPage}" var="idx"> 
                                                        <li class="page-item">
                                                        <a class="page-link ${pagination.currPageNo == idx ? 'active' : ''}" id="page-btn${idx}" href="#" onClick="fn_pagination_comment('${idx}', '${pagination.range}', '${board.b_number }')"> 
        														 ${idx}  </a> 
                                                     </li> 
                                             </c:forEach> 
                                                <c:if test="${pagination.next}"> 
                                                        <li class="page-item"><a class="page-link" id="page-btn" href="#" 
                                                              onClick="fn_next_comment('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li> 
                                                 </c:if> 
                                       </ul> 
                                     
                                </nav> 
                        </div> 
                        <div id="paginationData" data-searchType="${pagination.searchType}" data-keyword="${pagination.keyword}"></div> 
                 </section> 
                 
		
				<c:if test="${userId ne null }">
				<form action="/comment" method="Post" class="comment_form">
					<input type="text" name="b_number" class="comment_hide" value="${board.b_number}">
					
					<input type="text" name="id" class="comment_hide" value="${userId}">
					
					<input type="text" name="name" class="comment_hide" value="${userName}">
					
					
					<div class="comment_info_box">
						<textarea class="comment_info" cols="30" rows="10" name="co_info" placeholder="댓글을 입력해주세요"></textarea>
						<input class="comment_button" type="submit" value="등록">
					</div>
					
					
				</form>
				
				</c:if>
				<c:if test="${userId eq null }">
					<form action="/student" method="Get">
					<input type="text" name="b_number" class="comment_hide" value="${board.b_number}">
					
					<input type="text" name="id" class="comment_hide" value="${userId}">
					
					<input type="text" name="name" class="comment_hide" value="${userName}">
					
					
					<div class="comment_info_box">
						<textarea class="comment_info" cols="30" rows="10" name="co_info" placeholder="로그인 후 이용해주세요" readOnly></textarea>
						<input class="comment_button" type="submit" value="등록">
					</div>
					
					
				</form>
				</c:if>
		
		 </div>
		
	
					








	
</body>
</html>