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
			        
			<h4 class="modal-title" id="myModalLabel">학생 정보</h4>
<!-- 			      <button type="button" class="btn" data-dismiss="modal">x</button> -->
		</div>
		<div class="modal-no"></div>
		        
			<div class="modal-body">
				<div id="update_pop_up">
					<div class="inputs">
						<label for="id" class="labelp">학번
						<input type="text" id="id" class="form-control" name="id" value="" readonly>
						</label>
					</div>
					
					<div class="inputs">
						<label for="stuname" class="labelp">이름 
						<input type="text" id="stuname" class="form-control" name="name" value="" required>
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
						<label for="department" class="labelp">학과
						<input type="text" id="department" class="form-control" name="department" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="grade" class="labelp">학년
						<input type="text" id="grade" class="form-control" name="grade" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="admission_date" class="labelp">입학일
						<input type="date" id="admission_date" class="form-control" name="admission_date" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="graduation_date" class="labelp">졸업일
						<input type="date" id="graduation_date" class="form-control" name="graduation_date" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="status" class="labelp">상태
						<input type="text" id="status" class="form-control" name="status" value="" required>
						</label>
					</div>

				</div>
			</div>
		    
	</div>
	  
</div>
