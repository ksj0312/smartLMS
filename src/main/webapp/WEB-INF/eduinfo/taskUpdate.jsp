<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<script src="${pageContext.request.contextPath }/resources/js/task.js"></script>

<html>
<head>
</head>
<title>교수 과제 수정</title>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
    					<h5>강의번호 : ${c_number } </h5>
    					<h5>강의명 : ${c_name } </h5>
    					<br><br>
                </section>
				
               <section class="contents-container">
    <form name="taskForm" action="/task/chan" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="insertForm">
            <input type="hidden" name="t_number" value="${task.t_number }">

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">작성자</span>
                </div>
                <input type="text" class="form-control" name="id" id="id" value="${task.id }" placeholder="">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">제목</span>
                </div>
                <input type="text" class="form-control" name="title" id="title" value="${task.title }" placeholder="">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">과제 마감일</span>
                </div>
                <input type="datetime-local" class="form-control" name="deadline" id="deadline" value="${task.deadline }" placeholder="ex)2024.01.01 16:00">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">과제 내용</span>
                </div>
                <input type="text" class="form-control" name="info" id="info" value="${task.info }" placeholder="">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">첨부 파일</span>
                </div>
                <input type="file" class="form-control" name="uploadFile" id="" value="">
            </div>

            <input type="number" name="c_number" value="${c_number }" style="display:none;" />
        </div>
        <button type="submit" class="subtn">수정하기</button>
    </form>
</section>

        </div>
</div>
</body>

</html>
