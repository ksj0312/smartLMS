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

<% if("교수".equals(usertype) || "관리자".equals(usertype)){ %>
        <%@ include file="../member/adminIndex.jsp"%>
    <%}else{ %>
   		<%@ include file="../member/taskIndex.jsp"%>
    <%} %>

<% Integer c_number = (Integer) request.getAttribute("c_number"); %>
<% String c_name = (String) request.getAttribute("c_name"); %>
    
<div class="bcl">
        <div class="divall">
        <h4>해당 과제를 제출한 학생 목록</h4>
        <br>
            <section class="header-container">
    					<h5>강의번호 :<%=c_number %> </h5>
    					<h5>강의명 : <%=c_name %></h5> 
                </section>
        <br><br>
        
        <c:if test="${not empty stutaskList}">
        
				     <table class="table">
				        <tr>
				        <th>과제 번호</th>
				        <th>학번</th>
				        <th>이름</th>
				        <th>과제 제출 현황 </th>
<!-- 				        <th>완료 여부</th> -->
				        
				        </tr>
					<c:forEach items="${stutaskList}" var="stl">
					<c:if test="${stl.st_submit eq '제출'}">
					<tr onclick="location.href='taskBoard?c_number=${stl.c_number}&t_number=${stl.t_number}&id=${stl.id}'" style="cursor:hand" >
					</c:if>
						<td>${stl.c_number}</td>  
						<td>${stl.id}</td>  
						<td>${stl.name}</td>  
						
						<c:if test="${stl.st_submit eq '제출'}">
							<td><img class="taskcheck" src="${pageContext.request.contextPath}/resources/img/check.png"> </td>
							
						</c:if>
						
						<c:if test="${stl.st_submit ne '제출'}">
							<td><img class="taskcheck" src="${pageContext.request.contextPath}/resources/img/cancle.png"> </td>
						</c:if>
						
<%-- 						<td>${stl.s_file1}</td> --%>
						
<%-- 						<td id="taskStatus_${tl.t_number}"></td> --%>
						</tr>
					</c:forEach>
					</table>
					
					</c:if>
					
				<c:if test="${empty stutaskList}">
				<div class="nodiv">
				<h5>제출된 과제가 없습니다.</h5>
				</div>
				</c:if>
				
</div>
</div>
<style>
	.taskcheck{
		width : 30px;
	}
</style>

</body>
</html>