<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
</head>
<body>
<div class="bcl">
        <div class="divall">
        <h4>시험 목록</h4>
        <br>
            <section class="header-container">
    					<h5>강의번호 :<%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%= request.getParameter("c_name") %></h5> 
                </section>
        <br><br>
        
              <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                        <form class="form-inline" action="/professor/test/classlist/test" method="get">
                                <select name="searchType" class="form-control mr-sm-2">
                                        <option value="g_number">시험번호</option>
                                        <option value="test_type">시험구분</option>
                                </select> <input class="form-control mr-sm-2" type="text" name="keyword"
                                        autocomplete="off" placeholder="검색어를 입력하세요.">
                                <input type = "text" id= "c_number" name="c_number" value=" <%= request.getParameter("c_number") %>" style="display:none;"/>
                                <input type = "text" id= "c_name" name="c_name" value=" <%= request.getParameter("c_name") %>" style="display:none;"/>
                                <button class="btn btn-success" type="submit">검색</button>
                        </form>
                </nav>

        <c:choose>
				<c:when test="${testListcnt > 0}">
				     <table class="table">
				        <tr>
				        <th>강의 번호</th>
				        <th>시험 번호</th>
				        <th>시험 구분</th>
				        <th>시작 일시 </th>
				        <th>종료 일시</th>
				        <th>수정</th>
				        </tr>
					<c:forEach items="${tList}" var="tl">
					<tr>
<%-- 					<tr onclick="location.href='test?g_number=${tl.g_number}'" style="cursor:hand" > --%>
						<td>${tl.c_number}</td>  
						<td>${tl.g_number}</td>  
						<td>${tl.test_type}</td>
						<td><fmt:formatDate value="${tl.start_time}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td><fmt:formatDate value="${tl.end_time}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>
						<button type="button" class="btn" id="testInfo" data-toggle="modal" data-target="#testMo" value="${tl.g_number}" onclick="testInfo('${tl.g_number}')">정보 보기</button>
						</td>
						</tr>
					</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
				<div class="nodiv">
				<h5>진행중인 시험 목록이 없습니다.</h5>
				</div>
				</c:otherwise> 
			</c:choose> 
			
			  <div class="modal fade" id="testMo" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" data-backdrop='static'
				aria-hidden="true">
				<%@ include file="testInfo.jsp"%>
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
<script src="${pageContext.request.contextPath }/resources/js/testList2.js"></script> 
</html>