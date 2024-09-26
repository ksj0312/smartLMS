<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${pageContext.request.contextPath }/resources/js/testList.js"></script> --%>
<title>강의 목록</title>
</head>
<body>
<div class="bcl">
        <div class="divall">
        <h3>시험 목록</h3>
        
        <table class="table">
        <tr>
        <th>강의 번호</th>
        <th>시험 번호</th>
        <th>시험 타입</th>
        </tr>
 			<c:choose>
				<c:when test="${testListcnt != 0}">
					<c:forEach items="${tList}" var="tl">
					<tr onclick="location.href='grade?c_number=${tl.c_number}&g_number=${tl.g_number}'" style="cursor:hand" >
						<td>${tl.c_number}</td>  
						<td>${tl.g_number}</td>  
						<td>${tl.test_type}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<li><a class="atag" href="/"><small>-</small></a></li>
				</c:otherwise> 
			</c:choose> 
			</table>
			<br><br><br>
</div>
</div>
</body>
</html>