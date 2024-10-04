<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class.css">
</head>
<body>
		<div class="bcl">
			<div class="divall">
				<section class="header-container">
					<h4>강의 등록</h4>
					<br><br>
				</section>
				
<section class="container-flui">
  <form class="clInsert" action="/admin/class" method="POST" >
  <div class="insertForm">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">강의명</span>
      </div>
      <input type="text" class="form-control" name="c_name" placeholder="강의명을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">교수 ID</span>
      </div>
      <input type="text" class="form-control innm" name="c_id" placeholder="교수ID를 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">교수 이름</span>
      </div>
      <input type="text" class="form-control innm" name="c_prof_name" placeholder="교수이름을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">개강일자</span>
      </div>
      <input type="date" class="form-control innm" name="c_start_date" >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">종강일자</span>
      </div>
      <input type="date" class="form-control innm" name="c_end_date" >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">인원수</span>
      </div>
      <input type="text" class="form-control innm" name="c_stu_count" >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">강의시간</span>
      </div>
      <input type="text" class="form-control innm" name="c_time" >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">학기</span>
      </div>
      <input type="text" class="form-control innm" name="c_term" >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">강의요일</span>
      </div>
      <input type="text" class="form-control innm" name="c_day" >      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">강의 소개</span>
      </div>
      <textarea class="form-control" rows="10" id="b_comment" name="c_info"></textarea>      
    </div>  
    </div>
    <div id="footer">
        <button id="classInsert" type="submit" class="btn btn-primary subtn" >등록하기</button>
    </div>
  </form>  
</section>
</div>
</div>
</body>
</html>