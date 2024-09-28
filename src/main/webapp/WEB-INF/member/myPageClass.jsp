<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/myPageClass.js"></script>
<%
    // 세션에서 mem_id 가져오기
    String userName = (String) session.getAttribute("userName");	
%>


    
<div id="mypage_con">
    <div class="mypage_con pd_box inner">
        <div class="mypage_top">
            <h1 class="mypage_title">
            	<span class="find_my_name"></span>${userName}님의 마이페이지
            </h1>

        </div>
        <div class="mypage_bot">
            <!-- 수강과목 -->
<div class="container">
  <h2>수강목록</h2>
  <p>수강목록</p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>강의번호</th>
        <th>강의명</th>
        <th>교수이름</th>
        <th>강의시간</th>
        <th>출결상태</th>
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





   
                  
 
					

