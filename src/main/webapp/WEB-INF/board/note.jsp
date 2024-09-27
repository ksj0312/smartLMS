<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션에서 mem_id 가져오기
    String userId = (String) session.getAttribute("userId");
%>
<script>
var userId = '<%= userId %>';
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 확인</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/note.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/note.js"></script>
</head>
<body>
<button id="openModalBtn" class="openModalBtn">쪽지확인</button>

<!-- 모달창 처리 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="searchdiv">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
            <button id="searchButton">검색</button><button class="writeBtn">글쓰기</button>
        </div>
        <ul id="noteList"></ul>
        <div id="pagination" class="pagination"></div>
    </div>
</div>


<form id="sendNoteForm" style="display:none;">
    <input type="text" id="n_sender" name="n_sender" value="${sessionScope.userId}" required readonly>
    <input type="text" id="n_reciver" name="n_reciver" placeholder="받는 사람" required>
    <input type="text" id="n_title" name="n_title" placeholder="제목" required>
    <input type="text" id="n_info" name="n_info" placeholder="내용" required>
    <button type="button" id="sendBtn" class="sendBtn">보내기</button>
    <button type="button" class="openListBtn">목록으로 돌아가기</button>
</form>

</body>
</html>
