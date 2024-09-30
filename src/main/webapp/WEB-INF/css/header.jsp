<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/note.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/note.js"></script>
</head>

<body>

<nav id="stNav" class="navbar navbar-expand-sm justify-content-center">

     <ul class="navbar-nav navlogo">
      <li class="nav-item"><a href="/"><img class="nvlog" id="nvlog" src="/resources/img/logo1.png" alt="smartlms" title="smartlms" style="height: 60px; padding-left:120px;"></a></li>
   </ul>
   <div class="smnav">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="getBoardList?b_type=게시판">공지사항</a>
    </li> &nbsp;
    <li class="nav-item">
      <a class="nav-link" href="calPage">학사일정</a>
    </li>&nbsp;
    <li class="nav-item">
      <a class="nav-link" href="getBoardList?b_type=QNA">Q&A</a>
    </li>
  </ul>
</div>
<ul class="navbar-nav navuser" style="width:200px !important; font-size:small;">
<c:choose>
    <c:when test="${userName ne NULL}">
      <ul class="navbar-nav log2" style="padding-right: 100px !important; font-size: small;">
            <c:choose>
                <c:when test="${noteCount > 0}">
<%--          새로운 쪽지 있는지 확인하는 조건 --%>
                    <li class="nav-item">
                        <a href="#" class="openModalBtn">
                            <svg xmlns="http://www.w3.org/2000/svg" class="note" width="25" height="25" fill="currentColor" class="bi bi-envelope-exclamation" viewBox="0 0 16 16">
                                <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2zm3.708 6.208L1 11.105V5.383zM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2z"/>
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1.5a.5.5 0 0 1-1 0V11a.5.5 0 0 1 1 0m0 3a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"/>
                            </svg>
                            
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a href="#" class="openModalBtn">
                        <svg xmlns="http://www.w3.org/2000/svg" class="note" width="25" height="25" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"/>
                            </svg>
                            
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
            &nbsp;
<%--          로그인 성공 후 name이 있을 경우             --%>
<%--          교수인지 학생인지 분리  --%>
         <c:choose>
         <c:when test="${loginChk eq 'stu'}">
                   <li class="nav-item">
                <a class="nav-link" href="myPageMain">
                    <span id="name">${userName} 님</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link logOut" href="javascript: logout()" style="font-size: smaller;">logout</a>
            </li>
         </c:when>
         <c:when test="${loginChk eq 'pro' }">
            <li class="nav-item">
                <a class="nav-link" href="adminMyPageInfo"> 
<%--                 관리자 마이페이지 추가하기  --%>
                    <span id="name">${userName} 님</span>
                </a>
            </li>
               <li class="nav-item">
                <a class="nav-link" href="admin" style="font-size: smaller;"> 
                    관리자페이지
                </a>
            </li>    &nbsp;  &nbsp; 
            <li class="nav-item">
                <a class="nav-link logOut" href="javascript: logout()" style="font-size: smaller;">logout</a>
            </li>
         </c:when>
         </c:choose>
           </ul>
    </c:when>
    <c:otherwise>
        <ul class="navbar-nav log2" style="padding-right: 100px !important;">
            <li class="nav-item">
                <a class="nav-link" href="student"><small>login</small></a>
            </li>
        </ul>
    </c:otherwise>
</c:choose>
      </ul>
   </nav> 
   
   <!-- 모달창 처리 -->
<<<<<<< HEAD
<div id="noteModal" class="modal">
    <div class="modal-content">
=======
<div id="myModal" class="modal">
    <div class="modal-content note">
>>>>>>> d3cc21b0cc01db31040abe94a09e5f54a0206dad
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