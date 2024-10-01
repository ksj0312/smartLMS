<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/js/testclassList.js"></script>
<title>과제 등록 강의 목록</title>
</head>
<body>
<%	String status = (String)request.getAttribute("status");
 %>
 
  <%= status %>
<div class="bcl">
	
        <div class="divall">
         <input type="hidden" id="msg" value="${msg}" />
         <%if(status.equals("insert")){ %>
        <h4>과제 등록</h4>
        <%}else if(status.equals("check")){ %>
        <h4>과제 확인</h4>
        <%} %>
        <br><br>
         		<c:choose>
				<c:when test = "${classListcnt > 0}">
				   <table class="table">
			        <tr>
			        <th>강의번호</th>
			        <th>강의명</th>
			        <th>수강인원</th>
			        <th>강의요일</th>
			        <th>강의시간</th>
			        </tr>
					<c:forEach items="${classList}" var="cl">
					<%
					if(status.equals("insert")){
 						%> 
					<tr onclick="location.href='taskInsertPage?c_number=${cl.c_number}&c_name=${cl.c_name}'" style="cursor:hand">
					<%}else if(status.equals("check")){
 						%> 
					<tr onclick="location.href='taskSelectStu?c_number=${cl.c_number}&c_name=${cl.c_name}'" style="cursor:hand">
					<% }%>
					<td>${cl.c_number}</td>
					<td>${cl.c_name}</td>
					<td>${cl.c_stu_count}</td>
					<td>${cl.c_time}</td>
					<td>${cl.c_day}</td>
					</tr>
					</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
				<div class="nodiv">
				<h5>진행중인 강의가 없습니다.</h5>
				</div>
				</c:otherwise> 
				</c:choose>
</div>
</div>
</body>
</html>