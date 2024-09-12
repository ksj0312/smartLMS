<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    // 세션에서 mem_id 가져오기
    String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* 모달 창 스타일 */
.modal {
    display: none; /* 기본적으로 숨겨진 상태 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}
.modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>
<button id="openModalBtn">쪽지확인</button>

<!-- 모달 창 구조 -->
<div id="myModal" class="modal">
    <div class="modal-content">
    <!-- text-align:right로 x표시 오른쪽으로 밀어 -->
        <span class="close">&times;</span>
        
        <ul id="noteList"></ul>
    </div>
</div>
<form action="sendnote" method="POST">
    <input type="text" name="n_sender" value="${sessionScope.userId}" required readonly>
    <input type="text" name="n_reciver" placeholder="받는 사람" required>
    <input type="text" name="n_title" placeholder="제목" required>
    <input type="text" name="n_info" placeholder="내용" required>
    <button type="submit">보내기</button>
</form>
<script>
$(document).ready(function() {
	var userId = '<%= userId %>';
    // 모달 창 열기 버튼 클릭 시
    $('#openModalBtn').click(function() {
        $.ajax({
            url: '/receivnote',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                console.log(data); // 서버에서 받은 JSON 데이터를 콘솔에 출력
                var noteList = $('#noteList');
                noteList.empty(); // 기존 리스트 항목 삭제
				var number = data.n_number;
                console.log(number);
                // JSON 데이터를 기반으로 리스트 항목 추가
                $.each(data, function(index, note) {
                	if(userId == note.n_reciver){
                    noteList.append('<strong>' + "보낸사람: "+note.n_sender +'</strong>: '+'<br>' +"제목: " +note.n_title + '<button class="detailBtn">보기</button>&nbsp;<button class="responBtn">답장</button>' + '<br>');                		
                	}
                });

                // 모달 창 표시
                $('#myModal').show();
                
                // "보기" 버튼 클릭 시 상세 내용 표시
                $('.detailBtn').click(function() {
                    // 버튼 아래 숨겨진 내용을 보이도록 설정
                    $(this).siblings('.noteContent').toggle();
                });
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ' + status + ' ' + error);
            }
        });
    });
//     $('#detailBtn').click(function(){
//     	$.ajax({
//     		url: '/detailnote',
//     		type: 'GET',
//     		dataType: 'json',
//     		success: function(data){
    			
//     		},
//     		error: function(xhr, status, error){
//     			console.error('AJAX Error: ' + status + ' ' + error);
//     		}
//     	});
//     });

    // 모달 창 닫기
    $('.close').click(function() {
        $('#myModal').hide();
    });

    // 모달 창 바깥 클릭 시 닫기
    $(window).click(function(event) {
        if ($(event.target).is('#myModal')) {
            $('#myModal').hide();
        }
    });
});
</script>
</body>
</html>
    
