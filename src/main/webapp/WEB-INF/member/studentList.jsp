<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>
<%@ page import="java.time.LocalDate" %>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/studentList.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studentList.css">
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
                        <h4>학생 정보</h4>
                </section>
                <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                        <form class="form-inline" action="attendance" method="get">
                                <select name="searchType" class="form-control mr-sm-2">
                                        <option value="name">이름</option>
                                        <option value="id">학번</option>
                                </select> <input class="form-control mr-sm-2" type="text" name="keyword"
                                        autocomplete="off" placeholder="검색어를 입력하세요.">
                                <button class="btn btn-success" type="submit">검색</button>
                        </form>
                </nav>
                <section class="contents-container">
                  <input type="number" name="c_number" value="${attendanceList[0].c_number}" style="display:none;"/>
                        <table class="table">
                                <tr>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>학과</th>
                                        <th>학년</th>
                                        <th>상세정보</th>
                                     
                                </tr>
                                <c:forEach items="${stuList}" var="stu">
                                <tr class="tdCenter">
                                                <td>${stu.id}</td>
                                                <td>${stu.name}</td>
                                                <td>${stu.department}</td>
                                                <td>${stu.grade}</td>
                                                <td><button type="button" class="btn stuInfo" id="stuInfo"
											data-toggle="modal" data-target="#myModal" value="${stu.id}">정보 보기</button></td>
                                                </tr>
                                </c:forEach>
                        </table>
                </section>
                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" data-backdrop='static'
				aria-hidden="true">
				<%@ include file="stuInfo.jsp"%>
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
