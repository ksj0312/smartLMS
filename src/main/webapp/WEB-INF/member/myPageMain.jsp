<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    // 세션에서 mem_id 가져오기
    String userName = (String) session.getAttribute("userName");	
%>

<style>
body {
    font-family: "Noto Sans KR", sans-serif; /* 한글 폰트 설정 */
    background-color: #f5f5f5; /* 배경색 설정 */
    margin: 0;
    padding: 0;
}


/* 마이페이지 컨테이너 */
#mypage_con {
    max-width: 800px; /* 최대 너비 설정 */
    margin: 40px auto; /* 화면 중앙 정렬 */
    background-color: #ffffff; /* 흰색 배경 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    padding: 20px; /* 내부 여백 */
}

/* 제목 스타일 */
.mypage_top {
    text-align: center; /* 제목 중앙 정렬 */
    margin-bottom: 20px; /* 제목과 다른 요소 간의 간격 */
}

.mypage_title {
    font-size: 24px; /* 제목 글자 크기 */
    color: #333; /* 글자 색상 */
}

/* 버튼 및 링크 스타일 */
.mypage_left_con_box {
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    gap: 15px; /* 요소 간 간격 */
}

.mypage_left_con_box a {
    text-decoration: none; /* 밑줄 제거 */
    padding: 10px 15px; /* 내부 여백 */
    background-color: #EAEAEA; /* 배경색 */
    color: white; /* 글자 색상 */
    border-radius: 5px; /* 모서리 둥글게 */
    text-align: center; /* 텍스트 중앙 정렬 */
    transition: background-color 0.3s; /* 배경색 변화 시 부드럽게 전환 */
}

.mypage_left_con_box a:hover {
    background-color: #2980b9; /* 호버 시 배경색 변화 */
}

/* 추가 스타일 */
.mypage_bot {
    margin-top: 20px; /* 마이페이지 하단 여백 */
}
</style>
<div id="mypage_con">
	<div class="mypage_con pd_box inner">
		<div class="mypage_top">
			<h1 class="mypage_title">
				<span class="find_my_name"></span>${user.name}님의 마이페이지
			</h1>

		</div>
		<div class="mypage_bot">
			<div class="mypage_left_con_box">
			<div style="text-align:center;">
					<a href="myPageInfo">내 정보</a>
					<a href="getClassList?Id=${userId}">수강과목</a>
			</div>
			<div>
<!-- 					<a href="myPageClass">수강과목</a> -->
					

			</div>
			</div>


		</div>
	</div>
</div>







