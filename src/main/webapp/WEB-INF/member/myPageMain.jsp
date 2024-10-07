<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">

<%
    // 세션에서 mem_id 가져오기
    String userName = (String) session.getAttribute("userName");	
%>

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
<div id="mypage_con">
	<div class="mypage_con pd_box inner">
		<div class="mypage_top">
			<h1 class="mypage_title">
				<span class="find_my_name"></span>${userName}님의 마이페이지
			</h1>
		</div>
		<div class="mypage_bot">
			<div class="mypage_left_con_box">
				<!-- First box: 내 정보 -->
				<div class="mpdiv" onclick="location.href='/mypage/info'" style="cursor:hand">	
					<svg class="svg_mypage" xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
  <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
  <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"/>
</svg>
					<a href="/mypage/info" class="mypage_link">내 정보</a>
					<p class="description">개인 정보 확인 및 수정</p>
				</div>

				<!-- second box: 수강과목 -->
				<div class="classdiv" onclick="location.href='/classlist?Id=${userId}'" style="cursor:hand">
<svg class="svg_mypage"  xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-layout-text-sidebar-reverse" viewBox="0 0 16 16">
  <path d="M12.5 3a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1zm0 3a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1zm.5 3.5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5m-.5 2.5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1z"/>
  <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zM4 1v14H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm1 0h9a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5z"/>
</svg>					<a href="/classlist?Id=${userId}" class="mypage_link">수강과목</a>
					<p class="description">수강중인 과목 확인</p>
				</div>

				<!-- third box: 내가 쓴 글 -->
				<div class="writediv" onclick="location.href='/mypage/board?b_type=QNA'" style="cursor:hand">	
					<svg class="svg_mypage" xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
</svg>
					<a href="/mypage/board?b_type=QNA&b_id=${userId}" class="mypage_link">작성한 글</a>
					<p class="description">작성한 글 확인 및 수정</p>
				</div>
			</div>
		</div>
	</div>
</div>
<%} %>







