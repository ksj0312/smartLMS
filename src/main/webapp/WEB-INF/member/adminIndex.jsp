<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/adminIndex.css">
</head>
<body>
<div class="idxbody">
	<div>
	<img class="idxlog" src="/resources/img/logo.png" alt="smartLMS" title="smartLMS" style="height: 30px; cursor:pointer;" onclick="javascript:newin=window.open('about:blank'); newin.location.href='/';" ><br>
	<div class="infodiv"><p class="infoa nick">${userId} 님</p>&nbsp;&nbsp;<a class="infoa" href="logout">로그아웃</a></div>
	<ul>
	<li><br></li>
	<li><a href="adminPage" class = "atag2">교수</a></li>
	<li class="menu">학생관리></li>
	<li><a href="" class = "atag">- 출석 관리</a></li>
	<li><a href="" class = "atag">- 성적 관리</a></li>
	<li class="menu">과제관리></li>
	<li><a href="" class = "atag">- 과제등록</a></li>
	<li><a href="" class = "atag">- 과제확인</a></li>
	
	<li><a href="adminPage" class = "atag2">관리자</a></li>
	<li class="menu">계정관리></li>
	<li><a href="uploadPageStu" class = "atag">- 학생용 엑셀 업로드</a></li>
	<li><a href="uploadPagePro" class = "atag">- 교수용 엑셀 업로드</a></li>
	<li class="menu">게시판관리></li>
	<li><a href="" class = "atag">- 공지관리</a></li>
	<li><a href="" class = "atag">- FAQ관리</a></li>
	<li><a href="" class = "atag">- 학사일정관리</a></li>
	</ul>
	</div>
</div>
</body>
</html>