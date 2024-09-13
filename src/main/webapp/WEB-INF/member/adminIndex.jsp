<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
 * {
   font-family: 'Noto Sans KR', sans-serif !important;
   box-sizing: border-box !important;
   font-weight: 500 !important;
}
.bcl{
flex-grow:1;
}
.bodyDiv{
display:flex;
}

 .divall {
     padding: 20px;
     margin-top : 70px;
     padding: 0 100px 0 300px;
 }

* {box-sizing: border-box;}
.idxbody {
	width: 200px;
	padding-left: 20px;
	float: left;
	display: flex;
	background-color: #f9f5f2;
	color: #272727;
	font-size: 15px;
}

ul {
	list-style: none;
	padding: 0
}

/* .idxhd {
	display: flex;
	background-color: #272727;
	color: #272727;
	align-items: center;
	padding: 8px;
	box-sizing: border-box;
	height: 50px !important;
	justify-content: center;
} */

.move {
	padding-left: 100px;
	background-color: #272727;
	color: #f9f5f2;
}

.info {
	background-color: #272727;
	color: #272727;
	display:flex;
	margin-left:auto;
}

li {
	margin-top: 15px;
	color : #272727;
}

.atag {
	text-decoration: none;
	color: #272727;
}
.atag2{
	text-decoration: none;
	color: #272727;
	font-size: large;
	
}
.atag2:hover {
    color: #0056b3;
    text-decoration: none;
}

.infoa {
	color:#272727;
}
.nick{
	padding-right:10px;
}
.infodiv{
	display:flex;
	text-align: center;
}
.idxlog{
    margin-top: 55px;
    height: 30px;
}
.menu{
/* 	opacity:70%; */
	color: #f9c25c;
}
</style>
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
	<li><a href="uploadPage" class = "atag">- 엑셀 업로드</a></li>
	<li class="menu">게시판관리></li>
	<li><a href="" class = "atag">- 공지관리</a></li>
	<li><a href="" class = "atag">- FAQ관리</a></li>
	<li><a href="" class = "atag">- 학사일정관리</a></li>
	</ul>
	</div>
</div>
</body>
</html>