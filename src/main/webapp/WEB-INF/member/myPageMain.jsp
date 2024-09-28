<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    // 세션에서 mem_id 가져오기
    String userName = (String) session.getAttribute("userName");	
%>

<div id="mypage_con">
	<div class="mypage_con pd_box inner">
		<div class="mypage_top">
			<h1 class="mypage_title">
				<span class="find_my_name"></span>${user.name}님의 마이페이지
			</h1>

		</div>
		<div class="mypage_bot">
			<div class="mypage_left_con_box">
			<div>
					<a href="myPageInfo">내 정보</a>
			</div>
			<div>
<!-- 					<a href="myPageClass">수강과목</a> -->
					<a href="getClassList?Id=${userId}">수강과목</a>
					

			</div>
			</div>


		</div>
	</div>
</div>







