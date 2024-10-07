<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
  <%@ include file="../member/taskIndex.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>교수, 관리자 페이지</title>
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
<div class="admindiv">
<div id="mypage_con">
	<div class="mypage_con pd_box inner">
		<div class="mypage_top">
			<h1 class="mypage_title">
				<span class="find_my_name"></span>
			</h1>
		</div>
		<div class="mypage_bot">
			<div class="mypage_left_con_box">
				<div class="mpdiv" onclick="location.href='/student/test?c_number=<%=c_number %>&c_name=<%=c_name %>'" style="cursor:hand">	
				<svg style="margin-top : 50px;" xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
</svg>
				<a href="/student/test?c_number=<%=c_number %>&c_name=<%=c_name %>" class="mypage_link">시험관리</a>
<!-- 					<p class="description">시험 응시</p> -->
				</div>

				<div class="classdiv" onclick="location.href='/student/task?c_number=<%=c_number %>&c_name=<%=c_name %>'" style="cursor:hand">
				<svg style="margin-top : 50px;" xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-file-text" viewBox="0 0 16 16">
  <path d="M5 4a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5M5 8a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1z"/>
  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1"/>
</svg>
				<a href="/student/task?c_number=<%=c_number %>&c_name=<%=c_name %>" class="mypage_link">과제관리</a>
<!-- 					<p class="description">과제확인</p> -->
				</div>

				<div class="writediv" onclick="location.href='/student/grade?c_number=<%=c_number %>&id=<%=id %>'" style="cursor:hand">	
					<svg style="margin-top : 50px;" xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1z"/>
  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0z"/>
</svg>
					<a href="/student/grade?c_number=<%=c_number %>&id=<%=id %>" class="mypage_link">성적관리</a>
<!-- 					<p class="description">강의 등록 및 수정</p> -->
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<%} %>
</body>
</html>