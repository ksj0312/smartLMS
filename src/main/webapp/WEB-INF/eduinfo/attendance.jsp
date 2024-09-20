<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>
<%@ page import="java.time.LocalDate" %>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/attendance.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/attendance.css">
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
                <c:if test="${not empty attendanceList}">
    					<h3>강의 번호 ${attendanceList[0].c_number}</h3>
				</c:if>
                        <h4>출석체크</h4>
                </section>
                <c:if test="${not empty msg}">
               <c:choose>
                		<c:when test="${msg eq 'success'}">
                			<h5 style="color:blue">출석 정보가 저장되었습니다.</h5>
                			</c:when>
                		<c:when test="${msg eq 'fail'}">
                			<h5  style="color:red">출석 등록에 실패하였습니다. 다시 시도해주세요.</h5>
                		</c:when>
                		<c:when test="${msg eq 'null'}">
                			<h5  style="color:red">데이터가 유효하지 않습니다. 다시 시도해주세요.</h5>
                		</c:when>
                		<c:otherwise>${msg} </c:otherwise>
                		</c:choose> 
                </c:if>
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
                  <form action="insertAttendance" method="POST">
                  <input type="date" name="a_date" id="a_date" value="${fn:substring(LocalDate.now().toString(), 0, 10)}">
                  <input type="number" name="c_number" value="${attendanceList[0].c_number}" style="display:none;"/>
                        <table class="table">
                                <tr>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>출결</th>
                                        <th>출결 수정</th>
                                        <th>출결 상태</th>
                                     
                                </tr>
                                <c:forEach items="${attendanceList}" var="stu">
                                <tr>
                                                <td class="tdCenter"><input type="text" name="id_${stu.id}"  value="${stu.id}" style="border:none;" readonly /></td>
                                                <td><input type="text" name="name_${stu.id}"  value="${stu.name}" style="border:none;" readonly/></td>
                                                <td>
                                               	    <%-- <input type='radio' name='a_status_${stu.id}' value='출석' ${stu.a_status == '출석' ? 'checked' : ''} />출석
													<input type='radio' name='a_status_${stu.id}' value='조퇴' ${stu.a_status == '조퇴' ? 'checked' : ''} />조퇴
													<input type='radio' name='a_status_${stu.id}' value='지각' ${stu.a_status == '지각' ? 'checked' : ''} />지각
													<input type='radio' name='a_status_${stu.id}' value='결석' ${stu.a_status == '결석' ? 'checked' : ''} />결석  --%>
														  <input type='radio' name='a_status_${stu.id}' value='출석' checked />출석
														  <input type='radio' name='a_status_${stu.id}' value='지각' />지각
														  <input type='radio' name='a_status_${stu.id}' value='조퇴' />조퇴
														  <input type='radio' name='a_status_${stu.id}' value='결석' />결석
                                                </td>
                                                <td> <button type="button" onclick="updateAttendance('${stu.id}', '${attendanceList[0].c_number}')"> 수정 </button> </td>
                                                </tr>
                                </c:forEach>
                        </table>
                        <button type="submit">등록</button>
                        </form>
                </section>
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
