<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${pageContext.request.contextPath }/resources/js/gredaUpdatePage.js"></script> --%>
<title>강의 목록</title>
</head>
<body>
<div class="bcl">
        <div class="divall">
        <h4>성적 조회/수정 시험 목록</h4>
        <br>
           <section class="header-container">
    					<h5>강의번호 :<%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%= request.getParameter("c_name") %></h5> 
                </section>
   		<br><br>
 			<c:choose>
				<c:when test="${testListcnt > 0}">
				     <table class="table">
				        <tr>
				        <th>강의 번호</th>
				        <th>시험 번호</th>
				        <th>시험 구분</th>
				        <th>시작 일시 </th>
				        <th>종료 일시</th>
				        </tr>
					<c:forEach items="${tList}" var="tl">
					<tr onclick="location.href='gradeList?c_number=${tl.c_number}&g_number=${tl.g_number}&test_type=${tl.test_type}'" style="cursor:hand" >
						<td>${tl.c_number}</td>  
						<td>${tl.g_number}</td>  
						<td>${tl.test_type}</td>
						<td>${tl.start_time}</td>
						<td>${tl.end_time}</td>
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
			<br><br><br>
</div>
</div>
</body>
</html>