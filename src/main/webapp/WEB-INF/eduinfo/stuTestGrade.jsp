<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${pageContext.request.contextPath }/resources/js/testList.js"></script> --%>
<title>학생 본인 성적 조회 </title>
</head>
<body>

<% if("교수".equals(usertype) || "관리자".equals(usertype)){ %>
        <%@ include file="../member/adminIndex.jsp"%>
    <%}else{ %>
   		<%@ include file="../member/taskIndex.jsp"%>
    <%} %>
<% Integer c_number = (Integer) request.getAttribute("c_number"); %>
<% String c_name = (String) request.getAttribute("c_name"); %>
<% String id = (String) request.getAttribute("userId"); %>
    
<div class="bcl">

        <div class="divall">
        <h4>학생 본인 성적 조회</h4>
        <br>

            <section class="header-container">
    					<h5>강의번호 :<%=c_number %> </h5>
    					<h5>강의명 : <%=c_name %></h5> 
                </section>
        <br><br>
				     <table class="table">
				        <tr>
				        <th>시험 이름</th>
				        <th>학번</th>
				        <th>점수</th>
				        <th>등급 </th>
				        
				        </tr>
				    <c:choose>
				     <c:when test="${grade ne null}">
				        <tr>
						<td>${test_type}</td>  
						<td>${grade.id}</td>  
						<td>${grade.level}</td>
						<td>${grade.grade}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>등록된 값이 없습니다</td>
						</tr>
					</c:otherwise>
					</c:choose>
						
						
					</table>
			
</div>
</div>

</body>
</html>