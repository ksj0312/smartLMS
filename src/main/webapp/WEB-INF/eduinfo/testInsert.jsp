<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/test.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css"> --%>
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
    					<h4>강의 번호 
    					<%= request.getParameter("c_number") %>
    					</h4>
    					<br>
                        <h4>시험 정보 등록</h4>
                        <br>
                </section>

                <section class="contents-container">
                  <form action="testInsert" method="POST">
                  		<div class="inputs">
						<label for="id" class="labelp">시험구분(중간,기말,과제)
						<input type="text" id="test_type" class="form-control" name="test_type" value="" placeholder="시험구분(중간,기말,과제 등)">
						</label>
						</div>
						<div class="inputs">
						<label for="id" class="labelp">시험일시
						<input type="text" id="start_time" class="form-control" name="start_time" value="" placeholder="ex)2024.01.01 15:00">
						</label>
						</div>
						<div class="inputs">
						<label for="id" class="labelp">시험종료일시
						<input type="text" id="end_time" class="form-control" name="end_time" value="" placeholder="ex)2024.01.01 16:00">
						</label>
						</div>
						<div class="inputs">
						<label for="id" class="labelp">시험시간
						<input type="text" id="test_time" class="form-control" name="test_time" value="" placeholder="60분">
						</label>
						</div>
                  		<input type="number" name="c_number" value="<%= request.getParameter("c_number") %>" style="display:none;"/>
                       
                        <button type="submit">등록</button>
                        </form>
                </section>
        </div>
</div>
</body>
</html>
