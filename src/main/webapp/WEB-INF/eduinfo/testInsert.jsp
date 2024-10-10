<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<html>
<head>
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
    					<h5>강의번호 : <%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%= request.getParameter("c_name") %> </h5>
    					<br><br>
                </section>
				
                <section class="contents-container">
                  <form action="/professor/test/classes/test" method="POST">
                  <div class="insertForm">
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험구분</span>
						</div>
						<input type="text" class="form-control" name="test_type" id="test_type"
							value="" placeholder="ex)1학기 중간고사, 2학기 기말고사">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험일시</span>
						</div>
						<input type="datetime-local" class="form-control" name="start_time" id="start_time"
							value="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험종료일시</span>
						</div>
						<input type="datetime-local" class="form-control" name="end_time" id="end_time"
							value="">
					</div>
                  	<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험시간</span>
						</div>
						<input type="text" class="form-control" name="test_time" id="test_time"
							value="" placeholder="ex)60분">
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
