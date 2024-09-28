<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <style>
.modal-footer{
    justify-content: center;
}
.modal-title {
    margin-left: 0px;
}
</style> -->
<div class="modal-dialog">
	    
	<div class="modal-content">
		      
		<div class="modal-header">
			        
			<h4 class="modal-title" id="myModalLabel">교수 정보</h4>
<!-- 			<button type="button" class="btn" data-dismiss="modal">x</button> -->
			      
		</div>
		<div class="modal-no"></div>
		        
			<div class="modal-body">
				<div id="update_pop_up">
					<div class="inputs">
						<label for="id" class="labelp">아이디
						<input type="text" id="id" class="form-control" name="id" value="" readonly>
						</label>
					</div>
					
					<div class="inputs">
						<label for="proname" class="labelp">이름 
						<input type="text" id="proname" class="form-control" name="name" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="gender" class="labelp">성별 
						<input type="text" id="gender" class="form-control" name="gender" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="birth" class="labelp">생년월일 
						<input type="text" id="birth" class="form-control" name="birth" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="tel" class="labelp">전화번호
						<input type="text" id="tel" class="form-control" name="tel" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="zipcode" class="labelp">우편번호
						<input type="text" id="zipcode" class="form-control" name="zipcode" value="" required>
						</label>
					</div>
				
					<div class="inputs">
						<label for="addr" class="labelp">주소
						<input type="text" id="addr" class="form-control" name="addr" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="detail_addr" class="labelp">상세주소
						<input type="text" id="detail_addr" class="form-control" name="detail_addr" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="email" class="labelp">이메일
						<input type="text" id="email" class="form-control" name="email" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="lesson" class="labelp">과목
						<input type="text" id="lesson" class="form-control" name="lesson" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="indate" class="labelp">입사일
						<input type="date" id="indate" class="form-control" name="indate" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="outdate" class="labelp">퇴사일
						<input type="date" id="outdate" class="form-control" name="outdate" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="status" class="labelp">상태
						<input type="text" id="status" class="form-control" name="status" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="type" class="labelp">타입
						<input type="text" id="type" class="form-control" name="type" value="" required>
						</label>
					</div>

				</div>
			</div>
		    
	</div>
	  
</div>
