<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세 정보</title>
<script src="${pageContext.request.contextPath }/resources/js/classSelect.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/class.css">

</head>
<body>
<c:if test="${success eq true}">
    <script>
        alert("수정이 완료되었습니다.");
    </script>
</c:if>
<c:if test="${success eq false}">
    <script>
        alert("수정에 실패하였습니다. 다시 시도해주세요.");
    </script>
</c:if>
	<div class="bcl">
		<div class="divall">
			<h3>강의 상세 정보</h3>
			<section class="container-flui">
				<form class="clInsert" action="classUpdate" method="POST">
				<input type="hidden" name="_method" value="PUT"/>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의번호</span>
						</div>
						<input type="text" class="form-control" name="c_number"
							value="${classSelect.c_number}" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">등록일자</span>
						</div>
						<input type="text" class="form-control" name="c_create_date"
							value="${classSelect.c_create_date}" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의명</span>
						</div>
						<input type="text" class="form-control" name="c_name"
							placeholder="강의명을 입력하세요." value="${classSelect.c_name} " required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">교수 ID</span>
						</div>
						<input type="text" class="form-control innm" name="c_id"
							value="${classSelect.c_id}" >
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">교수 이름</span>
						</div>
						<input type="text" class="form-control innm" name="c_prof_name"
							value="${classSelect.c_prof_name}" >
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">개강일자</span>
						</div>
						<input type="date" class="form-control innm" name="c_start_date"
							value="${classSelect.c_start_date}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">종강일자</span>
						</div>
						<input type="date" class="form-control innm" name="c_end_date"
							value="${classSelect.c_end_date}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">인원수</span>
						</div>
						<input type="text" class="form-control innm" name="c_stu_count"
							value="${classSelect.c_stu_count}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의시간</span>
						</div>
						<input type="text" class="form-control innm" name="c_time"
							value="${classSelect.c_time}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">학기</span>
						</div>
						<input type="text" class="form-control innm" name="c_term"
							value="${classSelect.c_term}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의요일</span>
						</div>
						<input type="text" class="form-control innm" name="c_day"
							value="${classSelect.c_day}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의 소개</span>
						</div>
						<textarea class="form-control" rows="10" id="b_comment"
							name="c_info">${classSelect.c_info}</textarea>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">강의상태</span>
						<select name="c_status" class="form-control" >
							<option value="진행">진행</option>
							<option value="폐강">폐강</option>
						</select>
						</div>
					</div>
					<div id="footer">
						<button id="classUpdate" type="submit" class="btn btn-primary">수정하기</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>