<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${pageContext.request.contextPath }/resources/js/testList.js"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/taskBoard.css">

<title>과제 게시판</title>
</head>
<body>

	<%
	if ("교수".equals(usertype) || "관리자".equals(usertype)) {
	%>
	<%@ include file="../member/adminIndex.jsp"%>
	<%
	} else {
	%>
	<%@ include file="../member/taskIndex.jsp"%>
	<%
	}
	%>

	<%
	Integer c_number = (Integer) request.getAttribute("c_number");
	%>
	<%
	String c_name = (String) request.getAttribute("c_name");
	%>

	<div class="bcl">
		<div class="divall">
			<h4>과제 게시판</h4>
			<br>
			<section class="header-container">
				<h5>
					강의번호
					<%=c_number%>
				</h5>
				<h5>
					강의명 :
					<%=c_name%></h5>
			</section>
			<br> <br>

			<table class="table task_board_table">
				<tr>
					<th>강의 번호</th>
					<td>${task.c_number}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${task.id}</td>
				</tr>
				<tr>
					<th>과제 제목</th>
					<td>${task.title}</td>
				</tr>
				<tr class="task_info">
					<th>과제 내용</th>
					<td>${task.info}</td>
				</tr>
				<tr>
					<th>종료 시간</th>
					<td><fmt:formatDate value="${task.deadline}"
							pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>
				
				<tr>
					<th>파일</th>
					<td><a href="/downloadFile?fileName=${task.t_file1}">${task.t_file1}</a></td>
				</tr>
				
			</table>
			<c:if test="${task.id eq userId}">
				<button class="btn stutask_btn"
					onclick="location.href='/task/chan?t_number=${task.t_number}'">수정하기</button>
			</c:if>
			


			<c:if test="${stutask.c_number ne null}">
			<table class="table task_board_table" style="margin-top: 50px;">
				<tr>
					<th>강의 번호</th>
					<td>${stutask.c_number}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${stutask.id}</td>
				</tr>
				<tr>
					<th>과제 제목</th>
					<td>${stutask.st_title}</td>
				</tr>
				<tr>
					<th class="task_info">과제 내용</th>
					<td>${stutask.st_info}</td>
				</tr>
				<tr>
					<th>파일</th>
					<td><a href="/downloadFile?fileName=${stutask.s_file1}">${stutask.s_file1}</a>
					</td>
				</tr>
			</table>
			</c:if>
			
			
			
			<c:if test="${stutask eq null}">
				<div class="nodiv" style="margin : 100px;">
					<h5>작성한 과제가 없습니다.</h5>
				</div>
			</c:if>
			<c:if test="${stutask.id eq null}">
				<button class="btn stutask_btn"
					onclick="location.href='/student/task/page?c_number=${task.c_number}&t_number=${task.t_number}'"
					style="cursor: hand">등록</button>
			</c:if>
			<c:if test="${stutask.id eq userId}">
				<button class="btn stutask_btn"
					onclick="location.href='/student/taskpage?st_number=${stutask.st_number}'">수정하기</button>
			</c:if>






			


		</div>
	</div>
</body>
</html>