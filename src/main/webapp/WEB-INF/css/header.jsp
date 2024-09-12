<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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

</head>

<body>

<nav class="navbar navbar-expand-sm justify-content-center">

  <a href="main.jsp"><small>home</small></a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="getBoardList">공지사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="cal">학사일정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="">자료실</a>
    </li>
  </ul>

  <c:choose>
			<c:when test="${userId ne NULL}">
					<li class="nav-item">
							<a class="nav-link" href="userMypage"><span id="name">${userId} 님</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="javascript: logout()">LOGOUT</a>
						</li>
							</c:when>
			<c:otherwise>
				<ul class="navbar-nav log2" style="padding-right:100px !important; font-size:small;" >
					<li class="nav-item">
						<a class="nav-link" href="adminLoginPage">ADMIN LOGIN</a>
						<a class="nav-link" href="studentLogin">STUDENT LOGIN</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
</nav>

</body>

</html>