<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/attendanceInfo.js"></script> 
</head>
<body>

<div class="modal-dialog">
	    
	<div class="modal-content attmodal-content">
		      
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">수강 학생 정보</h4>
			<button type="button" class="btn" data-dismiss="modal">x</button>
		</div>
			    <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                         <form class="form-inline" name="searchForm" > 
                                <select name="searchType" id="searchType" class="form-control mr-sm-2">
                                        <option value="name">이름</option>
                                        <option value="id">학번</option>
                                </select> 
                                <input class="form-control mr-sm-2" type="text" name="keyword" id="keyword" autocomplete="off" placeholder="검색어를 입력하세요." onkeydown="JavaScript:enterkey();">
								<input type="text" name="c_number" id="c_number" style="display:none;" value="">
                                <button class="btn btn-success" type="button" onclick="search()">검색</button>
                      </form> 
                </nav>
		<div class="modal-no"></div>
			<div class="modal-body">
			<div id="searchNo"></div>
				<div id="select_pop_up">
                        <table class="table" id="infoTable">
                                <tr>
                                        <th>학번</th>
                                        <th>이름</th>
                                		<th>출석</th>
                                		<th>지각</th>
                                		<th>조퇴</th>
                                		<th>결석</th>
                                </tr>
                        </table>
			<div class="modal-footer">
				<button type="button" class="btn xbtn" data-dismiss="modal">닫기</button>
			</div>
		    
	</div>
	  
</div>
</div>
</div>

</body>
</html>
