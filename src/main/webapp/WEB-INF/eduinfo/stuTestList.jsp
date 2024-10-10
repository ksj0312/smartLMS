<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 목록</title>
</head>
<body>

 <% if("교수".equals(usertype)){ %>
        <%@ include file="../member/adminIndex.jsp"%>
    <%}else{ %>
   		<%@ include file="../member/taskIndex.jsp"%>
    <%} %>
    <% String c_name = (String) request.getAttribute("c_name"); %>
    
<div class="bcl">
		
        <div class="divall">
        <h4>시험 목록</h4>
        <br>
            <section class="header-container">
    					<h5>강의번호 :<%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%=c_name %> </h5> 
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
					
					
					<tr onclick="location.href='/student/mygrade?c_number=${tl.c_number}&g_number=${tl.g_number}&test_type=${tl.test_type}&id=${userId }'" style="cursor:hand" >
						<td>${tl.c_number}</td>  
						<td>${tl.g_number}</td>  
						<td>${tl.test_type}</td>
						<td><fmt:formatDate value="${tl.start_time}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td><fmt:formatDate value="${tl.end_time}" pattern="yyyy-MM-dd HH:mm"/></td>

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
</div>
</div>
</body>
</html>