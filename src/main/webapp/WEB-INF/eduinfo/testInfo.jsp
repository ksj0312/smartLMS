<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-dialog">
	    
	<div class="modal-content">
		      
		<div class="modal-header">
			        
<<<<<<< HEAD
			<h4 class="modal-title" id="myModalLabel"  >시험 정보</h4>
=======
			<h4 class="modal-title" id="myModalLabel" style="justify-content: center !important;" >시험 정보</h4>
>>>>>>> 8827f10b23c9437e62f6b3f60d2aabaad761d1d0
		</div>
		        
			<div class="modal-body">
				<div id="update_pop_up">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의번호</span>
						</div>
						<input type="text" class="form-control" name="c_number" id="c_number1"
							value="" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험번호</span>
						</div>
						<input type="text" class="form-control" name="g_number" id="g_number"
							value="" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">아이디</span>
						</div>
						<input type="text" class="form-control" name="id" id="id"
							value="" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험타입</span>
						</div>
						<input type="text" class="form-control" name="test_type" id="test_type"
							value="" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시작일시</span>
						</div>
						<input type="datetime-local" class="form-control" name="start_time" id="start_time"
							value="" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">종료일시</span>
						</div>
						<input type="datetime-local" class="form-control" name="end_time" id="end_time"
							value="" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">시험시간</span>
						</div>
						<input type="text" class="form-control" name="test_time" id="test_time"
							value="" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">성적등록 여부</span>
						</div>
						<select name="status" class="form-control" id="status">
						<option value="0">성적등록 미완료</option>
						<option value="1">성적등록 완료</option>
						</select>
					</div>
				
				</div>
			</div>
			 <div class="modal-footer">
				<button id="testUpdate" type="button" class="testUpdate" onclick="testUpdate()">수정하기</button>
				<button type="button" class="btn xbtn" data-dismiss="modal">닫기</button>
				</div>
		    
	</div>
	  
</div>
