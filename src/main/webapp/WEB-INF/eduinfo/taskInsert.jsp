<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<html>
<head>
</head>
<title>교수 과제 등록</title>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
    					<h5>강의번호 : <%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%= request.getParameter("c_name") %> </h5>
    					<br><br>
                </section>
				
                <section class="contents-container">
                  <form action="/task" method="POST" enctype="multipart/form-data">
                  <div class="insertForm">

                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">작성자</span>
						</div>
						<input type="text" class="form-control" name="id" id="id"
							value="<%= userId %>" placeholder="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">제목</span>
						</div>
						<input type="text" class="form-control" name="title" id="title"
							value="" placeholder="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">과제 마감일</span>
						</div>
						<input type="datetime-local" class="form-control" name="deadline" id="deadline"
							value="" placeholder="ex)2024.01.01 16:00" oninput="showValue()">
					</div>

                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">과제 내용</span>
						</div>
						<input type="text" class="form-control" name="info" id="info"
							value="" placeholder="ex)">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">첨부 파일</span>
						</div>
						<input type="file" class="form-control" name="uploadFile" id=""
							value="">
					</div>
					
                  		<input type="number" name="c_number" value="<%= request.getParameter("c_number") %>" style="display:none;"/>
                       </div>
                        <button type="submit" class="subtn">등록하기</button>
                        </form>
                </section>
        </div>
</div>
</body>
</html>
