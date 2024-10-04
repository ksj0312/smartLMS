<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/myPageClass.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPageClass.css">
<%
    // 세션에서 mem_id 가져오기
    String userName = (String) session.getAttribute("userName");	
%>

<div id="mypage_con">
    <div class="mypage_con pd_box inner">
        <div class="mypage_top">

        </div>
        <div class="mypage_bot">
            <!-- 수강과목 -->
<div class="container">
  <p>${userName}님의 수강목록</p>            
  <table class="table">
    <thead>
      <tr>
        <th>강의번호</th>
        <th>강의명</th>
        <th>교수이름</th>
        <th>강의시간</th>
        <th>출결상태</th>
        <th>시험, 과제</th>
      </tr>
    </thead>
    <tbody id="classTableBody">
    <c:forEach items="${classList}" var="item">
    <tr>
    				<td>${item.c_number}</td>
					<td>${item.c_name}</td>
					<td>${item.c_prof_name}</td>
					<td>${item.c_day}&nbsp;${item.c_time} </td>
					<td> <button type="button" class="btn ModalBtn" id="myPageClassDetail" 
					data-toggle="modal" data-target="#myPageModal" value="${item.c_number}" 
					onclick="attInfo(${item.c_number})">상세정보</button></td>
<!-- 					<td><button type="button" class="btn TaskBtn" onclick="">과제</button> </td> -->
					<td><a class="btn TaskBtn" href="taskListPage">과제</a> </td>
					</tr>
					</c:forEach>
    </tbody>
  </table>
</div>               
<div class="modal fade" id="myPageModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" data-backdrop='static'
            aria-hidden="true">
            <%@ include file="myPageModal.jsp" %>
</div>

        </div>
        </div>
    </div>





   
                  
 
					

