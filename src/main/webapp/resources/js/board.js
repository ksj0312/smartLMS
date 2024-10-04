  //이전 버튼
function fn_prev(currPageNo, range, pageSize) {
	var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
	var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
	var currPageNo = (range - 1) * pageSize;
    var range = range - 1;
    
    var url = "/board";    //여기에 페이지 이동하는 매핑 url 
    url = url + "?currPageNo=" + currPageNo;
    url = url + "&range=" + range;
    url = url + "&searchType=" + searchType;
    url = url + "&keyword=" + keyword;
    location.href = url;
        
    }

    //페이지 번호 클릭
    
    function fn_pagination(currPageNo, range) {
    
	var b_type = document.getElementsByName('b_type')[0].value;
	console.log(b_type);        
	
    var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
    var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
    
    var url = "/board";   //여기에 페이지 이동하는 매핑 url 
    console.log(currPageNo);
        								
    url = url + "?currPageNo=" + currPageNo;
    url = url + "&b_type=" + b_type;
    url = url + "&range=" + range;
    url = url + "&searchType=" + searchType;
    url = url + "&keyword=" + keyword;
    location.href = url;
        
    }
    
    //다음 버튼 이벤트
    function fn_next(currPageNo, range, pageSize) {
        
    var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
    var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
    
    var currPageNo = (range * pageSize) + 1;
    var range = parseInt(range) + 1;
        
    var url = "/board";  //여기에 페이지 이동하는 매핑 url 
    url = url + "?currPageNo=" + currPageNo;
    url = url + "&range=" + range;
    url = url + "&searchType=" + searchType;
    url = url + "&keyword=" + keyword;
    location.href = url;
    }
    
    function sel_board(val){
			location.href = "/boarddetail?b_number="+val;
		}
    
    
    //게시판 상세보기 스크립트
    function board_del(val){
			// 사용자에게 삭제 여부를 확인
		    const result = confirm("정말로 이 게시글을 삭제하시겠습니까?");
		    if (result) {
		        // DELETE 메서드로 서버에 요청 보내기
		        fetch("/board?b_number=" + val, {
		            method: 'DELETE',
		        })
		        .then(response => {
		        	console.log(response);
		            if (response.redirected) {
		                window.location.href = response.url;  // 리디렉션된 URL로 이동
		            } else if (response.ok) {
		                alert('삭제가 완료되었습니다.');
		                location.href = "/board?b_type=게시판"; // 삭제 후 목록으로 이동
		            } else {
		                alert('삭제가 실패했습니다.');
		            }
		        })
		        .catch(error => {
		            console.error('Error:', error);
		            alert('서버 오류가 발생했습니다.');
		        });
		    } else {
		        alert("삭제가 취소되었습니다.");
		    }
		        

		}
			
		function board_update(val){
			location.href = "/board?b_number="+val;
		}
		
		
	function board_delComment(val) {
    // name이 b_number인 요소를 가져오기
    const b_number_elements = document.getElementsByName('b_number');
    const b_number = b_number_elements.length > 0 ? b_number_elements[0].value : null; // 첫 번째 요소의 value를 가져옴

    // 사용자에게 삭제 여부를 확인
    const result = confirm("정말로 이 게시글을 삭제하시겠습니까?");
    if (result) {
        // DELETE 메서드로 서버에 요청 보내기
        fetch(`/comment?co_number=${val}&b_number=${b_number}`, {
            method: 'DELETE',
        })
        .then(response => {
            console.log(response);
            if (response.redirected) {
                window.location.href = response.url; // 리디렉션된 URL로 이동
            } else if (response.ok) {
                alert('삭제가 완료되었습니다.');
                location.href = "/boarddetail?b_number=" + b_number; // 삭제 후 목록으로 이동
            } else {
                alert('삭제가 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('서버 오류가 발생했습니다.');
        });
    } else {
        alert("삭제가 취소되었습니다.");
    }
}

		        

	  //상세보기 스크립트 끝
	  
	 