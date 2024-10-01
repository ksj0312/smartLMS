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
        
				     <table class="table">
				        <tr>
				        <th>과제 번호</th>
				        <th>작성자</th>
				        <th>과제 제목</th>
				        <th>과제 내용 </th>
				        <th>종료 시간</th>
<!-- 				        <th>완료 여부</th> -->
				        
				        </tr>
					<c:forEach items="${stutaskList}" var="stl">
					<tr onclick="location.href='taskBoard?c_number=${stl.c_number}&t_number=${stl.t_number}$id${stl.id}'" style="cursor:hand" >
						<td>${stl.c_number}</td>  
						<td>${stl.id}</td>  
						<td>111</td>
						<td>${stl.st_submit}</td>
						<td>${stl.s_file1}</td>
						
<%-- 						<td id="taskStatus_${tl.t_number}"></td> --%>
						</tr>
					</c:forEach>
					</table>
				<div class="nodiv">
				<h5>진행중인 과제 목록이 없습니다.</h5>
				</div>
</div>
</div>


</body>
</html>