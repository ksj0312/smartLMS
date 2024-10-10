<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/gradeInsert.js"></script>
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
                        <h4>성적 등록</h4>
                        <br>
    					<h5>강의 번호 : <%= request.getParameter("c_number") %></h5>
    					<h5>시험 번호 : <%= request.getParameter("g_number") %></h5>
    					<h5>시험 구분 : <%= request.getParameter("test_type") %></h5>
                        <br>
                </section>

                <section class="contents-container">
                  <form action="/professor/students/grade" method="POST">
                  		<input type="number" name="g_number" value="<%= request.getParameter("g_number") %>" style="display:none;"/>
                  		<input type="number" name="c_number" value="<%= request.getParameter("c_number") %>" style="display:none;"/>
                        <table class="table" id="table">
                                <tr>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>점수</th>
                                     
                                </tr>
                                <c:forEach items="${gradeStuList}" var="stu">
                                <tr id ="attList">
                                                <td><input type="text" name="id_${stu.id}"  value="${stu.id}" style="display:none;" readonly />${stu.id}</td>
                                                <td>${stu.name}</td>
                                                <td><input type="text" name="level_${stu.id}"  value="" maxlength="3" required/></td>
                                                </tr>
                                </c:forEach>
                        </table>
                        <button type="submit" class="subtn">등록하기</button>
                        </form>
                </section>
        </div>
</div>
</body>
</html>
