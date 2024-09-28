<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세 정보</title>
<script src="${pageContext.request.contextPath }/resources/js/classInfo.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class.css">
</head>
<body>

<div class="modal-dialog">
	    
	<div class="modal-content">
		      
		<div class="modal-header">
			        
			<h4 class="modal-title" id="myModalLabel">강의 상세 정보</h4>
			      <button type="button" class="btn" data-dismiss="modal">x</button>
		</div>
		<div class="modal-no"></div>
			      
			<div class="modal-body">
				<div id="update_pop_up">
					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의번호</span>
						</div>
						<input type="text" class="form-control" name="c_number" id="c_number"
							value="" readonly>
					</div>
						<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">등록일자</span>
						</div>
						<input type="text" class="form-control" name="c_create_date" id="c_create_date"
							value="" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의명</span>
						</div>
						<input type="text" class="form-control" name="c_name" id="c_name"
							placeholder="강의명을 입력하세요." value="" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">교수 ID</span>
						</div>
						<input type="text" class="form-control innm" name="c_id" id="c_id"
							value="" >
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">교수 이름</span>
						</div>
						<input type="text" class="form-control innm" name="c_prof_name" id="c_prof_name"
							value="" >
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">개강일자</span>
						</div>
						<input type="date" class="form-control innm" name="c_start_date" id="c_start_date"
							value="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">종강일자</span>
						</div>
						<input type="date" class="form-control innm" name="c_end_date" id="c_end_date"
							value="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">인원수</span>
						</div>
						<input type="text" class="form-control innm" name="c_stu_count" id="c_stu_count"
							value="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의시간</span>
						</div>
						<input type="text" class="form-control innm" name="c_time" id="c_time"
							value="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">학기</span>
						</div>
						<input type="text" class="form-control innm" name="c_term" id="c_term"
							value="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의요일</span>
						</div>
						<input type="text" class="form-control innm" name="c_day" id="c_day"
							value="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의 소개</span>
						</div>
						<textarea class="form-control" rows="10" id="c_info"
							name="c_info"></textarea>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의상태</span>
						<select name="c_status" class="form-control" id="c_status">
							<option value="진행">진행</option>
							<option value="폐강">폐강</option>
						</select>
						</div>
					</div>
				</div>
			</div>
			      
			<div class="modal-footer">
						<button id="classUpdate" type="button" class="classUpdate">수정하기</button>
				<button type="button" class="btn" data-dismiss="modal" onclick="delimg()">취소</button>
			</div>
		    
	</div>
	  
</div>
		
</body>
</html>