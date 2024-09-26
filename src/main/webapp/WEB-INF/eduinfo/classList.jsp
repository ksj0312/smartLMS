<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
</head>
<body>
<div class="bcl">
        <div class="divall">
        <%-- <input type="date" name="a_date" id="a_date" value="${fn:substring(LocalDate.now().toString(), 0, 10)}"> --%>
        <h3>출석부 등록</h3>
 			<c:choose>
				<c:when test="${classListCnt != 0}">
					<c:forEach items="${classList}" var="cl">
						<li><a class="atag" href="todate?c_number=${cl.c_number}">${cl.c_name}</a></li>  
					</c:forEach>
				</c:when>
				<c:otherwise>
						<li><a class="atag" href="/"><small>-</small></a></li>
				</c:otherwise> 
			</c:choose> 
			<br><br><br>
</div>
</div>
</body>
</html>