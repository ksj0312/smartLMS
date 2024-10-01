<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${pageContext.request.contextPath }/resources/js/testList.js"></script> --%>
<title>강의 목록</title>
</head>
<body>
<% if("교수".equals(usertype)){ %>
        <%@ include file="../member/adminIndex.jsp"%>
    <%}else{ %>
   		<%@ include file="../member/taskIndex.jsp"%>
    <%} %>
    
<div class="bcl">
        <div class="divall">
        <h4>과제 목록</h4>
        <br>
            <section class="header-container">
    					<h5>강의번호 :<%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%= request.getParameter("c_name") %></h5> 
                </section>
        <br><br>
        
        <c:choose>
				<c:when test="${taskListcnt > 0}">
				     <table class="table">
				        <tr>
				        <th>강의 번호</th>
				        <th>작성자</th>
				        <th>과제 제목</th>
				        <th>과제 내용 </th>
				        <th>종료 시간</th>
				        </tr>
					<c:forEach items="${taskList}" var="tl">
<%-- 					<tr onclick="location.href='grade?c_number=${tl.c_number}&t_number=${tl.t_number}" style="cursor:hand" > --%>
						<td>${tl.c_number}</td>  
						<td>${tl.id}</td>  
						<td>${tl.title}</td>
						<td>${tl.info}</td>
						<td>${tl.deadline}</td>
						</tr>
					</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
				<div class="nodiv">
				<h5>진행중인 과제 목록이 없습니다.</h5>
				</div>
				</c:otherwise> 
			</c:choose> 
</div>
</div>
</body>
</html>