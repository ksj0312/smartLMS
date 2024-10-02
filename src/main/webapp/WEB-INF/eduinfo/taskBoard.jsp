<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${pageContext.request.contextPath }/resources/js/testList.js"></script> --%>
<title>과제 게시판</title>
</head>
<body>

	<% if("교수".equals(usertype) || "관리자".equals(usertype)){ %>
        <%@ include file="../member/adminIndex.jsp"%>
    <%}else{ %>
   		<%@ include file="../member/taskIndex.jsp"%>
    <%} %>
    
	<% Integer c_number = (Integer) request.getAttribute("c_number"); %>
	<%String c_name = (String) request.getAttribute("c_name");%>

	<div class="bcl">
		<div class="divall">
			<h4>과제 게시판</h4>
			<br>
			<section class="header-container">
				<h5>
					강의번호 <%=c_number%>
				</h5>
				<h5>
					강의명 : <%=c_name%></h5>
			</section>
			<br>
			<br>

			<table class="table">
				<tr
					onclick="location.href='taskBoard?c_number=${tl.c_number}&t_number=${tl.t_number}'"
					style="cursor: hand">

					<th>강의 번호</th>
					<th>작성자</th>
					<th>과제 제목</th>
					<th>과제 내용</th>
					<th>종료 시간</th>
				</tr>
				<tr>
					<td>${task.c_number}</td>
					<td>${task.id}</td>
					<td>${task.title}</td>
					<td>${task.info}</td>
					<td>${task.deadline}</td>
				</tr>
			</table>



			<table class="table">
				<tr>
					<th>강의 번호</th>
					<th>작성자</th>
					<th>과제 번호</th>
					<th>과제 제목</th>
					<th>과제 내용</th>
					<th>파일</th>
				</tr>
				<tr>
					<td>${stutask.c_number}</td>
					<td>${stutask.id}</td>
					<td>${stutask.t_number}</td>
					<td>${stutask.st_title }</td>
					<td>${stutask.st_info }</td>
					<td>
					<a href="downloadFile?filePath=${stutask.s_file1}">${stutask.s_file1}</a></td>
				</tr>
			</table>
				<button onclick="location.href='insertStuTaskPage?c_number=${task.c_number}&t_number=${task.t_number}'"
					style="cursor: hand">등록</button>
					
				<button onclick="location.href='stuTaskUpdatePage?st_number=${stutask.st_number}'">수정하기</button>








			<div class="nodiv">
				<h5>진행중인 과제 목록이 없습니다.</h5>
			</div>
		</div>
	</div>
</body>
</html>