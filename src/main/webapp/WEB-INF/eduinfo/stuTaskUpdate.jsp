<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/taskInsert.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/testInsert.css"> --%>
</head>
<body>

	<%@ include file="../member/taskIndex.jsp"%>

	
	${stutask }
<div class="bcl">
        <div class="divall">
                <section class="header-container">
    					<h5>강의번호 : <%=c_number %> </h5>
						<h5>강의명 : <%=c_name%></h5>
    					<br><br>
                </section>
                <section class="contents-container">
                  <form id="taskForm" enctype="multipart/form-data">
                  <div class="insertForm">
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의 번호</span>
						</div>
						<input type="text" class="form-control" name="c_number" id="c_number"
							value="${stutask.c_number}" placeholder="">
					</div>
					<input type="text" class="form-control" name="t_number" id="t_number" value="${stutask.t_number }" style="display:none;">
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">작성자</span>
						</div>
						<input type="text" class="form-control" name="id" id="id"
							value="${stutask.id }" placeholder="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">과제 제목</span>
						</div>
						<input type="text" class="form-control" name="st_title" id="st_title"
							value="${stutask.st_title } " placeholder="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">과제 내용</span>
						</div>
						<input type="text" class="form-control" name="st_info" id="st_title"
							value="${stutask.st_info }">
					</div>
                  		<input type="hidden" name="st_number" id="st_number" value="${stutask.st_number }"/>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">파일</span>
						</div>
						<input type=file class="form-control" name="uploadFile" id="uploadFile"
							value="${stutask.s_file1 }">
					</div>
                       </div>
       						 <button type="button" class="subtn" onclick="taskUpdate(event)">수정하기</button>
                        </form>
                </section>
        </div>
</div>
</body>
</html>
