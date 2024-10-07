<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
<script src="${pageContext.request.contextPath }/resources/js/classAllList.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/classAllList.css"> --%>

</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
                        <h4>공지사항 목록</h4>
                </section>
    			 <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                        <form class="form-inline" action="/boardadmin" method="get">
                                <select name="searchType" class="form-control mr-sm-2">
                                        <option value="b_info">내용</option>
                                        <option value="b_title">제목</option>
                                </select> <input class="form-control mr-sm-2" type="text" name="keyword"
                                        autocomplete="off" placeholder="검색어를 입력하세요.">
                                        <input value="${pagination.b_type}" name="b_type" style="display:none">
                                <button class="btn btn-success" type="submit">검색</button>
                        </form>
                </nav>
                <section class="contents-container">
                        <table class="table">
                                <tr>
                                    <th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>상세보기</th>
                                </tr>
                                <c:forEach items="${boardList}" var="board">
                                <tr class="tdCenter">
                                                <td>${board.b_number}</td>
                                                <td>${board.b_title}</td>
                                                <td>${board.b_name}</td>
                                                <td>${board.b_view}</td>
                                                <td><button type="button" class="btn classInfo" id="classClick"
											data-toggle="modal" data-target="#classInfo" value="${board.b_number}">상세보기</button></td>
                                                </tr>
                                </c:forEach>
                        </table>
                </section>
                
              	<div class="modal fade" id="classInfo" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" data-backdrop='static'
				aria-hidden="true">
				<%@ include file="../eduinfo/classInfo.jsp" %>
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
                
        </div>
</div>

</body>
</html>