<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<html>
<head>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/testInsert.css"> --%>
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
                  <form action="/task/chan" method="POST" enctype="multipart/form-data">
                  <div class="insertForm">
                  	<input type="hidden" name="t_number" value="${task.t_number }">

                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">작성자</span>
						</div>
						<input type="text" class="form-control" name="id" id="id"
							value="${task.id }" placeholder="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">제목</span>
						</div>
						<input type="text" class="form-control" name="title" id="title"
							value="${task.title }" placeholder="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">과제 마감일</span>
						</div>
						<input type="datetime-local" class="form-control" name="deadline" id="deadline"
							value="${task.deadline }" placeholder="ex)2024.01.01 16:00" oninput="showValue()">
					</div>

                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">과제 내용</span>
						</div>
						<input type="text" class="form-control" name="info" id="info"
							value="${task.info }" placeholder="ex)">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">첨부 파일</span>
						</div>
						<input type="file" class="form-control" name="uploadFile" id=""
							value="">${task.t_file1 }
					</div>
					
                  		<input type="number" name="c_number" value="${c_number }" style="display:none;"/>
                       </div>
                        <button type="submit" class="subtn">수정하기</button>
                        </form>
                </section>
        </div>
</div>
</body>
</html>
