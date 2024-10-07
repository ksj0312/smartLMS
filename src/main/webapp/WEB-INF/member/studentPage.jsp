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
				<img src="${pageContext.request.contextPath}/resources/img/test.png" style="width:120px; height:120px; margin-top:50px;">
				<a href="/student/test?c_number=<%=c_number %>&c_name=<%=c_name %>" class="mypage_link">시험관리</a>
<!-- 					<p class="description">시험 응시</p> -->
				</div>

				<div class="classdiv" onclick="location.href='/student/task?c_number=<%=c_number %>&c_name=<%=c_name %>'" style="cursor:hand">
				<img src="${pageContext.request.contextPath}/resources/img/task.png" style="width:120px; height:120px; margin-top:50px;">
				<a href="/student/task?c_number=<%=c_number %>&c_name=<%=c_name %>" class="mypage_link">과제관리</a>
<!-- 					<p class="description">과제확인</p> -->
				</div>

				<div class="writediv" onclick="location.href='/student/grade?c_number=<%=c_number %>&id=<%=id %>'" style="cursor:hand">	
					<img src="${pageContext.request.contextPath}/resources/img/grade.png" style="width:120px; height:120px; margin-top:50px;">
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