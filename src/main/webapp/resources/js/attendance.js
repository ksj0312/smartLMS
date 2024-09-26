function attInfo(c_number) {
  	 $.ajax({
       url: "attInfo", 
       type: "GET", 
       data: {c_number : c_number}, 
       contentType: "application/json",
       success: function(response) { 
       console.log(response);
       		$("#c_number").val(c_number);
	       values = response.attList;
	        $('#infoTable').empty(); 
	        
	       	$("#infoTable").append(
	           `<tr>
	                  <th>학번</th>
	                  <th>이름</th>
	                  <th>출석</th>
	                  <th>지각</th>
	                  <th>조퇴</th>
	                  <th>결석</th>
	             </tr>`
	         );
	         $.each(values, function(index, value){
	            	$("#infoTable").append(
	                    `
	         			<tr id ="attList">
	                      <td name="id_${value.id}" value="${value.id}">${value.id}</td>
	                      <td name="name_${value.id}" value="${value.name}">${value.name}</td>
	                      <td name="attendance_${value.id}" value="${value.attendance}">${value.attendance}</td>
	                      <td name="tardy_${value.id}" value="${value.tardy}">${value.tardy}</td>
	                      <td name="early_${value.id}" value="${value.early}">${value.early}</td>
	                      <td name="absent_${value.id}" value="${value.absent}">${value.absent}</td>
	                     </tr>`
	  				);
	 		 });
       },
       error: function(xhr, status, error) { 
       		alert("수강생 정보 조회에 실패하였습니다. 다시 시도해주세요.");
       }
   });
}   
   function getUrl(currPageNo, range, searchType, keyword) {
 						 return `/attendance?currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
						}
						
                     //이전 버튼
                                function fn_prev(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range - 1) * pageSize;
                                        var range = range - 1;
        
                                        location.href = getUrl(currPageNo, range, searchType, keyword);
        
                                }

                                //페이지 번호 클릭
        
                                function fn_pagination(currPageNo, range) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                 
                                        location.href = getUrl(currPageNo, range, searchType, keyword);
        
                                }
                                //다음 버튼 이벤트
                                function fn_next(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range * pageSize) + 1;
                                        var range = parseInt(range) + 1;
        
                                        location.href =  getUrl(currPageNo, range, searchType, keyword);
                                }
			