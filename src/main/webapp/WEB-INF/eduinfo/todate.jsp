<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>
<%@ page import="java.time.LocalDate" %>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/todate.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/todate.css">
</head>
<body>
<div class="bcl">
        <div class="divall">
                <section class="header-container">
    					<h5>강의번호 :<%= request.getParameter("c_number") %> </h5>
    					<h5>강의명 : <%= request.getParameter("c_name") %></h5> 
    					<p style="color:red"> ※ 출결 수정은 반드시 출석 등록 완료 후 진행해주세요.</p>
                </section>
                <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                         <form class="form-inline" name="searchForm" > 
                                <select name="searchType" id="searchType" class="form-control mr-sm-2">
                                        <option value="name">이름</option>
                                        <option value="id">학번</option>
                                </select> 
                                <input class="form-control mr-sm-2" type="text" name="keyword" id="keyword" autocomplete="off" placeholder="검색어를 입력하세요.">
								<input type="date" name="searchDate" id="searchDate" value="${fn:substring(LocalDate.now().toString(), 0, 10)}" style="margin: 10px;">
								<input type="text" name="c_number" id="c_number" style="display:none;" value="<%= request.getParameter("c_number") %> ">
                                <button class="btn btn-success" type="button" onclick="search()">검색</button>
                      </form> 
                </nav>
                <section class="contents-container">
                  <form action="/professor/students/todate" method="POST">
                  <input type="number" name="c_number" value="${attendanceList[0].c_number}" style="display:none;"/>
                        <table class="table" id="table">
                                <tr>
                                		<th>날짜</th>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>출결</th>
                                        <th>출결 수정</th>
                                     
                                </tr>
                                <c:forEach items="${attendanceList}" var="stu">
                                <tr id ="attList">
                                                <td class="tdCenter"> 
								                           <input type="text" name="a_date" id="a_date" value="${stu.a_date}" readonly> 
                                                </td>
                                                <td><input type="text" name="id_${stu.id}"  value="${stu.id}" style="border:none;" readonly /></td>
                                                <td><input type="text" name="name_${stu.id}"  value="${stu.name}" style="border:none;" readonly/></td>
                                                <td>
                                                <c:if test="${empty stu.a_status}">
                                                		  <input type='radio' name='a_status_${stu.id}' value='출석' checked />출석
														  <input type='radio' name='a_status_${stu.id}' value='지각' />지각
														  <input type='radio' name='a_status_${stu.id}' value='조퇴' />조퇴
														  <input type='radio' name='a_status_${stu.id}' value='결석' />결석 
                                                </c:if>
                                                <c:if test="${not empty stu.a_status}">
                                               	    <input type="radio" name="a_status_${stu.id}" value="출석" ${stu.a_status == '출석' ? 'checked' : ''} />출석
													<input type="radio" name="a_status_${stu.id}" value="조퇴" ${stu.a_status == '조퇴' ? 'checked' : ''} />조퇴
													<input type="radio" name="a_status_${stu.id}" value="지각" ${stu.a_status == '지각' ? 'checked' : ''} />지각
													<input type="radio" name="a_status_${stu.id}" value="결석" ${stu.a_status == '결석' ? 'checked' : ''} />결석  
												 </c:if>
                                                </td>
                                                <td> <button type="button" class="upbut" onclick="updateAttendance('${stu.id}', '<%= request.getParameter("c_number") %> ')"> 수정 </button> </td>
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
