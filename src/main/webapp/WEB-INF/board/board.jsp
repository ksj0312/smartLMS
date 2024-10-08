<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css"></script>


</head>
<body>
<div class="boarddiv">
<div class= "divall">


		
		  <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark" style="justify-content: space-between;">
<c:if test="${pagination.b_type eq 'QNA' }">
	<c:if test="${userId ne null }">
		<a class="b_insert_btn" href="/boardpage?b_type=${pagination.b_type }">글쓰기</a>
		</c:if>
		</c:if>
                        <form class="form-inline" action="/board" method="get">
                                <select name="searchType" class="form-control mr-sm-2">
                                        <option value="b_info">내용</option>
                                        <option value="b_title">제목</option>
                                </select> <input class="form-control mr-sm-2" type="text" name="keyword"
                                        autocomplete="off" placeholder="검색어를 입력하세요.">
                                		<input value="${pagination.b_type}" name="b_type" style="display:none">
                                <button class="btn btn-success" type="submit">검색</button>
                        </form>
                </nav>
       <div class="b_table_container">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
			
				<c:forEach items="${boardList}" var="board" varStatus="status">
					<tr onclick="sel_board(${board.b_number})" style="cursor: pointer;">
						<td class="tdCenter">${board.b_rownum}</td>
						<td class="tdCenter">${board.b_title}</td>
						<td class="tdCenter">${board.b_name}</td>
						<td class="tdCenter">${board.b_view}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
       </div>
		
		<section class="contents-footer">
                        <div>
                                <nav aria-label="Page navigation example" style="margin: auto;">
                                        <ul class="pagination justify-content-center">
                                                <c:if test="${pagination.prev}">
                                                        <li class="page-item"><a class="page-link" id="page-btn" href="#"
                                                                onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
                                                </c:if>
                                                <c:forEach begin="${pagination.startPage}"
                                                        end="${pagination.endPage}" var="idx">
                                                        <li class="page-item">
                                                         <a class="page-link ${pagination.currPageNo == idx ? 'active' : ''}" id="page-btn${idx}" href="#" onClick="fn_pagination('${idx}', '${pagination.range}')">
       														 ${idx}  </a>
                                                        </li>
                                                </c:forEach>
                                                <c:if test="${pagination.next}">
                                                        <li class="page-item"><a class="page-link" id="page-btn" href="#"
                                                                onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
                                                </c:if>
                                        </ul>
                                     
                                </nav>
                        </div>
                        <div id="paginationData" data-searchType="${pagination.searchType}" data-keyword="${pagination.keyword}"></div>
                </section>
				<script src="${pageContext.request.contextPath }/resources/js/board.js"></script>
		
	
	<br><br><br><br><br><br><br><br><br>
	</div>
	</div>
</body>
</html>