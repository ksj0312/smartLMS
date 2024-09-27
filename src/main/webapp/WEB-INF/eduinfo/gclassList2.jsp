<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/js/gclassList2.js"></script>
<title>강의 목록</title>
</head>
<body>
<div class="bcl">
        <div class="divall">
        <h3>성적 조회/수정</h3>
            <input type="hidden" id="msg" value="${msg}" />
 			<c:choose>
				<c:when test="${classListCnt != 0}">
					<c:forEach items="${classList}" var="cl">
						<li><a class="atag" href="gradeUpdatePage?c_number=${cl.c_number}">${cl.c_name}</a></li>  
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