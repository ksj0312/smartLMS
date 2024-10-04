<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/attendance.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminIndex.css">
</head>
<body>
<% 
    if(userId == null) {
%>
    <script type="text/javascript">
        alert("로그인이 필요한 페이지입니다.");
        window.location.href = '/';
    </script>
<% 
    } else { 
%>
<div class="idxbody">
	<div>
	<div style="height:35px"></div>
<!-- 	<img class="idxlog" src="/resources/img/logo11.png" alt="smartLMS" title="smartLMS" style="height: 155px; cursor:pointer;" onclick="javascript:newin=window.open('about:blank'); newin.location.href='/';" ><br> -->
	<ul>
	<li><br></li>
	<%
	String type = (String)session.getAttribute("userType");
	if(type.equals("교수")){
		%>
	<li><a href="/admin" class = "atag2">${userName} 교수님</a></li><br><br>
	<li class="menu">학생 관리></li>
	<li><a href="/professor/students/classes" class = "atag" id="classList">- 출석 관리</a></li>
	<li><a href="/professor/students/classlist" class = "atag">- 성적 등록</a></li>
	<li><a href="/professor/students/class" class = "atag">- 성적 조회/수정</a></li>
	<li class="menu">시험 관리></li>
	<li><a href="/professor/test/classes" class = "atag">- 시험 등록</a></li>
	<li><a href="/professor/test/classlist" class = "atag">- 시험 목록</a></li>
		<li><a href="/task/class?status=insert" class = "atag">- 과제 등록</a></li>
	<li><a href="/task/class?status=check" class = "atag">- 과제 확인</a></li>
	<li class="menu">공통 관리></li>
	<li><a href="/admin/class" class = "atag">- 강의 등록</a></li>
	<li><a href="/admin/classes" class = "atag">- 강의 목록</a></li>
	<li><a href="/admin/attendance" class = "atag">- 수강생 목록</a></li>
	<%  }else if(type.equals("관리자")){
		%>
	<li><a href="/admin" class = "atag2">${userName} 님</a></li><br><br>
	<li class="menu">계정 관리></li>
	<li><a href="/excel/students" class = "atag">- 학생용 엑셀 업로드</a></li>
	<li><a href="/excel/professors" class = "atag">- 교수용 엑셀 업로드</a></li>
	<li class="menu">게시판 관리></li>
	<li><a href="/boardadmin?b_type=게시판" class = "atag">- 공지 관리</a></li>
	<li><a href="/boardadmin?b_type=QNA" class = "atag">- Q&A 관리</a></li>
	<li><a href="/cal/admin" class = "atag">- 학사일정 관리</a></li>
	<li class="menu">공통관리></li>
	<li><a href="/admin/class" class = "atag">- 강의 등록</a></li>
	<li><a href="/admin/classes" class = "atag">- 강의 목록</a></li>
	<li><a href="/admin/attendance" class = "atag">- 수강생 목록</a></li>
	<li><a href="/admin/students" class = "atag">- 학생 정보</a></li>
	<li><a href="/admin/professors" class = "atag">- 교수 정보</a></li>
	</ul>
	<% } else { %>
		<a href = "/">Home으로 돌아가기</a>
	<% } %>
	</div>
</div>
<%} %>
</body>
</html>