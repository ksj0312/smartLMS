<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/attendance.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminIndex.css">
</head>
<body>
<div class="idxbody">
	<div>
<!-- 	<img class="idxlog" src="/resources/img/logo11.png" alt="smartLMS" title="smartLMS" style="height: 155px; cursor:pointer;" onclick="javascript:newin=window.open('about:blank'); newin.location.href='/';" ><br> -->
	<ul>
	<li><br></li>
	<%
	String type = (String)session.getAttribute("userType");
	if(type.equals("교수")){
		%>
	<li><a href="adminPage" class = "atag2">${userName} 교수님</a></li>
	<li class="menu">학생 관리></li>
	<li><a href="classList" class = "atag" id="classList">- 출석 관리</a></li>
	<li><a href="gradeclassList" class = "atag">- 성적 등록</a></li>
	<li><a href="gradeclassList2" class = "atag">- 성적 조회/수정</a></li>
	<li class="menu">시험 관리></li>
	<li><a href="testclassList" class = "atag">- 시험 등록</a></li>
	<li><a href="taskInsertPage" class = "atag">- 과제 등록</a></li>
	<li><a href="" class = "atag">- 과제 확인</a></li>
	<li class="menu">공통 관리></li>
	<li><a href="classInsertPage" class = "atag">- 강의 등록</a></li>
	<li><a href="classAllList" class = "atag">- 강의 목록</a></li>
	<li><a href="attendance" class = "atag">- 수강생 목록</a></li>
	<%  }else if(type.equals("관리자")){
		%>
	<li><a href="adminPage" class = "atag2">${userName} 님</a></li>
	<li class="menu">계정 관리></li>
	<li><a href="uploadPageStu" class = "atag">- 학생용 엑셀 업로드</a></li>
	<li><a href="uploadPagePro" class = "atag">- 교수용 엑셀 업로드</a></li>
	<li class="menu">게시판 관리></li>
<<<<<<< HEAD
	<li><a href="getBoardListAdmin?b_type=게시판" class = "atag">- 공지 관리</a></li>
	<li><a href="getBoardListAdmin?b_type=QNA" class = "atag">- FAQ 관리</a></li>
	<li><a href="calAdmin" class = "atag">- 학사일정 관리</a></li>
=======
	<li><a href="" class = "atag">- 공지 등록</a></li>
	<li><a href="" class = "atag">- 공지 관리</a></li>
	<li><a href="" class = "atag">- Q&A 관리</a></li>
	<li><a href="" class = "atag">- 학사일정 관리</a></li>
>>>>>>> 4195acf0dfd2913634b1803f2eb9088933492048
	<li class="menu">강의 및 수강생 관리></li>
	<li><a href="classInsertPage" class = "atag">- 강의 등록</a></li>
	<li><a href="classAllList" class = "atag">- 강의 목록</a></li>
	<li><a href="attendance" class = "atag">- 수강생 목록</a></li>
	<li><a href="stuList" class = "atag">- 학생 정보</a></li>
	<li><a href="proList" class = "atag">- 교수 정보</a></li>
	</ul>
	<% } else { %>
		<a href = "/">Home으로 돌아가기</a>
	<% } %>
	</div>
</div>
</body>
</html>