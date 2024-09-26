<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/gradeList.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gradeList.css"> --%>
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
                        <h4>성적 조회/수정</h4>
                        <br>
    					<h5>강의 번호 <%= request.getParameter("c_number") %></h5>
    					<h5>과제 번호 <%= request.getParameter("g_number") %></h5>
    					<br>
                        <small style="color:red">※ 점수 수정 시 등급이 업데이트 됩니다. 점수 수정을 모두 완료한 후 등급 수정을 해주세요. </small>
                        <br><br>
                </section>
                <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                         <form class="form-inline" name="searchForm" > 
                                <select name="searchType" id="searchType" class="form-control mr-sm-2">
                                        <option value="id">학번</option>
                                        <option value="name">이름</option>
                                </select> 
                                <input class="form-control mr-sm-2" type="text" name="keyword" id="keyword" autocomplete="off" placeholder="검색어를 입력하세요.">
                                <button class="btn btn-success" type="button" onclick="search()">검색</button>
                      </form> 
                </nav>

                <section class="contents-container">
                  <form action="insertGrade" method="POST">
                  		<input type="number" name="g_number" id="g_number" value="<%= request.getParameter("g_number") %>" style="display:none;"/>
                  		<input type="number" name="c_number" id="c_number" value="<%= request.getParameter("c_number") %>" style="display:none;"/>
                        <table class="table" id="table">
                                <tr>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>점수</th>
                                        <th>등급</th>
                                        <th>등급수정(+/-)</th>
                                     
                                </tr>
                                <c:forEach items="${gradeList}" var="stu">
                                <tr id ="gradeList">
                                                <td><input type="text" name="id_${stu.id}"  value="${stu.id}" style="display:none;" readonly />${stu.id}</td>
                                                <td>${stu.name}</td>
                                                <td><input type="text" name="level_${stu.id}"  value="${stu.level}" maxlength="3" required/></td>
                                                <td><input type="text" name="grade_${stu.id}"  id = "grade_${stu.id}" value="${stu.grade}" required/></td>
                                                <td><button type="button" onclick="gradeUpdate('<%= request.getParameter("g_number") %>', '${stu.id}')">등급수정</button></td>
                                                </tr>
                                </c:forEach>
                        </table>
                        <button type="submit">점수 수정</button>
                        </form>
                </section>
        </div>
</div>
</body>
</html>
