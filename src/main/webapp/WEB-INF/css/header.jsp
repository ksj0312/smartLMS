<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/smartlms.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

<body>

<nav class="navbar navbar-expand-sm justify-content-center">

  <a href="/"><small>home</small></a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="getBoardList?b_type=게시판">공지사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="cal">학사일정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="getBoardList?b_type=QNA">Q&A</a>
    </li>
  </ul>

			<c:choose>
				<c:when test="${userName ne NULL}">
					<ul class="navbar-nav log2"
						style="padding-right: 100px !important; font-size: small;">
						<li class="nav-item"><a class="nav-link" href="myPage"><span id="name">${userName} 님</span></a></li>
						<li class="nav-item"><a class="nav-link" href="javascript: logout()">LOGOUT</a></li>
						
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav log2"
						style="padding-right: 100px !important; font-size: small;">
						<li class="nav-item"><a class="nav-link" href="adminLoginPage"><small>ADMIN LOGIN</small></a></li>
						<li><a class="nav-link" href="studentLoginPage"><small>STUDENT LOGIN </small></a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	
</body>


</html>